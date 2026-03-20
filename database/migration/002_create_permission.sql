/*
=================================================
FILE INFORMATION
=================================================
File Name     :002_create_permission.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-20
Description   :creates the `permission` table which stores granular permission.
               This is the second table in the migration order
=================================================
*/
CREATE TABLE IF NOT EXISTS permission(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	description TEXT,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	
);
SELECT * FROM permission;

COMMENT ON TABLE permission IS 'granular permissions that can be assigned to roles';
COMMENT ON COLUMN permission.id IS 'auto incrementing primary key';
COMMENT ON COLUMN permission.name IS 'unique permission name e.g., "student.view"';
COMMENT ON COLUMN permission.description IS 'optional';
COMMENT ON COLUMN permission.create_at IS 'UTC TIMESTAMP when the permission was created';

SELECT obj_description('permission' :: regclass) AS table_comment;

SELECT column_name, pg_catalog.col_description (('permission':: regclass)::oid, ordinal_position) AS column_comment
FROM information_schema.columns
WHERE table_name = 'permission'
ORDER BY ordinal_position;