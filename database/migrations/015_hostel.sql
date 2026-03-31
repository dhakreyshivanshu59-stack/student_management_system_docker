FILE INFORMATION
=================================================
File Name     :013_create_hostel.sql
Developer     :Shivanshu Dhakrey
Version       :1.0.0
Date          :2026-03-23
Description   :Creates the `hostel` table
=================================================
*/

CREATE TABLE IF NOT EXISTS hostel (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL,
    total_rooms INTEGER,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

