---
title: 2 Cursors
layout: report
date: 2016-10-18
task: Aufgabe 2 (Email)
subject: dbi resch
---
## 1
Zeigen Sie den Job Title und den Namen des Mitarbeiters an, der am längsten in der Firma arbeitet

```sql
CREATE OR REPLACE PROCEDURE A2_1 AS


 v_FIRST_NAME EMPLOYEES.FIRST_NAME%type;
 v_LAST_NAME EMPLOYEES.LAST_NAME%type;
 v_JOB_TITLE JOBS.JOB_TITLE%type;  

BEGIN
  select FIRST_NAME, LAST_NAME, JOB_TITLE
  into v_FIRST_NAME, v_LAST_NAME, v_JOB_TITLE
  from (select FIRST_NAME, LAST_NAME, JOB_TITLE
    from EMPLOYEES
    inner join JOBS on ( EMPLOYEES.JOB_ID = JOBS.JOB_ID)
    order by hire_date)
  where ROWNUM = 1;

    DBMS_OUTPUT.put_line(v_FIRST_NAME || ' ' || v_LAST_NAME || ', ' || v_JOB_TITLE);
END A2_1;

-- Steven King, President
```

## 2
Zeigen Sie den 2. bis zum 9 Mitarbeiter in der Mitarbeiter Tabelle an.

```sql
CREATE OR REPLACE PROCEDURE A2_2 AS

  cursor employee_cur is
    select FIRST_NAME, LAST_NAME
    from employees
    where rownum between 2 and 9;

  v_employee employee_cur%ROWTYPE;

BEGIN
  OPEN employee_cur;

  LOOP
    FETCH employee_cur INTO v_employee;
    EXIT WHEN employee_cur%NOTFOUND;

    DBMS_OUTPUT.put_line(v_employee.FIRST_NAME || ' ' || v_employee.LAST_NAME );

  END LOOP;
  CLOSE employee_cur;
END A2_2;
```

## 3

```sql
CREATE OR REPLACE PROCEDURE A2_3 AS

  cursor employee_cur is
    select *
    from employees;

  v_employee employee_cur%ROWTYPE;

BEGIN
  OPEN employee_cur;

  LOOP
    FETCH employee_cur INTO v_employee;
    EXIT WHEN employee_cur%NOTFOUND;

    if v_employee.DEPARTMENT_ID = 40 then
      SET_SALARY( v_employee.employee_id, v_employee.salary * 1.09);
    elsif v_employee.DEPARTMENT_ID = 70 then
      SET_SALARY( v_employee.employee_id, v_employee.salary * 1.17);
    elsif v_employee.COMMISSION_PCT > 0.35 then
      SET_SALARY( v_employee.employee_id, v_employee.salary * 1.04);
    else
      SET_SALARY( v_employee.employee_id, v_employee.salary * 1.11);
    end if;

  END LOOP;
  CLOSE employee_cur;
  NULL;
END A2_3;
```
