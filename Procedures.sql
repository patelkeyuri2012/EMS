CREATE OR REPLACE PACKAGE designation_pkg IS
    PROCEDURE insert_designation(
        p_designation_id IN NUMBER,
        p_designation_title IN VARCHAR2,
        p_designation_details IN VARCHAR2,
        p_department_id IN NUMBER,
        p_designation_status IN NUMBER
    );
    PROCEDURE update_designation(
        p_designation_id IN NUMBER,
        p_designation_title IN VARCHAR2,
        p_designation_details IN VARCHAR2,
        p_department_id IN NUMBER,
        p_designation_status IN NUMBER
    );
    PROCEDURE delete_designation(p_designation_id IN NUMBER);
END designation_pkg;
/

CREATE OR REPLACE PACKAGE BODY designation_pkg IS
    PROCEDURE insert_designation(
        p_designation_id IN NUMBER,
        p_designation_title IN VARCHAR2,
        p_designation_details IN VARCHAR2,
        p_department_id IN NUMBER,
        p_designation_status IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Designations (designation_id, designation_title, designation_details, department_id, designation_status)
        VALUES (p_designation_id, p_designation_title, p_designation_details, p_department_id, p_designation_status);
    END insert_designation;

    PROCEDURE update_designation(
        p_designation_id IN NUMBER,
        p_designation_title IN VARCHAR2,
        p_designation_details IN VARCHAR2,
        p_department_id IN NUMBER,
        p_designation_status IN NUMBER
    ) IS
    BEGIN
        UPDATE Designations
        SET designation_title = p_designation_title,
            designation_details = p_designation_details,
            department_id = p_department_id,
            designation_status = p_designation_status
        WHERE designation_id = p_designation_id;
    END update_designation;

    PROCEDURE delete_designation(p_designation_id IN NUMBER) IS
    BEGIN
        DELETE FROM Designations
        WHERE designation_id = p_designation_id;
    END delete_designation;
END designation_pkg;
/


CREATE OR REPLACE PACKAGE employees_pkg IS
    PROCEDURE insert_employee(
        p_employee_id IN NUMBER,
        p_first_name IN VARCHAR2,
        p_last_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_phone_numbers IN phone_numbers_varray,
        p_dob IN DATE,
        p_gender IN VARCHAR2,
        p_address IN address_nested_table,
        p_joining_date IN DATE,
        p_department_id IN NUMBER,
        p_designation_id IN NUMBER,
        p_status_id IN NUMBER
    );
    PROCEDURE update_employee(
        p_employee_id IN NUMBER,
        p_first_name IN VARCHAR2,
        p_last_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_phone_numbers IN phone_numbers_varray,
        p_dob IN DATE,
        p_gender IN VARCHAR2,
        p_address IN address_nested_table,
        p_joining_date IN DATE,
        p_department_id IN NUMBER,
        p_designation_id IN NUMBER,
        p_status_id IN NUMBER
    );
    PROCEDURE delete_employee(p_employee_id IN NUMBER);
END employees_pkg;
/

CREATE OR REPLACE PACKAGE BODY employees_pkg IS
    PROCEDURE insert_employee(
        p_employee_id IN NUMBER,
        p_first_name IN VARCHAR2,
        p_last_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_phone_numbers IN phone_numbers_varray,
        p_dob IN DATE,
        p_gender IN VARCHAR2,
        p_address IN address_nested_table,
        p_joining_date IN DATE,
        p_department_id IN NUMBER,
        p_designation_id IN NUMBER,
        p_status_id IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Employees (
            employee_id, employee_first_name, employee_last_name, employee_email,
            employee_phone_numbers, employee_date_of_birth, employee_gender,
            employee_address, employee_joining_date, department_id, employee_designation,
            employee_status
        )
        VALUES (
            p_employee_id, p_first_name, p_last_name, p_email, p_phone_numbers,
            p_dob, p_gender, p_address, p_joining_date, p_department_id,
            p_designation_id, p_status_id
        );
    END insert_employee;

    PROCEDURE update_employee(
        p_employee_id IN NUMBER,
        p_first_name IN VARCHAR2,
        p_last_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_phone_numbers IN phone_numbers_varray,
        p_dob IN DATE,
        p_gender IN VARCHAR2,
        p_address IN address_nested_table,
        p_joining_date IN DATE,
        p_department_id IN NUMBER,
        p_designation_id IN NUMBER,
        p_status_id IN NUMBER
    ) IS
    BEGIN
        UPDATE Employees
        SET employee_first_name = p_first_name,
            employee_last_name = p_last_name,
            employee_email = p_email,
            employee_phone_numbers = p_phone_numbers,
            employee_date_of_birth = p_dob,
            employee_gender = p_gender,
            employee_address = p_address,
            employee_joining_date = p_joining_date,
            department_id = p_department_id,
            employee_designation = p_designation_id,
            employee_status = p_status_id
        WHERE employee_id = p_employee_id;
    END update_employee;

    PROCEDURE delete_employee(p_employee_id IN NUMBER) IS
    BEGIN
        DELETE FROM Employees
        WHERE employee_id = p_employee_id;
    END delete_employee;
END employees_pkg;
/



CREATE OR REPLACE PACKAGE departments_pkg IS
    PROCEDURE insert_department(
        p_department_id IN NUMBER,
        p_department_name IN VARCHAR2,
        p_department_details IN VARCHAR2,
        p_department_location IN NUMBER,
        p_department_status IN NUMBER
    );
    PROCEDURE update_department(
        p_department_id IN NUMBER,
        p_department_name IN VARCHAR2,
        p_department_details IN VARCHAR2,
        p_department_location IN NUMBER,
        p_department_status IN NUMBER
    );
    PROCEDURE delete_department(p_department_id IN NUMBER);
END departments_pkg;
/

CREATE OR REPLACE PACKAGE BODY departments_pkg IS
    PROCEDURE insert_department(
        p_department_id IN NUMBER,
        p_department_name IN VARCHAR2,
        p_department_details IN VARCHAR2,
        p_department_location IN NUMBER,
        p_department_status IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Departments (
            department_id, department_name, department_details,
            department_location, department_status
        )
        VALUES (
            p_department_id, p_department_name, p_department_details,
            p_department_location, p_department_status
        );
    END insert_department;

    PROCEDURE update_department(
        p_department_id IN NUMBER,
        p_department_name IN VARCHAR2,
        p_department_details IN VARCHAR2,
        p_department_location IN NUMBER,
        p_department_status IN NUMBER
    ) IS
    BEGIN
        UPDATE Departments
        SET department_name = p_department_name,
            department_details = p_department_details,
            department_location = p_department_location,
            department_status = p_department_status
        WHERE department_id = p_department_id;
    END update_department;

    PROCEDURE delete_department(p_department_id IN NUMBER) IS
    BEGIN
        DELETE FROM Departments
        WHERE department_id = p_department_id;
    END delete_department;
END departments_pkg;
/

CREATE OR REPLACE PACKAGE projects_pkg IS
    PROCEDURE insert_project(
        p_project_id IN NUMBER,
        p_project_name IN VARCHAR2,
        p_project_details IN VARCHAR2,
        p_project_assign_date IN DATE,
        p_project_allocate_date IN DATE,
        p_project_completion_date IN DATE,
        p_project_budget IN NUMBER,
        p_project_technologies_used IN NUMBER,
        p_project_status IN NUMBER
    );
    PROCEDURE update_project(
        p_project_id IN NUMBER,
        p_project_name IN VARCHAR2,
        p_project_details IN VARCHAR2,
        p_project_assign_date IN DATE,
        p_project_allocate_date IN DATE,
        p_project_completion_date IN DATE,
        p_project_budget IN NUMBER,
        p_project_technologies_used IN NUMBER,
        p_project_status IN NUMBER
    );
    PROCEDURE delete_project(p_project_id IN NUMBER);
END projects_pkg;
/

CREATE OR REPLACE PACKAGE BODY projects_pkg IS
    PROCEDURE insert_project(
        p_project_id IN NUMBER,
        p_project_name IN VARCHAR2,
        p_project_details IN VARCHAR2,
        p_project_assign_date IN DATE,
        p_project_allocate_date IN DATE,
        p_project_completion_date IN DATE,
        p_project_budget IN NUMBER,
        p_project_technologies_used IN NUMBER,
        p_project_status IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Projects (
            project_id, project_name, project_details, project_assign_date,
            project_allocate_date, project_completion_date, project_budget,
            project_technologies_used, project_status
        )
        VALUES (
            p_project_id, p_project_name, p_project_details, p_project_assign_date,
            p_project_allocate_date, p_project_completion_date, p_project_budget,
            p_project_technologies_used, p_project_status
        );
    END insert_project;

    PROCEDURE update_project(
        p_project_id IN NUMBER,
        p_project_name IN VARCHAR2,
        p_project_details IN VARCHAR2,
        p_project_assign_date IN DATE,
        p_project_allocate_date IN DATE,
        p_project_completion_date IN DATE,
        p_project_budget IN NUMBER,
        p_project_technologies_used IN NUMBER,
        p_project_status IN NUMBER
    ) IS
    BEGIN
        UPDATE Projects
        SET project_name = p_project_name,
            project_details = p_project_details,
            project_assign_date = p_project_assign_date,
            project_allocate_date = p_project_allocate_date,
            project_completion_date = p_project_completion_date,
            project_budget = p_project_budget,
            project_technologies_used = p_project_technologies_used,
            project_status = p_project_status
        WHERE project_id = p_project_id;
    END update_project;

    PROCEDURE delete_project(p_project_id IN NUMBER) IS
    BEGIN
        DELETE FROM Projects
        WHERE project_id = p_project_id;
    END delete_project;
END projects_pkg;
/


CREATE OR REPLACE PACKAGE emp_proj_assignments_pkg IS
    PROCEDURE insert_assignment(
        p_assignment_id IN NUMBER,
        p_assign_date IN DATE,
        p_allocate_date IN DATE,
        p_completion_date IN DATE,
        p_hours_allocated IN NUMBER,
        p_hours_work IN NUMBER,
        p_remarks IN VARCHAR2,
        p_project_id IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_role IN NUMBER,
        p_assignment_status IN NUMBER
    );
    PROCEDURE update_assignment(
        p_assignment_id IN NUMBER,
        p_assign_date IN DATE,
        p_allocate_date IN DATE,
        p_completion_date IN DATE,
        p_hours_allocated IN NUMBER,
        p_hours_work IN NUMBER,
        p_remarks IN VARCHAR2,
        p_project_id IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_role IN NUMBER,
        p_assignment_status IN NUMBER
    );
    PROCEDURE delete_assignment(p_assignment_id IN NUMBER);
END emp_proj_assignments_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_proj_assignments_pkg IS
    PROCEDURE insert_assignment(
        p_assignment_id IN NUMBER,
        p_assign_date IN DATE,
        p_allocate_date IN DATE,
        p_completion_date IN DATE,
        p_hours_allocated IN NUMBER,
        p_hours_work IN NUMBER,
        p_remarks IN VARCHAR2,
        p_project_id IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_role IN NUMBER,
        p_assignment_status IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Employee_Project_Assignments (
            assignment_id, assignment_assign_date, assignment_allocate_date,
            assignment_completion_date, assignment_hours_allocated, assignment_hours_work,
            assignment_remarks, project_id, employee_id, project_role, assignment_status
        )
        VALUES (
            p_assignment_id, p_assign_date, p_allocate_date, p_completion_date,
            p_hours_allocated, p_hours_work, p_remarks, p_project_id,
            p_employee_id, p_project_role, p_assignment_status
        );
    END insert_assignment;

    PROCEDURE update_assignment(
        p_assignment_id IN NUMBER,
        p_assign_date IN DATE,
        p_allocate_date IN DATE,
        p_completion_date IN DATE,
        p_hours_allocated IN NUMBER,
        p_hours_work IN NUMBER,
        p_remarks IN VARCHAR2,
        p_project_id IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_role IN NUMBER,
        p_assignment_status IN NUMBER
    ) IS
    BEGIN
        UPDATE Employee_Project_Assignments
        SET assignment_assign_date = p_assign_date,
            assignment_allocate_date = p_allocate_date,
            assignment_completion_date = p_completion_date,
            assignment_hours_allocated = p_hours_allocated,
            assignment_hours_work = p_hours_work,
            assignment_remarks = p_remarks,
            project_id = p_project_id,
            employee_id = p_employee_id,
            project_role = p_project_role,
            assignment_status = p_assignment_status
        WHERE assignment_id = p_assignment_id;
    END update_assignment;

    PROCEDURE delete_assignment(p_assignment_id IN NUMBER) IS
    BEGIN
        DELETE FROM Employee_Project_Assignments
        WHERE assignment_id = p_assignment_id;
    END delete_assignment;
END emp_proj_assignments_pkg;
/


CREATE OR REPLACE PACKAGE attendance_pkg IS
    PROCEDURE insert_attendance(
        p_attendance_id IN NUMBER,
        p_attendance_date IN DATE,
        p_check_in_time IN TIMESTAMP,
        p_check_out_time IN TIMESTAMP,
        p_total_hours_work IN NUMBER,
        p_overtime_hours IN NUMBER,
        p_employee_id IN NUMBER,
        p_attendance_status IN NUMBER
    );
    PROCEDURE update_attendance(
        p_attendance_id IN NUMBER,
        p_attendance_date IN DATE,
        p_check_in_time IN TIMESTAMP,
        p_check_out_time IN TIMESTAMP,
        p_total_hours_work IN NUMBER,
        p_overtime_hours IN NUMBER,
        p_employee_id IN NUMBER,
        p_attendance_status IN NUMBER
    );
    PROCEDURE delete_attendance(p_attendance_id IN NUMBER);
END attendance_pkg;
/

CREATE OR REPLACE PACKAGE BODY attendance_pkg IS
    PROCEDURE insert_attendance(
        p_attendance_id IN NUMBER,
        p_attendance_date IN DATE,
        p_check_in_time IN TIMESTAMP,
        p_check_out_time IN TIMESTAMP,
        p_total_hours_work IN NUMBER,
        p_overtime_hours IN NUMBER,
        p_employee_id IN NUMBER,
        p_attendance_status IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Attendance (
            attendance_id, attendance_date, check_in_time, check_out_time,
            total_hours_work, overtime_hours, employee_id, attendance_status
        )
        VALUES (
            p_attendance_id, p_attendance_date, p_check_in_time, p_check_out_time,
            p_total_hours_work, p_overtime_hours, p_employee_id, p_attendance_status
        );
    END insert_attendance;

    PROCEDURE update_attendance(
        p_attendance_id IN NUMBER,
        p_attendance_date IN DATE,
        p_check_in_time IN TIMESTAMP,
        p_check_out_time IN TIMESTAMP,
        p_total_hours_work IN NUMBER,
        p_overtime_hours IN NUMBER,
        p_employee_id IN NUMBER,
        p_attendance_status IN NUMBER
    ) IS
    BEGIN
        UPDATE Attendance
        SET attendance_date = p_attendance_date,
            check_in_time = p_check_in_time,
            check_out_time = p_check_out_time,
            total_hours_work = p_total_hours_work,
            overtime_hours = p_overtime_hours,
            employee_id = p_employee_id,
            attendance_status = p_attendance_status
        WHERE attendance_id = p_attendance_id;
    END update_attendance;

    PROCEDURE delete_attendance(p_attendance_id IN NUMBER) IS
    BEGIN
        DELETE FROM Attendance
        WHERE attendance_id = p_attendance_id;
    END delete_attendance;
END attendance_pkg;
/

CREATE OR REPLACE PACKAGE training_programs_pkg IS
    PROCEDURE insert_training_program(
        p_training_id IN NUMBER,
        p_training_program_name IN VARCHAR2,
        p_training_program_details IN VARCHAR2,
        p_training_technology_skills IN VARCHAR2,
        p_training_start_date IN DATE,
        p_training_end_date IN DATE,
        p_training_duration IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_id IN NUMBER,
        p_training_status IN NUMBER
    );
    PROCEDURE update_training_program(
        p_training_id IN NUMBER,
        p_training_program_name IN VARCHAR2,
        p_training_program_details IN VARCHAR2,
        p_training_technology_skills IN VARCHAR2,
        p_training_start_date IN DATE,
        p_training_end_date IN DATE,
        p_training_duration IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_id IN NUMBER,
        p_training_status IN NUMBER
    );
    PROCEDURE delete_training_program(p_training_id IN NUMBER);
END training_programs_pkg;
/

CREATE OR REPLACE PACKAGE BODY training_programs_pkg IS
    PROCEDURE insert_training_program(
        p_training_id IN NUMBER,
        p_training_program_name IN VARCHAR2,
        p_training_program_details IN VARCHAR2,
        p_training_technology_skills IN VARCHAR2,
        p_training_start_date IN DATE,
        p_training_end_date IN DATE,
        p_training_duration IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_id IN NUMBER,
        p_training_status IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Training_Programs (
            training_id, training_program_name, training_program_details,
            training_technology_skills, training_start_date, training_end_date,
            training_duration, employee_id, project_id, training_status
        )
        VALUES (
            p_training_id, p_training_program_name, p_training_program_details,
            p_training_technology_skills, p_training_start_date, p_training_end_date,
            p_training_duration, p_employee_id, p_project_id, p_training_status
        );
    END insert_training_program;

    PROCEDURE update_training_program(
        p_training_id IN NUMBER,
        p_training_program_name IN VARCHAR2,
        p_training_program_details IN VARCHAR2,
        p_training_technology_skills IN VARCHAR2,
        p_training_start_date IN DATE,
        p_training_end_date IN DATE,
        p_training_duration IN NUMBER,
        p_employee_id IN NUMBER,
        p_project_id IN NUMBER,
        p_training_status IN NUMBER
    ) IS
    BEGIN
        UPDATE Training_Programs
        SET training_program_name = p_training_program_name,
            training_program_details = p_training_program_details,
            training_technology_skills = p_training_technology_skills,
            training_start_date = p_training_start_date,
            training_end_date = p_training_end_date,
            training_duration = p_training_duration,
            employee_id = p_employee_id,
            project_id = p_project_id,
            training_status = p_training_status
        WHERE training_id = p_training_id;
    END update_training_program;

    PROCEDURE delete_training_program(p_training_id IN NUMBER) IS
    BEGIN
        DELETE FROM Training_Programs
        WHERE training_id = p_training_id;
    END delete_training_program;
END training_programs_pkg;
/

CREATE OR REPLACE PACKAGE salaries_pkg IS
    PROCEDURE insert_salary(
        p_salary_id IN NUMBER,
        p_salary_amount IN NUMBER,
        p_effective_from IN DATE,
        p_salary_category IN VARCHAR2,
        p_employee_id IN NUMBER,
        p_attendance_id IN NUMBER,
        p_leave_id IN NUMBER
    );
    PROCEDURE update_salary(
        p_salary_id IN NUMBER,
        p_salary_amount IN NUMBER,
        p_effective_from IN DATE,
        p_salary_category IN VARCHAR2,
        p_employee_id IN NUMBER,
        p_attendance_id IN NUMBER,
        p_leave_id IN NUMBER
    );
    PROCEDURE delete_salary(p_salary_id IN NUMBER);
END salaries_pkg;
/

CREATE OR REPLACE PACKAGE BODY salaries_pkg IS
    PROCEDURE insert_salary(
        p_salary_id IN NUMBER,
        p_salary_amount IN NUMBER,
        p_effective_from IN DATE,
        p_salary_category IN VARCHAR2,
        p_employee_id IN NUMBER,
        p_attendance_id IN NUMBER,
        p_leave_id IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Salaries (
            salary_id, salary_amount, salary_effective_from, salary_category,
            employee_id, attendance_id, leave_id
        )
        VALUES (
            p_salary_id, p_salary_amount, p_effective_from, p_salary_category,
            p_employee_id, p_attendance_id, p_leave_id
        );
    END insert_salary;

    PROCEDURE update_salary(
        p_salary_id IN NUMBER,
        p_salary_amount IN NUMBER,
        p_effective_from IN DATE,
        p_salary_category IN VARCHAR2,
        p_employee_id IN NUMBER,
        p_attendance_id IN NUMBER,
        p_leave_id IN NUMBER
    ) IS
    BEGIN
        UPDATE Salaries
        SET salary_amount = p_salary_amount,
            salary_effective_from = p_effective_from,
            salary_category = p_salary_category,
            employee_id = p_employee_id,
            attendance_id = p_attendance_id,
            leave_id = p_leave_id
        WHERE salary_id = p_salary_id;
    END update_salary;

    PROCEDURE delete_salary(p_salary_id IN NUMBER) IS
    BEGIN
        DELETE FROM Salaries
        WHERE salary_id = p_salary_id;
    END delete_salary;
END salaries_pkg;
/























-- Procedures for Status Table
CREATE OR REPLACE PROCEDURE insert_status(p_status_id NUMBER, p_status VARCHAR2) IS
BEGIN
    INSERT INTO Status (status_id, status) 
    VALUES (p_status_id, p_status);
END insert_status;
/

CREATE OR REPLACE PROCEDURE update_status(p_status_id NUMBER, p_status VARCHAR2) IS
BEGIN
    UPDATE Status
    SET status = p_status
    WHERE status_id = p_status_id;
END update_status;
/

CREATE OR REPLACE PROCEDURE delete_status(p_status_id NUMBER) IS
BEGIN
    DELETE FROM Status 
    WHERE status_id = p_status_id;
END delete_status;
/

-- Procedures for Project_Role Table
CREATE OR REPLACE PROCEDURE insert_project_role(p_project_role_id NUMBER, p_project_role VARCHAR2) IS
BEGIN
    INSERT INTO Project_Role (project_role_id, project_role) 
    VALUES (p_project_role_id, p_project_role);
END insert_project_role;
/

CREATE OR REPLACE PROCEDURE update_project_role(p_project_role_id NUMBER, p_project_role VARCHAR2) IS
BEGIN
    UPDATE Project_Role
    SET project_role = p_project_role
    WHERE project_role_id = p_project_role_id;
END update_project_role;
/

CREATE OR REPLACE PROCEDURE delete_project_role(p_project_role_id NUMBER) IS
BEGIN
    DELETE FROM Project_Role 
    WHERE project_role_id = p_project_role_id;
END delete_project_role;
/

-- Procedures for Project_Status Table
CREATE OR REPLACE PROCEDURE insert_project_status(p_project_status_id NUMBER, p_project_status VARCHAR2) IS
BEGIN
    INSERT INTO Project_Status (project_status_id, project_status) 
    VALUES (p_project_status_id, p_project_status);
END insert_project_status;
/

CREATE OR REPLACE PROCEDURE update_project_status(p_project_status_id NUMBER, p_project_status VARCHAR2) IS
BEGIN
    UPDATE Project_Status
    SET project_status = p_project_status
    WHERE project_status_id = p_project_status_id;
END update_project_status;
/

CREATE OR REPLACE PROCEDURE delete_project_status(p_project_status_id NUMBER) IS
BEGIN
    DELETE FROM Project_Status 
    WHERE project_status_id = p_project_status_id;
END delete_project_status;
/

-- Procedures for Attendance_Status Table
CREATE OR REPLACE PROCEDURE insert_attendance_status(p_attendance_status_id NUMBER, p_attendance_status VARCHAR2) IS
BEGIN
    INSERT INTO Attendance_Status (attendance_status_id, attendance_status) 
    VALUES (p_attendance_status_id, p_attendance_status);
END insert_attendance_status;
/

CREATE OR REPLACE PROCEDURE update_attendance_status(p_attendance_status_id NUMBER, p_attendance_status VARCHAR2) IS
BEGIN
    UPDATE Attendance_Status
    SET attendance_status = p_attendance_status
    WHERE attendance_status_id = p_attendance_status_id;
END update_attendance_status;
/

CREATE OR REPLACE PROCEDURE delete_attendance_status(p_attendance_status_id NUMBER) IS
BEGIN
    DELETE FROM Attendance_Status 
    WHERE attendance_status_id = p_attendance_status_id;
END delete_attendance_status;
/

-- Procedures for Technology Table
CREATE OR REPLACE PROCEDURE insert_technology(p_technology_id NUMBER, p_technology_name VARCHAR2, p_technology_details VARCHAR2) IS
BEGIN
    INSERT INTO Technology (technology_id, technology_name, technology_details)
    VALUES (p_technology_id, p_technology_name, p_technology_details);
END insert_technology;
/

CREATE OR REPLACE PROCEDURE update_technology(p_technology_id NUMBER, p_technology_name VARCHAR2, p_technology_details VARCHAR2) IS
BEGIN
    UPDATE Technology
    SET technology_name = p_technology_name, technology_details = p_technology_details
    WHERE technology_id = p_technology_id;
END update_technology;
/

CREATE OR REPLACE PROCEDURE delete_technology(p_technology_id NUMBER) IS
BEGIN
    DELETE FROM Technology 
    WHERE technology_id = p_technology_id;
END delete_technology;
/

-- Procedures for Locations Table
CREATE OR REPLACE PROCEDURE insert_location(
    p_location_id NUMBER,
    p_location_block VARCHAR2,
    p_location_floor VARCHAR2,
    p_location_status NUMBER
) IS
BEGIN
    INSERT INTO Locations (location_id, location_status, location) 
    VALUES (p_location_id, p_location_status, location_nested_table(location_obj(p_location_block, p_location_floor, p_location_block)));
END insert_location;
/

CREATE OR REPLACE PROCEDURE update_location(
    p_location_id NUMBER,
    p_location_block VARCHAR2,
    p_location_floor VARCHAR2,
    p_location_status NUMBER
) IS
BEGIN
    UPDATE Locations
    SET location_status = p_location_status,
        location = location_nested_table(location_obj(p_location_block, p_location_floor, p_location_block))
    WHERE location_id = p_location_id;
END update_location;
/

CREATE OR REPLACE PROCEDURE delete_location(p_location_id NUMBER) IS
BEGIN
    DELETE FROM Locations 
    WHERE location_id = p_location_id;
END delete_location;
/

-- Procedures for Leave Table
CREATE OR REPLACE PROCEDURE insert_leave(
    p_leave_id NUMBER,
    p_type VARCHAR2,
    p_from_date DATE,
    p_to_date DATE,
    p_total_days NUMBER,
    p_employee_id NUMBER
) IS
BEGIN
    INSERT INTO Leave (
        leave_id, leave_type, leave_from_date, leave_to_date, leave_total_days, employee_id
    )
    VALUES (
        p_leave_id, p_type, p_from_date, p_to_date, p_total_days, p_employee_id
    );
END insert_leave;
/

CREATE OR REPLACE PROCEDURE update_leave(
    p_leave_id NUMBER,
    p_type VARCHAR2,
    p_from_date DATE,
    p_to_date DATE,
    p_total_days NUMBER,
    p_employee_id NUMBER
) IS
BEGIN
    UPDATE Leave
    SET leave_type = p_type,
        leave_from_date = p_from_date,
        leave_to_date = p_to_date,
        leave_total_days = p_total_days,
        employee_id = p_employee_id
    WHERE leave_id = p_leave_id;
END update_leave;
/

CREATE OR REPLACE PROCEDURE delete_leave(p_leave_id NUMBER) IS
BEGIN
    DELETE FROM Leave 
    WHERE leave_id = p_leave_id;
END delete_leave;
/
