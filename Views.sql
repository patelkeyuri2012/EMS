CREATE OR REPLACE VIEW Employee_Details AS
SELECT 
    e.employee_id,
    e.employee_first_name,
    e.employee_last_name,
    e.employee_email,
    e.employee_phone_numbers,
    e.employee_date_of_birth,
    e.employee_gender,
    e.employee_address,
    e.employee_joining_date,
    d.department_name,
    des.designation_title,
    s.status AS employee_status
FROM 
    Employees e
JOIN 
    Departments d ON e.department_id = d.department_id
JOIN 
    Designations des ON e.employee_designation = des.designation_id
JOIN 
    Status s ON e.employee_status = s.status_id;


CREATE OR REPLACE VIEW Project_Details AS
SELECT 
    p.project_id,
    p.project_name,
    p.project_details,
    p.project_assign_date,
    p.project_allocate_date,
    p.project_completion_date,
    p.project_budget,
    t.technology_name AS used_technology,
    ps.project_status AS current_status
FROM 
    Projects p
JOIN 
    Technology t ON p.project_technologies_used = t.technology_id
JOIN 
    Project_Status ps ON p.project_status = ps.project_status_id;



CREATE OR REPLACE VIEW Employee_Project_Assignments_View AS
SELECT 
    epa.assignment_id,
    epa.assignment_assign_date,
    epa.assignment_allocate_date,
    epa.assignment_completion_date,
    epa.assignment_hours_allocated,
    epa.assignment_hours_work,
    epa.assignment_remarks,
    e.employee_first_name || ' ' || e.employee_last_name AS employee_name,
    p.project_name,
    pr.project_role,
    ps.project_status AS assignment_status
FROM 
    Employee_Project_Assignments epa
JOIN 
    Employees e ON epa.employee_id = e.employee_id
JOIN 
    Projects p ON epa.project_id = p.project_id
JOIN 
    Project_Role pr ON epa.project_role = pr.project_role_id
JOIN 
    Project_Status ps ON epa.assignment_status = ps.project_status_id;



CREATE OR REPLACE VIEW Attendance_Summary AS
SELECT 
    a.attendance_id,
    a.attendance_date,
    a.check_in_time,
    a.check_out_time,
    a.total_hours_work,
    a.overtime_hours,
    e.employee_first_name || ' ' || e.employee_last_name AS employee_name,
    as.status AS attendance_status
FROM 
    Attendance a
JOIN 
    Employees e ON a.employee_id = e.employee_id
JOIN 
    Attendance_Status as ON a.attendance_status = as.attendance_status_id;



CREATE OR REPLACE VIEW Leave_Summary AS
SELECT 
    l.leave_id,
    l.leave_type,
    l.leave_from_date,
    l.leave_to_date,
    l.leave_total_days,
    e.employee_first_name || ' ' || e.employee_last_name AS employee_name
FROM 
    Leave l
JOIN 
    Employees e ON l.employee_id = e.employee_id;



CREATE OR REPLACE VIEW Training_Programs_View AS
SELECT 
    tp.training_id,
    tp.training_program_name,
    tp.training_program_details,
    tp.training_technology_skills,
    tp.training_start_date,
    tp.training_end_date,
    tp.training_duration,
    e.employee_first_name || ' ' || e.employee_last_name AS employee_name,
    p.project_name,
    s.status AS training_status
FROM 
    Training_Programs tp
JOIN 
    Employees e ON tp.employee_id = e.employee_id
JOIN 
    Projects p ON tp.project_id = p.project_id
JOIN 
    Status s ON tp.training_status = s.status_id;



CREATE OR REPLACE VIEW Salary_Details AS
SELECT 
    s.salary_id,
    s.salary_amount,
    s.salary_effective_from,
    s.salary_category,
    e.employee_first_name || ' ' || e.employee_last_name AS employee_name,
    a.attendance_id,
    l.leave_id
FROM 
    Salaries s
LEFT JOIN 
    Employees e ON s.employee_id = e.employee_id
LEFT JOIN 
    Attendance a ON s.attendance_id = a.attendance_id
LEFT JOIN 
    Leave l ON s.leave_id = l.leave_id;
