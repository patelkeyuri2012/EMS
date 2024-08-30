CREATE INDEX idx_employees_department_id ON Employees(department_id);

CREATE INDEX idx_employees_last_name ON Employees(employee_last_name);

CREATE INDEX idx_departments_location_id ON Departments(department_location);

CREATE INDEX idx_departments_name ON Departments(department_name);

CREATE INDEX idx_salaries_employee_id ON Salaries(employee_id);

CREATE INDEX idx_attendance_status_id ON Attendance(attendance_status);

CREATE INDEX idx_attendance_date ON Attendance(attendance_date);


CREATE INDEX idx_employee_department_cluster
    ON CLUSTER employee_department_cluster
    STORAGE (
        INITIAL 1000
        NEXT 500
        MINEXTENTS 1
        MAXEXTENTS 5
    );


CREATE INDEX idx_employee_work_cluster
    ON CLUSTER employee_work_cluster
    STORAGE (
        INITIAL 1000
        NEXT 500
        MINEXTENTS 1
        MAXEXTENTS 5
    );


CREATE INDEX idx_project_assignment_cluster
    ON CLUSTER project_assignment_cluster
    STORAGE (
        INITIAL 1000
        NEXT 500
        MINEXTENTS 1
        MAXEXTENTS 5
    );
