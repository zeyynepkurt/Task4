# Task4

The task is to find the employee who has the longest full name (FIRST_NAME + LAST_NAME) from the EMPLOYEES table and insert their information into a custom table, including the country name.

---

## Files

- `employee_pkg.pks` – Package specification  
- `employee_pkg.pkb` – Package body  

---

## Required Tables

These tables must be created in your schema by copying from HR schema in Oracle Live SQL:

```sql
CREATE TABLE EMPLOYEES AS SELECT * FROM HR.EMPLOYEES;
CREATE TABLE DEPARTMENTS AS SELECT * FROM HR.DEPARTMENTS;
CREATE TABLE LOCATIONS AS SELECT * FROM HR.LOCATIONS;
CREATE TABLE COUNTRIES AS SELECT * FROM HR.COUNTRIES;
```

Also, create the final output table:

```sql
CREATE TABLE LONGEST_NAME_EMPLOYEE (
    FIRST_NAME VARCHAR2(50),
    LAST_NAME  VARCHAR2(50),
    COUNTRY    VARCHAR2(100)
);
```

---

## How to Run

Run the following block to insert the longest-named employee into your custom table:

```sql
BEGIN
    employee_pkg.insert_longest_named_employee;
END;
```

Check inserted data:

```sql
SELECT * FROM LONGEST_NAME_EMPLOYEE;
```

Use the function to count rows of a given table:

```sql
SELECT employee_pkg.count_rows('LONGEST_NAME_EMPLOYEE') FROM dual;
```

---


