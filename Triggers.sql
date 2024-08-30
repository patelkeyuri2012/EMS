CREATE OR REPLACE TRIGGER trg_check_employee_joining_date
BEFORE INSERT OR UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF :NEW.employee_joining_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee joining date cannot be later than today''s date.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_check_leave_dates
BEFORE INSERT OR UPDATE ON Leave
FOR EACH ROW
BEGIN
    IF :NEW.leave_to_date < :NEW.leave_from_date THEN
        RAISE_APPLICATION_ERROR(-20002, 'Leave to date cannot be earlier than leave from date.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_check_training_dates
BEFORE INSERT OR UPDATE ON Training_Programs
FOR EACH ROW
BEGIN
    IF :NEW.training_end_date < :NEW.training_start_date THEN
        RAISE_APPLICATION_ERROR(-20003, 'Training end date cannot be earlier than training start date.');
    END IF;
END;
/
