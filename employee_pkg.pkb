CREATE OR REPLACE PACKAGE BODY employee_pkg AS

    PROCEDURE insert_longest_named_employee IS
        v_first_name EMPLOYEES.FIRST_NAME%TYPE;
        v_last_name  EMPLOYEES.LAST_NAME%TYPE;
        v_country    COUNTRIES.COUNTRY_NAME%TYPE;
    BEGIN
        SELECT E.FIRST_NAME, E.LAST_NAME, C.COUNTRY_NAME
        INTO v_first_name, v_last_name, v_country
        FROM EMPLOYEES E
        JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
        JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
        WHERE LENGTH(E.FIRST_NAME || E.LAST_NAME) = (
            SELECT MAX(LENGTH(FIRST_NAME || LAST_NAME)) FROM EMPLOYEES
        )
        AND ROWNUM = 1;

        INSERT INTO LONGEST_NAME_EMPLOYEE (FIRST_NAME, LAST_NAME, COUNTRY)
        VALUES (v_first_name, v_last_name, v_country);
    END;

    FUNCTION count_rows(p_table_name IN VARCHAR2) RETURN NUMBER IS
        v_sql   VARCHAR2(1000);
        v_count NUMBER;
    BEGIN
        v_sql := 'SELECT COUNT(*) FROM ' || p_table_name;
        EXECUTE IMMEDIATE v_sql INTO v_count;
        RETURN v_count;
    END;

END employee_pkg;
