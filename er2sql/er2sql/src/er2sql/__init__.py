"""
er2sql
======

Multi-agent pipeline for ER Diagram -> SQL DDL generation.

This package implements the ER Diagram -> SQL research pipeline:

    Module 2 : ER Diagram Parsing Agent   (image -> canonical JSON IR)
    Module 3 : SQL Generation Agent       (canonical JSON IR -> SQL DDL)
    Module 4 : Deterministic Constraint Test Generator
    Module 5 : PostgreSQL Execution and Verification
    Module 6 : Direct Image-to-SQL Baseline
    Module 7 : Two-arm Experiment Orchestration, Evaluation, and Reporting

Module 3 receives ONLY the canonical JSON IR produced by Module 2.
It never receives the original ER diagram image. This is a hard
architectural constraint of the research design (see
ER-SCHEMA2SQL_RESEARCH_PLAN___LOCKED_DIRECTION) and is enforced
structurally in module3_generation/agent.py -- the function that
calls the SQL Generation Agent has no image parameter at all.

All per-schema artifacts are JSON-serializable so final experiments can be
resumed, independently audited, and aggregated into paper-level reports.
"""

__version__ = "0.1.0"
