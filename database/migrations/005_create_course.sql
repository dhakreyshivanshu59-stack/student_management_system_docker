/*
=================================================
FILE INFORMATION
=================================================
File Name     :005_create_course.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-20
Description   :creates the `course` table for academic courses.
               This is the fivth table in the migration order
=================================================

*/

CREATE TABLE IF NOT EXISTS course(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL,
    description TEXT,
    duration_year INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_course_code ON course (code);
CREATE INDEX idx_course_is_active ON course (is_active);

COMMENT ON TABLE course  IS 'academic courses offered B.Tech (CSE)';
COMMENT ON COLUMN course.name IS 'full course name';
COMMENT ON COLUMN course.code IS 'unique course code';
COMMENT ON COLUMN course.duration_year IS 'Number of year for the c ourse';
COMMENT ON COLUMN course.is_active IS 'whether the course is offerd or not';


