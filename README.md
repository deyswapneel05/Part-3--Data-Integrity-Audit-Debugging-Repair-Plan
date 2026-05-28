# Part-3--Data-Integrity-Audit-Debugging-Repair-Plan

# CodeJudge Database System - Part 3: Data Integrity Audit, Debugging & Repair Plan

This repository contains the complete execution scripts, structural audit findings, data isolation logs, and production-grade repair workflows designed to stabilize the CodeJudge Online Coding Platform's data layer.

## 📋 Overview of Repository Files

The core deliverable files included in this repository map to specific data cleaning and engineering pipelines:

1. **`README.md`** - Main dashboard index documenting file structures and project scope.
2. **`import_validation.sql`** - Initial scripts focused on raw row-count checks, verification of input volume against standard CSV baselines, and detection of empty tables.
3. **`integrity_audit.sql`** - Advanced query mechanisms scanning for active database anomalies, including candidate key syntax errors, logical time-reversals, and negative metric parameters.
4. **`domain_rule_checks.sql`** - Dedicated domain constraint mapping scripts targeting language stacks, unexpected null blocks, and evaluation statuses.
5. **`repair_plan.md`** - A comprehensive architectural strategy detailing fail-safe backup phases, manual verification loops, and preventative backend validations.
6. **`staging_repair_scripts.sql`** - Isolated sandbox testing environment scripts written to safely apply active `UPDATE` and `DELETE` adjustments without touching live user layers.
7. **`before_after_evidence.md`** - A concise analytical log recording baseline vs. corrected database behaviors to verify system correctness.

## 🛠️ Safe Execution Protocol

To minimize data corruption, structural remediation follows a strict three-tier lifecycle model:
* **Audit and Mapping:** Identifying dirty structures using the automated script files (`integrity_audit.sql`, `domain_rule_checks.sql`).
* **Sandbox Verification:** Cloning the tables into temporary staging mirrors and testing cleaning routines inside `staging_repair_scripts.sql`.
* **Prevention Injection:** Altering table constraints (`CHECK` parameters, `Composite Keys`) to permanently block malformed telemetry streams from breaching production channels.
