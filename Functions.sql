
CREATE OR REPLACE  FUNCTION get_all_status
    RETURN SYS_REFCURSOR
    IS
        result_cursor SYS_REFCURSOR;
    BEGIN
        OPEN result_cursor FOR
        SELECT * FROM Status;
        RETURN result_cursor;
    END;
/


CREATE OR REPLACE FUNCTION get_all_project_roles
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Project_Role;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_project_statuses
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Project_Status;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_attendance_statuses
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Attendance_Status;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_technologies
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Technology;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_employees
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Employees;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_departments
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Departments;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_designations
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Designations;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_salaries
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Salaries;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_locations
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Locations;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_projects
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Projects;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_employee_project_assignments
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Employee_Project_Assignments;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_attendance
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Attendance;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_leaves
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Leave;
    RETURN result_cursor;
END;
/


CREATE OR REPLACE FUNCTION get_all_training_programs
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Training_Programs;
    RETURN result_cursor;
END;
/
