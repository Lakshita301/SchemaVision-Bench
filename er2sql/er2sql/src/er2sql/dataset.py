"""
Dataset wiring.

You already have Module 1's output: three folders of ER diagram
images (one per tier) and matching folders of ground-truth SQL DDL
files. This module's only job is to *pair them up* by filename stem
(e.g. `schema_0001.png` <-> `schema_0001.sql`) so the pipeline can
iterate over them -- it does no parsing, rendering, or dataset
construction of its own (that remains Module 1, which you already
have and this project does not reimplement).

See README.md "Wiring in your data" section for the exact folder
layout this expects, and how to point config.yaml at your real paths.
"""

from __future__ import annotations

import logging
from dataclasses import dataclass
from pathlib import Path

logger = logging.getLogger("er2sql.dataset")

IMAGE_EXTENSIONS = (".png", ".jpg", ".jpeg", ".PNG", ".JPG", ".JPEG")
SQL_EXTENSIONS = (".sql", ".ddl", ".txt")


@dataclass
class SchemaRecord:
    schema_id: str
    tier: str
    image_path: str
    sql_path: str


@dataclass
class DatasetDiscoveryReport:
    records: list[SchemaRecord]
    unmatched_images: list[str]
    unmatched_sql: list[str]

    def summary(self) -> str:
        return (
            f"{len(self.records)} matched pairs, "
            f"{len(self.unmatched_images)} images with no matching SQL, "
            f"{len(self.unmatched_sql)} SQL files with no matching image"
        )


def _index_by_stem(directory: Path, extensions: tuple[str, ...]) -> dict[str, Path]:
    index: dict[str, Path] = {}
    if not directory.exists():
        return index
    for entry in sorted(directory.iterdir()):
        if entry.is_file() and entry.suffix in extensions:
            index[entry.stem] = entry
    return index


def discover_tier_dataset(
    diagrams_dir: str | Path, sql_dir: str | Path, tier: str
) -> DatasetDiscoveryReport:
    """
    Pair every diagram image in `diagrams_dir` with the ground-truth
    SQL file of the same stem in `sql_dir`. Matching is exact-stem
    only (case sensitive) on purpose, since the project notes state
    these folders are already "labeled corresponding to each other".
    """
    diagrams_dir = Path(diagrams_dir)
    sql_dir = Path(sql_dir)

    image_index = _index_by_stem(diagrams_dir, IMAGE_EXTENSIONS)
    sql_index = _index_by_stem(sql_dir, SQL_EXTENSIONS)

    matched_stems = sorted(set(image_index) & set(sql_index))
    unmatched_images = sorted(set(image_index) - set(sql_index))
    unmatched_sql = sorted(set(sql_index) - set(image_index))

    records = [
        SchemaRecord(
            schema_id=stem,
            tier=tier,
            image_path=str(image_index[stem]),
            sql_path=str(sql_index[stem]),
        )
        for stem in matched_stems
    ]

    if unmatched_images:
        logger.warning(
            "[%s] %d image(s) had no matching SQL file: %s",
            tier,
            len(unmatched_images),
            unmatched_images[:10],
        )
    if unmatched_sql:
        logger.warning(
            "[%s] %d SQL file(s) had no matching image: %s",
            tier,
            len(unmatched_sql),
            unmatched_sql[:10],
        )

    return DatasetDiscoveryReport(
        records=records,
        unmatched_images=[str(image_index[s]) for s in unmatched_images],
        unmatched_sql=[str(sql_index[s]) for s in unmatched_sql],
    )


def compute_common_schema_ids(
    reports_by_tier: dict[str, DatasetDiscoveryReport],
) -> set[str]:
    """
    Given a discovery report per tier, return the set of schema_ids
    that are present (i.e. successfully matched to a diagram + SQL
    pair) in EVERY tier passed in.

    This exists because per-tier matching alone is not enough for the
    three-tier robustness experiment: that experiment requires the
    same underlying schema to exist as a valid instance in tier1,
    tier2, AND tier3 simultaneously. It's common for individual tier
    folders to contain a few extra diagrams beyond the audited clean
    set (e.g. left over from an earlier Module 1 pass with rendering
    issues), which would otherwise silently unbalance the tiers.
    """
    if not reports_by_tier:
        return set()

    id_sets = [
        {rec.schema_id for rec in report.records}
        for report in reports_by_tier.values()
    ]
    common = id_sets[0]
    for s in id_sets[1:]:
        common &= s
    return common


def filter_records_by_ids(
    report: DatasetDiscoveryReport, allowed_ids: set[str]
) -> list[SchemaRecord]:
    """Return only the records from `report` whose schema_id is in `allowed_ids`."""
    return [rec for rec in report.records if rec.schema_id in allowed_ids]
