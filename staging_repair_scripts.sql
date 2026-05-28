-- ============================================================================
-- PART 3: PHASE 2 - ACTIVE REPAIR SCRIPTS (DML CORRECTIONS)
-- ============================================================================

-- 1. Fixing Malformed Email Structures
UPDATE students
SET email = LOWER(TRIM(email))
WHERE email LIKE '% ';

UPDATE students
SET email = 'review_required_' || student_id || '@platform.local'
WHERE email NOT LIKE '%_@__%.__%';

-- 2. Correcting Chronological (Date/Time) Violations
UPDATE sessions
SET logout_time = login_time
WHERE logout_time < login_time;

-- 3. Rectifying Boundary Score and Time Violations
UPDATE test_results
SET runtime_ms = 0
WHERE runtime_ms < 0;

-- 4. Eliminating Enrollment Overlap Redundancy
DELETE FROM enrollments
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM enrollments
    GROUP BY student_id, batch_id
);
