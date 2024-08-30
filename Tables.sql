	CREATE TABLE Status (
        status_id NUMBER PRIMARY KEY,
        status VARCHAR2(100)
    )
    STORAGE (INITIAL 1000 NEXT 500 MINEXTENTS 1 MAXEXTENTS 2);

    CREATE TABLE Project_Role (
        project_role_id NUMBER PRIMARY KEY,
        project_role VARCHAR2(100)
    )
    STORAGE (INITIAL 1000 NEXT 500 MINEXTENTS 1 MAXEXTENTS 2);

    CREATE TABLE Project_Status (
        project_status_id NUMBER PRIMARY KEY,
        project_status VARCHAR2(100)
    )
    STORAGE (INITIAL 1000 NEXT 500 MINEXTENTS 1 MAXEXTENTS 2);

    CREATE TABLE Attendance_Status (
        attendance_status_id NUMBER PRIMARY KEY,
        attendance_status VARCHAR2(100)
    )
    STORAGE (INITIAL 1000 NEXT 500 MINEXTENTS 1 MAXEXTENTS 2);

    CREATE TABLE Technology (
        technology_id NUMBER PRIMARY KEY,
        technology_name VARCHAR2(100),  
        technology_details VARCHAR2(500)
    )
    STORAGE (INITIAL 1000 NEXT 500 MINEXTENTS 1 MAXEXTENTS 2);

CREATE TABLE Designations (
        designation_id NUMBER PRIMARY KEY,
        designation_title VARCHAR2(100),
        designation_details VARCHAR2(500),
        department_id NUMBER,
        designation_status NUMBER REFERENCES Status(status_id)
    )
    CLUSTER employee_department_cluster (department_id);


 CREATE OR REPLACE TYPE phone_numbers_varray AS VARRAY(3) OF VARCHAR2(15);

CREATE TABLE Employees (
    employee_id NUMBER PRIMARY KEY,
    employee_first_name VARCHAR2(100) NOT NULL,
    employee_last_name VARCHAR2(100) NOT NULL,
    employee_email VARCHAR2(200) UNIQUE NOT NULL,
    employee_phone_numbers phone_numbers_varray,  
    employee_date_of_birth DATE,
    employee_gender VARCHAR2(1) CHECK (employee_gender IN ('M', 'F', 'O')),
    employee_address VARCHAR2(500),  
    employee_joining_date DATE NOT NULL,
    department_id NUMBER,
    employee_designation NUMBER REFERENCES Designations(designation_id),
    employee_status NUMBER REFERENCES Status(status_id)
)
CLUSTER employee_department_cluster (department_id);


		CREATE OR REPLACE TYPE address_obj AS OBJECT (
            block VARCHAR2(100),
            house_no VARCHAR2(20),
            society VARCHAR2(100),
            area VARCHAR2(100),
            district VARCHAR2(100),
            state VARCHAR2(100),
            pincode VARCHAR2(10)
        );

        
        CREATE OR REPLACE TYPE address_nested_table AS TABLE OF address_obj;

        
        ALTER TABLE Employees
        ADD employee_address address_nested_table
        NESTED TABLE employee_address STORE AS employee_address_nt;


CREATE OR REPLACE TYPE location_obj AS OBJECT (
    location_room_no VARCHAR2(100),
    location_floor VARCHAR2(100),
    location_block VARCHAR2(100)
);

CREATE OR REPLACE TYPE location_nested_table AS TABLE OF location_obj;

CREATE TABLE Locations (
    location_id NUMBER PRIMARY KEY,
    location_status NUMBER REFERENCES Status(status_id),
    location location_nested_table  
)
NESTED TABLE location STORE AS location_nt
STORAGE (INITIAL 1000 NEXT 500 MINEXTENTS 1 MAXEXTENTS 2);



CREATE TABLE Departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100),
    department_details VARCHAR2(500),
    department_location NUMBER REFERENCES Locations(location_id),
    department_status NUMBER REFERENCES Status(status_id)
)
CLUSTER employee_department_cluster (department_id);


CREATE TABLE Projects (
        project_id NUMBER PRIMARY KEY,
        project_name VARCHAR2(200),
        project_details VARCHAR2(1000),
        project_assign_date DATE,
        project_allocate_date DATE,
        project_completion_date DATE,
        project_budget NUMBER,
        project_technologies_used NUMBER REFERENCES Technology(technology_id),
        project_status NUMBER REFERENCES Project_Status(project_status_id)
    )
    CLUSTER project_assignment_cluster (project_id);


CREATE TABLE Employee_Project_Assignments (
        assignment_id NUMBER PRIMARY KEY,
        assignment_assign_date DATE,
        assignment_allocate_date DATE,
        assignment_completion_date DATE,
        assignment_hours_allocated NUMBER,
        assignment_hours_work NUMBER,
        assignment_remarks VARCHAR2(500),
        project_id NUMBER,
        employee_id NUMBER REFERENCES Employees(employee_id),   
        project_role NUMBER REFERENCES Project_Role(project_role_id),
        assignment_status NUMBER REFERENCES Project_Status(project_status_id)
    )
    CLUSTER project_assignment_cluster (project_id);




 CREATE TABLE Attendance (
        attendance_id NUMBER PRIMARY KEY,
        attendance_date DATE,
        check_in_time TIMESTAMP,
        check_out_time TIMESTAMP,
        total_hours_work NUMBER,
        overtime_hours NUMBER,
        employee_id NUMBER,
        attendance_status NUMBER REFERENCES Attendance_Status(attendance_status_id)
    )   
    CLUSTER employee_work_cluster (employee_id);


    CREATE TABLE Leave (
        leave_id NUMBER PRIMARY KEY,
        leave_type VARCHAR2(100),
        leave_from_date DATE,
        leave_to_date DATE,
        leave_total_days NUMBER,
        employee_id NUMBER
    )
    CLUSTER employee_work_cluster (employee_id);

CREATE TABLE Training_Programs (
        training_id NUMBER PRIMARY KEY,
        training_program_name VARCHAR2(200),
        training_program_details VARCHAR2(1000),
        training_technology_skills VARCHAR2(500),
        training_start_date DATE,
        training_end_date DATE,
        training_duration NUMBER,
        employee_id NUMBER REFERENCES Employees(employee_id),
        project_id NUMBER REFERENCES Projects(project_id),
        training_status NUMBER REFERENCES Status(status_id)
    )
    STORAGE (INITIAL 1000 NEXT 500 MINEXTENTS 1 MAXEXTENTS 2);

CREATE TABLE Salaries (
    salary_id NUMBER PRIMARY KEY,
    salary_amount NUMBER,
    salary_effective_from DATE,
    salary_category VARCHAR2(20) CHECK (salary_category IN ('Regular', 'Overtime', 'Leave')),
    employee_id NUMBER REFERENCES Employees(employee_id),
    attendance_id NUMBER REFERENCES Attendance(attendance_id),
    leave_id NUMBER REFERENCES Leave(leave_id)
)
PARTITION BY LIST (salary_category) (
    PARTITION regular_emp VALUES ('Regular'),
    PARTITION overtime_emp VALUES ('Overtime'),
    PARTITION leave_emp VALUES ('Leave')
);
