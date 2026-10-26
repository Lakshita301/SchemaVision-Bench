"""Small, dependency-free IO helpers used across the pipeline."""

from __future__ import annotations

import json
import re
import os
import tempfile
import uuid
import shutil
from pathlib import Path
from typing import Any

_CODE_FENCE_RE = re.compile(r"^```[a-zA-Z0-9_+-]*\n|\n```$|^```$", re.MULTILINE)


def ensure_dir(path: str | Path) -> Path:
    p = Path(path)
    p.mkdir(parents=True, exist_ok=True)
    return p


def read_text_file(path: str | Path, encoding: str = "utf-8") -> str:
    with open(path, "r", encoding=encoding, errors="replace") as f:
        return f.read()


def write_json(path: str | Path, data: Any, indent: int = 2) -> None:
    path = Path(path)
    ensure_dir(path.parent)
    # Keep prior schema attempts and publish atomically, including on Windows.
    if path.exists() and path.name.startswith("schema_"):
        archive = ensure_dir(path.parent / "attempt_history" / path.stem)
        shutil.copy2(path, archive / f"{uuid.uuid4().hex}.json")
    fd, temporary = tempfile.mkstemp(prefix=".pending-", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=indent, ensure_ascii=False)
            f.flush()
            os.fsync(f.fileno())
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)
def read_json(path: str | Path) -> Any:
    """Read and deserialize a JSON file."""
    path = Path(path)
    # PowerShell's default JSON output may include a UTF-8 BOM. Accept it
    # transparently so frozen manifests remain readable across tools.
    with open(path, "r", encoding="utf-8-sig") as f:
        return json.load(f)


def write_text(path: str | Path, text: str) -> None:
    path = Path(path)
    ensure_dir(path.parent)
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)


def strip_code_fences(text: str) -> str:
    """
    Strip surrounding ```json / ```sql / ``` fences that LLMs love to
    add even when explicitly told not to. Only strips fences at the
    very start/end of the string, never fences that appear mid-text.
    """
    text = text.strip()
    if text.startswith("```"):
        first_newline = text.find("\n")
        if first_newline != -1:
            text = text[first_newline + 1 :]
    if text.endswith("```"):
        text = text[: -3]
    return text.strip()


def extract_first_json_object(text: str) -> str:
    """
    Best-effort extraction of the first top-level {...} JSON object
    from a string, in case the model wraps valid JSON in stray prose
    despite instructions not to. Falls back to returning the (fence
    stripped) text unchanged if no clear object boundary is found.
    """
    text = strip_code_fences(text)
    start = text.find("{")
    if start == -1:
        return text
    depth = 0
    for i in range(start, len(text)):
        ch = text[i]
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return text[start : i + 1]
    return text
