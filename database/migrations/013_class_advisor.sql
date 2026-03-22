/*
=================================================
FILE INFORMATION
=================================================
File Name     :013_create_class_advisor.sql
Developer     :Shivanshu Dhakrey
Contact       :dhareyshivanshu59@gmail.com
Version       :1.0.0
Date          :2026-03-22
Description   :creates the `class_advisor` table for faculty section allotment.
               This is the twelth table in the migration order
=================================================

*/

CREATE TABLE IF NOT EXISTS class_advisor(
    id SERIAL PRIMARY KEY,
    staff_id INTEGER NOT NULL,
    section_id INTEGER NOT NULL,
    academic_session_id INTEGER NOT NULL,  
    semester INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  

    CONSTRAINT fk_class_advisor_staff FOREIGN KEY (staff_id) REFERENCES staff(id) ON DELETE CASCADE,
    CONSTRAINT fk_class_advisor_section_id FOREIGN KEY (section_id) REFERENCES section(id)  ON DELETE CASCADE,
    CONSTRAINT fk_class_advisor_academic_session_id FOREIGN KEY (academic_session_id) REFERENCES academic_session(id) ON DELETE CASCADE,

    CONSTRAINT unique_class_advisor_id UNIQUE(staff_id, section_id, academic_session_id, semester)

) ;

CREATE INDEX idx_class_advisor_staff_id ON class_advisor(staff_id);
CREATE INDEX idx_class_advisor_section_id ON class_advisor(section_id);
CREATE INDEX idx_class_advisor_academic_session_id ON class_advisor(academic_session_id);
CREATE INDEX idx_class_advisor_semester ON class_advisor(semester);
CREATE INDEX idx_class_advisor_is_active ON class_advisor(is_active);

COMMENT ON TABLE class_advisor IS 'class advisor for section and semester';
COMMENT ON COLUMN class_advisor.staff_id IS 'references the advisor';
COMMENT ON COLUMN class_advisor.section_id IS 'references section.id';
COMMENT ON COLUMN class_advisor.academic_session_id IS 'references academic_session.id';
COMMENT ON COLUMN class_advisor.is_active IS 'whether this assignment is active or not';
COMMENT ON COLUMN class_advisor.assigned_at IS 'when the assignment was created';