/*
=================================================
FILE INFORMATION
=================================================
File Name     :002_create_role_permission.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-20
Description   :creates the `role_permission` table which maps roles to permission .
               This is the third table in the migration order
=================================================
*/

CREATE TABLE IF NOT EXISTS role_permission(
	id SERIAL PRIMARY KEY,
	role_id INTEGER NOT NULL,
	permission_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
	CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id)  REFERENCES permission(id) ON DELETE CASCADE,
	CONSTRAINT unique_role_permission UNIQUE (role_id, permission_id)
);
COMMENT ON TABLE role_permission IS 'maps roles to permissions (MANY-TO-MANY)';
COMMENT ON COLUMN role_permission.id IS 'Auto incrementing primary';
COMMENT ON COLUMN role_permission.role_id IS 'foreign key to role.id';
COMMENT ON COLUMN role_permission.permission_id IS 'foreign key to permission.id';
COMMENT ON COLUMN role_permission.created_at IS 'UTC TIMESTAMP when the mapping was created';
CREATE INDEX IF NOT EXISTS idx_role_permission_role ON role_permission(role_id);
CREATE INDEX IF NOT EXISTS idx_role_permission_permission On role_permission(permission_id);