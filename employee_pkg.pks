CREATE OR REPLACE PACKAGE employee_pkg AS
    PROCEDURE insert_longest_named_employee;
    FUNCTION count_rows(p_table_name IN VARCHAR2) RETURN NUMBER;
END employee_pkg;
