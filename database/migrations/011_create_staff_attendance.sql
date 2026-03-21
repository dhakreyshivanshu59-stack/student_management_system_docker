/*
=================================================
FILE INFORMATION
=================================================
File Name     :005_create_staff.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-20
Description   :creates the `staff` table for all staff member(teachers, admin, manager, etc.,.).
               This is the tenth table in the migration order
=================================================

*/

CREATE TABLE IF NOT EXISTS staff_attendence(
    id SERIAL PRIMARY KEY,
    staff_id INTEGER NOT NULL,
    date DATE,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20) DEFAULT 'Present' CHECK (status IN('Present', 'Absent','Late', 'Half Day', 'Leave')),
    remarks TEXT,
    recorded_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_staff_attendence_staff FOREIGN KEY (staff_id) REFERENCES staff(id) ON DELETE CASCADE,
    CONSTRAINT fk_staff_attendence_recorded_by FOREIGN KEY (recorded_by) REFERENCES staff(id) ON DELETE  SET NULL,
    CONSTRAINT unique_staff_attendence_date UNIQUE (staff_id, date)

    /*
     * CONSTRAINT fk_staff_attendence_staff FOREIGN KEY (staff_id) REFERENCES staff_id ON DELETE CASCADE;
     * when a record in the `staff` table is deleted, all rows in staff_attendence that refered to that staff_id automatically os deleted as well.
     * eg.., if a staff member leaves the institution and we remove there record from staff, we also want 
     * to remove their attendence history (since it no longer exist). This keeps the database clean.     
    */
	
    /* 
	 * CONSTRAINT fk_staff_attendence_recorded_by FOREIGN KEY (recorded_by) REFERENCES staff_id ON DELETE CASCADE SET NULL;
     * when a staff member who recorded an attendence is deleted , the recoded_by by column in staff_attendence is sait to NULL. 
	 Instead of deleting the attendence record e.g the attendence record itself is still usefull (it tells us a staff member was present and absent) even if the person who recorded it is no longer in the syatem.
	 We dont want to loss that  data,so we just set the recorded_by reference
    */
	
    /* 
	 * CONSTRAINT unique_staff_attendence_date UNIQUE (staff_id, date);
     * ensure that for a given staff_id and date, their can be only one row in the table
     * e.g., a staff member should have only one attendence record per day (no duplicate).
	 This prevents accidental duplicate entries for the same day.
     */

     /*
      * NULL means "no values" or unknown. It's not the same as empty string or 0.
      * A column can be defined as NULL (the default value if you dont specify) or NOT NULL.
      * NOT NULL forces a column to always have a value. You can't insert a row without providing a value for that column.
      * In our above table:
      * 	staff_id is NOT NULL (implicitly because it is a foreign key without set NULL and we have ON DELETE CASCADE)
     */

    
);

CREATE INDEX idx_staff_attendence_staff_id ON staff_attendence(staff_id);
CREATE INDEX idx_staff_attendence_date ON staff_attendence(date);
CREATE INDEX idx_staff_attendence_status ON staff_attendence(status);


COMMENT ON TABLE staff_attendence IS 'daily attendence records for staff(punch in by out)';
COMMENT ON COLUMN staff_attendence.staff_id IS 'reference staff.id';
COMMENT ON COLUMN staff_attendence.date IS 'attendence date';
COMMENT ON COLUMN staff_attendence.check_out IS 'punch out time';
COMMENT ON COLUMN staff_attendence.check_in IS 'punch in time';
COMMENT ON COLUMN staff_attendence.status IS 'attendence status';
COMMENT ON COLUMN staff_attendence.recorded_by IS 'staff who rocorded this(system & HR)';


