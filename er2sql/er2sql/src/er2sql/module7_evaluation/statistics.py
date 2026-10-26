"""Pre-specified, schema-clustered descriptive uncertainty (no IID test CIs)."""
from collections import defaultdict
import random
import statistics

SEED = 20260930
REPLICATES = 5000
METRICS = ("ddl_execution_success", "compile_success", "macro_cer_all", "end_to_end_success")


def value(row, metric):
    if metric == "macro_cer_all":
        return float(row.get("planned_constraint_pass_rate") or 0)
    if metric == "compile_success":
        return float(bool(row.get("ddl_execution_success")))
    return float(bool(row.get(metric)))


def interval(values):
    ordered = sorted(values)
    def q(p):
        x = (len(ordered) - 1) * p
        i = int(x)
        return ordered[i] + (ordered[min(i + 1, len(ordered) - 1)] - ordered[i]) * (x - i)
    return {"lower": q(.025), "upper": q(.975)}


def clustered_estimates(rows, reference=None, replicates=REPLICATES):
    """Resample schema IDs retaining all matched tiers. Delta is primary-reference."""
    if reference is not None:
        ref = {(r['schema_id'], r['tier']): r for r in reference}
        rows = [r for r in rows if (r['schema_id'], r['tier']) in ref]
    grouped = defaultdict(list)
    for row in rows:
        grouped[row['schema_id']].append(row)
    ids = sorted(grouped)
    result = {"unit": "unique_schema_id", "clusters": len(ids), "seed": SEED,
              "replicates": replicates, "method": "paired cluster percentile bootstrap",
              "exploratory": len(ids) < 30, "metrics": {}}
    if not ids:
        return result
    rng = random.Random(SEED)
    draws = [rng.choices(ids, k=len(ids)) for _ in range(replicates)]
    for metric in METRICS:
        sums = {}
        for sid in ids:
            vals = [value(r, metric) - (value(ref[(r['schema_id'], r['tier'])], metric) if reference is not None else 0)
                    for r in grouped[sid]]
            sums[sid] = (sum(vals), len(vals))
        point = sum(x[0] for x in sums.values()) / sum(x[1] for x in sums.values())
        samples = [sum(sums[s][0] for s in draw) / sum(sums[s][1] for s in draw) for draw in draws]
        result['metrics'][metric] = {"estimate": point, "ci95": interval(samples)}
    return result
