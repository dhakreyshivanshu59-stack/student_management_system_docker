/*
=================================================
FILE INFORMATION
=================================================
File Name     :005_create_room.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-20
Description   :creates the `room` table for physical classroom by rooms.
               This is the ninth table in the migration order
=================================================

*/


CREATE TABLE IF NOT EXISTS room(
    id SERIAL PRIMARY KEY,
    room_number VARCHAR(20) UNIQUE NOT NULL,
    capacity INTEGER,
    building VARCHAR(100),
    floor INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE INDEX idx_room_number ON room(room_number);
CREATE INDEX idx_room_building ON room(building);
CREATE INDEX idx_room_is_active ON room(is_active);

COMMENT ON TABLE room IS 'physical classroom by room for timetable and exam scheduling';
COMMENT ON COLUMN room.room_number IS  'room number and indentifier by room';
COMMENT ON COLUMN room.capacity IS 'maximun sitting capacity name';
COMMENT ON COLUMN room.building IS 'building number';
COMMENT ON COLUMN room.floor IS 'floor number';
COMMENT ON COLUMN room.is_active IS 'whether the room is currently active for scheduling for active or not';

