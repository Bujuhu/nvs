---
title: 5 Triggers
layout: report
date: 2016-12-04
task: Aufgabe 4 (Email)
subject: dbi resch
---

## 1

```sql
CREATE OR REPLACE TRIGGER A5_1
BEFORE INSERT OR UPDATE OR DELETE ON EMPLOYEES
DECLARE
    oowhe exception;
BEGIN

  IF CURRENT_TIMESTAMP  < '05:00' OR CURRENT_TIMESTAMP > '23:00' THEN
    RAISE oowhe;
  end if;

END;
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
