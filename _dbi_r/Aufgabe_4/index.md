---
title: 4 Exceptions
layout: report
date: 2016-12-04
task: Aufgabe 4 (Email)
subject: dbi resch
---

## 1

```sql
CREATE OR REPLACE PROCEDURE A4_1 AS

v_salary employees.salary%TYPE;

BEGIN
  select min(salary)
  into v_salary
  from EMPLOYEES
  where FIRST_NAME='Peter'
  group by first_name;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
      select avg(salary)
    into v_salary
    from EMPLOYEES;

  update EMPLOYEES
  set SALARY=v_salary
  where employee_id=1;
END A4_1;
```

## 2
```sql
CREATE OR REPLACE PROCEDURE A4_2 AS

v_manager_id employees.employee_id%type;
v_manager_dep employees.department_id%type;

BEGIN
  select employee_id, department_id
  into v_manager_id, v_manager_dep
  from (
    select employee_id, department_id
    from EMPLOYEES
    where FIRST_NAME='Peter'
    order by salary)
  where ROWNUM = 1;


  update EMPLOYEES
  set MANAGER_ID=V_MANAGER_ID
  where department_id=v_manager_dep;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
  dbms_output.put_line('No Data was returned');
  RAISE;

  WHEN TOO_MANY_ROWS THEN
  dbms_output.put_line('Multiple Employees with the same salary has been found');
  RAISE;
  WHEN others THEN
  dbms_output.put_line('An error occured');
  RAISE;



END A4_2;
```
