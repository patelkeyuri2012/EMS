CREATE CLUSTER employee_department_cluster (
    department_id NUMBER
) 
SIZE 1000
STORAGE (
    INITIAL 1000
    NEXT 500
    MINEXTENTS 1
    MAXEXTENTS 5
);

CREATE CLUSTER employee_work_cluster (
    employee_id NUMBER
)
SIZE 1000
    STORAGE (
    INITIAL 1000
    NEXT 500
    MINEXTENTS 1
    MAXEXTENTS 5
);

CREATE CLUSTER project_assignment_cluster (
    project_id NUMBER
)
SIZE 1000
    STORAGE (
    INITIAL 1000
    NEXT 500
    MINEXTENTS 1
    MAXEXTENTS 5
);
