/*
=================================================
FILE INFORMATION
=================================================
File Name     :001_create_role.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-20
Description   :creates the `role` table which stores system roles.
               This is the first table in the migration order
=================================================
what is migration?
A database migration is like a version control system for your database
*/
DROP TABLE IF EXISTS role CASCADE;

CREATE TABLE IF NOT EXISTS role(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL CHECK(name IN('superadmin','admin', 'teacher', 'manager','student','parent')),
    description TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM role;

COMMENT ON TABLE role IS 'system roles (superadmin,admin,manager, teacher, student,parent)';
COMMENT ON COLUMN role.id IS 'auto incrementing primary key';
COMMENT ON COLUMN role.name IS 'unique name';
COMMENT ON COLUMN role.description IS 'optional';
COMMENT ON COLUMN role.create_at IS 'UTC timestamp when the role is created';

-- ==============================================================================
-- Initial Data
--===============
INSERT INTO role (name, description) VALUES 
('superadmin', 'FULL SYSTEM ACCESS'),
('admin', 'ADMINSTRATIVE STAFF'),
('manager', 'LIMITED ADMINSTRATIVE ACCESS'),
('student', 'DEFAULT ROLE FOR STUDENT'),
('parent', 'PARENT BY GAURDIAN ROLE'),
('teacher', 'Teaching Staff')
ON CONFLICT (name) DO NOTHING;


select * from role;

SELECT column_name, data_type, is_nullable, column_default 
FROM information_schema.columns
WHERE table_name = 'role';

SELECT obj_description('role' :: regclass) AS table_comment;

SELECT column_name, pg_catalog.col_description (('role':: regclass)::oid, ordinal_position) AS column_comment
FROM information_schema.columns
WHERE table_name = 'role'
ORDER BY ordinal_position;
