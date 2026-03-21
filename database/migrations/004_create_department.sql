/*
=================================================
FILE INFORMATION
=================================================
File Name     :004_create_department.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-20
Description   :creates the `department table which stores system roles.
               This is the first table in the migration order
=================================================

*/

CREATE TABLE IF NOT EXISTS department(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_deparment_name ON department (name);
CREATE INDEX idx_deparment_is_active ON department (is_active);

COMMENT ON TABLE department IS 'Organisational departments (e.g., CSE, ECE, ME)';
COMMENT ON COLUMN department.name IS 'Unique department name';
COMMENT ON COLUMN department.description IS 'Brief description of the department';
COMMENT ON COLUMN department.is_active IS 'Soft disable flag for department';