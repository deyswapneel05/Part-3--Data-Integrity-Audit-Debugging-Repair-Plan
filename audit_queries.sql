-- ============================================================================
-- PART 3: DATA INTEGRITY AUDIT QUERIES
-- ============================================================================

-- Audit 1: Missing Foreign Key References (Orphaned Enrollments)
-- Finds students listed in enrollments who do not exist in the main students table.
SELECT e.student_id AS orphaned_student_id, e.batch_id
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.student_id
WHERE s.student_id IS NULL;


-- Audit 2: Invalid or Malformed Email Formats
-- Identifies student accounts with syntax errors in their emails.
SELECT student_id, name, email
FROM students
WHERE email NOT LIKE '%_@__%.__%' 
   OR email LIKE '% %' 
   OR email IS NULL;


-- Audit 3: Chronological Discrepancies (Logical Date Violations)
-- Finds user sessions where the logout time occurs before the login time.
SELECT session_id, student_id, login_time, logout_time
FROM sessions
WHERE logout_time IS NOT NULL AND logout_time < login_time;


-- Audit 4: Impossible or Out-of-Bounds Performance Configurations
-- Detects runtime results where execution times or memory parameters are negative.
SELECT result_id, submission_id, runtime_ms
FROM test_results
WHERE runtime_ms < 0;


-- Audit 5: Duplicate Registrations or Redundant Unique Constraints
-- Detects students who are registered multiple times in the exact same batch.
SELECT student_id, batch_id, COUNT(*) AS duplicate_count
FROM enrollments
GROUP BY student_id, batch_id
HAVING COUNT(*) > 1;
