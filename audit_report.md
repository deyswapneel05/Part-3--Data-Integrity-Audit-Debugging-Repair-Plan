# Part 3 — Data Integrity Audit Report

This report documents anomalous patterns, structural constraints violations, and raw dirty records identified during the system-wide database integrity check.

## Identified System Discrepancies & Violations

### 1. Orphaned Referential Integrities
* **Observation:** The `enrollments` collection contains multiple entries mapped to `student_id` vectors that do not match any row inside the primary database register (`students`).
* **Impact:** Running analytics over active batch sizing returns inflated metrics since non-existent accounts are being computed.

### 2. Syntactically Damaged Candidate Keys
* **Observation:** String structural audits detected rows in `students` where email strings contain missing domains, multi-at signs (`@@`), or whitespaces.
* **Impact:** Automated platform notification subroutines and password-reset engines fail during execution loops.

### 3. Temporal Realtime Anomalies
* **Observation:** The `sessions` tracking entity records several rows where `logout_time` logs happen chronologically prior to `login_time`.
* **Impact:** Active usage hours analysis engines throw negative delta overflows and skew server cluster cost predictions.

### 4. Boundary Constraint Overflows
* **Observation:** The computational analytics grid `test_results` stores execution timing metrics (`runtime_ms`) less than zero.
* **Impact:** Average runtime monitoring boards generate logically broken zeroed metrics.

### 5. Multi-Instance Structural Duplications
* **Observation:** The `enrollments` relational bridge bypasses clean composite rules, letting identical `student_id` and `batch_id` pairings append repeatedly.
* **Impact:** Batch lecture attendance records generate redundant records per session.
