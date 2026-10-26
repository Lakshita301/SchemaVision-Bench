"""Helpers for turning an ER diagram image file into an API-ready payload."""

from __future__ import annotations

import base64
import mimetypes
from pathlib import Path

_DEFAULT_MIME = "image/png"


def guess_image_mime(path: str | Path) -> str:
    mime, _ = mimetypes.guess_type(str(path))
    if mime is None or not mime.startswith("image/"):
        return _DEFAULT_MIME
    return mime


def encode_image_data_url(path: str | Path) -> str:
    """Read an image file from disk and return a base64 data: URL."""
    path = Path(path)
    if not path.exists():
        raise FileNotFoundError(f"ER diagram image not found: {path}")
    mime = guess_image_mime(path)
    with open(path, "rb") as f:
        raw = f.read()
    encoded = base64.b64encode(raw).decode("utf-8")
    return f"data:{mime};base64,{encoded}"
