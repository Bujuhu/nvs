---
title: Übungsbeispiele
layout: report
date: 2017-02-15
subject: dbi resch
---

# Schauts auch auf Kloiber seinen Zettel (in den Anhängen)

# Snippets (zum Zusammen kopieren)

## Jahr von Datum

```sql
extract(year from current_timestamp)
```

# Testfragen

### Schreiben Sie eine Prozedur die die Email Adresse eines Mitarbeiters (falls leer) ändert auf <Familienname>@<Department_Name>.at

*Suchts das Beispiel, ist fast das selbe nur als Prozedur:*

Schreiben Sie eine Prozedur die die Email Adresse eines Mitarbeiters (falls leer) ändert auf <Familienname>@<Department_Name>.at


### Implementieren Sie einen Trigger, der sicher stellt, dass ein Mitarbeter genau so viel verdient, wie die Hälfte der Max_Salary seiner Job_ID (update)

### Erstellen Sie eine Prozrdur die den Gehalts- Mittelwert ( (min + max/2)) einer gegebenen Job_ID ermittelt. Suchen SIe einen Mitarbeiter mit der gegebenen Job_ID, dessen Salray möglichst gleich diesem Mittelwert ist.

### Erstellen SIe eine Prozedur, die einen neuen Mitarbeter anegen kann bzw. einen Jobwechsel eines bestehnden Mitarbeters durchführen kann

### Implementieren Sie einen Trigger, der sichser stellt, dass ein Mitarbeiter nicht 40 Jahre lang in der Firma angestellt ist (update)

*Lösung von Juri Schreib*

```sql
CREATE OR REPLACE TRIGGER "Testerino_1"
  BEFORE UPDATE OF HIRE_DATE ON employees FOR EACH ROW
BEGIN
  IF extract(year from current_timestamp) - extract(year from :OLD.HIRE_DATE) > 40 THEN
    RAISE_APPLICATION_ERROR(-20202,'Der Arbeiter ist bereits mehr als 40 Jahre angestellt!');
  END IF;
END;
```

### Erstellen Sie eine Funktion, die einen neune Job anlegen kann ud diese ein exestierenden Mitarbeiter zuordnen kann.

*Lösung von Juri Schreib*

```sql
CREATE OR REPLACE FUNCTION FUNCTION1
(
  JOB_ID in jobs.job_id%type
, JOB_TITLE in jobs.job_title%type
, MIN_SALARY in jobs.min_salary%type
, MAX_SALARY IN jobs.max_salary%type
, EMPLOYEE_ID IN employee.employee_id%type  
) RETURN VARCHAR2 AS
BEGIN
  insert into jobs values ( job_id, job_tile, min_salary, max_salary);

  if sql%rowcount < 1 then
    RAISE_APPLICATION_ERROR(-20202,'Es wurde kein neuer job erstellt!');
  end if;

  update employees
  set job_id = JOB_ID
  where employee_id = EMPLOYEE_ID;

    if sql%rowcount < 1 then
    RAISE_APPLICATION_ERROR(-2,'Der neue Job konnte dem Employee nicht zugewiesen werden!');
  end if;

  return null;

END FUNCTION1;
```

### Erstellen Sie eine Prozedur, die überprüft, ob es unterschiedliche Departments an der gleichen Location (Location_ID) angesiedelt sind. Ändern sie bei den Mitarbeitern der Abteilungen die Telefonnummer wie folgt: <Employee_id>.<location_id>..

*Lösung von Juri Schreib*

```sql
create or replace procedure test as

  cursor dep_cur is
    select location_id
    from departments;

  cursor emp_cur is
    select employee_id
    from employee;

  v_dep varchar2(255);
  v_emp varchar2(255);

BEGIN
  OPEN dep_cur;

  LOOP
    open emp_cur;

    loop
    UPDATE EMPLOYEES
    set phone_number = (v_dep || '.' || v_emp)
    where employee_id = v_emp;
  END LOOP;
  CLOSE emp_cur;
  END LOOP;
  CLOSE dep_cur;
END;
```

### Schreiben Sie eine Funktion, die überprüft, ob ein Manager der Chef in mehreren Departments ist.

*Lösung von Juri Schreib*

```sql
CREATE OR REPLACE FUNCTION FUNCTION2
(
  MANAGER_ID IN Departments.manager_id%type

) RETURN boolean as
manager_departments Number;
BEGIN
  select sum(department_id)
  into manager_departments
  from departments
  where manager_id = manager_id;

  if manager_departments > 1 then
    return true;
  else
    return false;
  end if;

END FUNCTION2;
```

### Implementeieren Sie einen Trigger, der sichser stellt, dass ein Mitarbeter 40 Jahre lang in der Firma angestellt ist (update).

### Erstellen Sie eine Funktion, die einen neuen Job anlegen kann und die exestierenden Mitarbeter zuordnen kann.

### Erstellen Sie eine Prozedur, die Überprüft, ob das Gehalt eines Mitarbeiters zum In- bzw. Max_Salary seiner Job_ID passt. Geben Sie dem Mitarbeter eine Gehaltsreduktion um 5% falls er mehr als Max_Salaray verdient

*Lösung vn Juri Schreib*

```sql
create or replace PROCEDURE TEST3 AS
  cursor employee_cur is
    select *
    from employees;

  v_employee employee_cur%ROWTYPE;
  v_job jobs%ROWTYPE;

BEGIN
  OPEN employee_cur;

  LOOP
    FETCH employee_cur INTO v_employee;
    EXIT WHEN employee_cur%NOTFOUND;

    select *
    into v_job
    from jobs
    where JOB_ID = v_employee.job_id;

    if v_employee.salary > v_job.max_salaray then
      SET_SALARY( v_employee.employee_id, v_employee.salary * 0.95);
      DBMS_OUTPUT.PUT_LINE('Gehalt von ' || v_employee.first_name || ' ' || v_employee.last_name || ' ist zu hoch und wird Korrigiert');
    elsif v_employee.salary < v_job.min_salaray then
      DBMS_OUTPUT.PUT_LINE('Gehalt von ' || v_employee.first_name || ' ' || v_employee.last_name || ' ist zu niedrig');
    end if;

  END LOOP;
  CLOSE employee_cur;
  NULL;
END TEST3;
```

### Erstellen sie eine Funktion, die für einen Mitarbeter der aktuellen Job und die Jobhistory sinnvoll - zusammenbringen - abbildet.

*Lösung von Manuel Reinsberger*

```sql
--------------- SHOW_EMPLOYEE_JOB_AND_HISTORY
-- Test Data
--
-- Test with employee_id 100000 and it will return an empty cursor, with employee_id 101 it will show a cursor with two entries

CREATE OR REPLACE FUNCTION SHOW_EMPLOYEE_JOB_AND_HISTORY (
  employee_id_ job_history.employee_id%TYPE
) RETURN SYS_REFCURSOR AS
  jobs SYS_REFCURSOR;
BEGIN
  IF employee_id_ IS NULL THEN
    RAISE_APPLICATION_ERROR(-20041, 'Employee ID must not be null');
  END IF;

  OPEN jobs FOR SELECT employee_id, start_date, end_date, job_id, department_id
  FROM job_history
  WHERE employee_id = employee_id_;

  RETURN jobs;
END SHOW_EMPLOYEE_JOB_AND_HISTORY;
```

### Erstellen Sie eine Funktion, die überprüft, ob das Gehalt eines Mitarbeiter zum min- bzw. Max_Salaray seiner Job_Id passt. Geben Sie dem Mitarbeiter eine Gehaltserhöhung um 5%

*Lösung von Manuel Reinsberger*

```sql
--------------- CHECK_EMPLOYEE_SALARY
-- Test Data
--
-- UPDATE employees SET salary = 17000 WHERE employee_ID = 102;
--
-- SELECT salary FROM employees WHERE employee_id = 102;
-- This will show that the salary is 17000
--
-- After executing the function it will return 1 to signal that the salary is in range and
-- SELECT salary FROM employees WHERE employee_id = 102;
-- shows that the salary has successfully been changed to 17850
--
-- UPDATE employees SET salary = 17 WHERE employee_ID = 102;
--
-- This will not even work since the trigger prevents updating to lower values
--
-- UPDATE employees SET salary = 99999 WHERE employee_ID = 102;
--
-- After executing the function it will return 0 to signal that the salary is NOT in range  and
-- SELECT salary FROM employees WHERE employee_id = 102;
-- shows that the salary has not been changed from 17

create or replace FUNCTION CHECK_EMPLOYEE_SALARY (
  employee_id_ employees.employee_id%TYPE
) RETURN DECIMAL AS
  min_sal jobs.min_salary%TYPE;
  max_sal jobs.max_salary%TYPE;
  sal    employees.salary%TYPE;
BEGIN
  IF employee_id_ IS NULL THEN
    RAISE_APPLICATION_ERROR(-20021, 'employee_id_ must not be null');
  END IF;

  BEGIN
    SELECT min_salary, max_salary, salary INTO min_sal, max_sal, sal
      FROM employees INNER JOIN jobs ON (employees.job_id = jobs.job_id)
      WHERE employee_id = employee_id_;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20020, 'Employee not found');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20099, 'SEVERE SERVER ERROR');
  END;

  IF sal < min_sal THEN
    RETURN 0;
  END IF;

  IF sal > max_sal THEN
    RETURN 0;
  END IF;

  if (sal*1.05) > max_sal THEN
    sal := max_sal;
  ELSE
    sal := sal*1.05;
    DBMS_OUTPUT.PUT_LINE('v_Return = ' || sal);
  END IF;

  UPDATE employees SET salary = sal WHERE employee_id = employee_id_;

  IF sql%ROWCOUNT != 1 THEN
    RAISE_APPLICATION_ERROR(-20021, 'Employee salary could not be changed');
  END IF;

  RETURN 1;
END CHECK_EMPLOYEE_SALARY;
```

### Implementieren Sie einen Trigger, der sicher stellt, dass ein Mitarbeiter nicht weniger als das Min_Slaaray seiner Job_Id verdient (update)

*Lösung von Manuel Reinsberger*

```sql
--------------- EMPLOYEE_NOT_LESS_THAN_MIN
-- Test data
--
-- UPDATE employees SET salary = 17 WHERE employee_id = 102;
-- This will blow up with  the error that 'Employee salary must be larger than min salary for their job'
-- UPDATE employees SET salary = 17000 WHERE employee_id = 102;
-- This will work and NOT throw anything

CREATE OR REPLACE TRIGGER EMPLOYEE_NOT_LESS_THAN_MIN
BEFORE UPDATE OF SALARY ON EMPLOYEES
FOR EACH ROW
DECLARE
  min_sal jobs.min_salary%TYPE;
BEGIN
  IF :new.job_id IS NULL OR LENGTH(:new.job_id) = 0 THEN
    RAISE_APPLICATION_ERROR(-20051, 'Employee must have job');
  END IF;

  BEGIN
	  SELECT min_salary INTO min_sal FROM jobs WHERE job_id = :new.job_id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20011, 'Job not found');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20099, 'SEVERE SERVER ERROR');
  END;

  IF :new.salary < min_sal THEN
    RAISE_APPLICATION_ERROR(-20003, 'Employee salary must be larger than min salary for their job');
  END IF;
END;
```

### Implementieren Sie einen Trigger, der sicher stellt, dass ein mitarbeiter nicht mehr als die Max_salaray seiner Job_ID verdient (insert)

### Schreiben Sie eine Prozedur die die Email Adresse eines Mitarbeiters (falls leer) ändert auf <Familienname>@<Department_Name>.at

*Lösung von Manuel Reinsberger*

```sql
--------------- CREATE_EMAIL_FOR_EMPLOYEES
-- Test data
--
-- Try with employee_id = 102 now and it won't change anything
--
-- UPDATE employees SET email = ' ' WHERE employee_id = 102;
--
-- Try with employee_id = 102 now and it will change it to 'Lex@De Haan.Executive'

create or replace PROCEDURE CREATE_EMAIL_FOR_EMPLOYEES
(
  employee_id_ IN employees.employee_id%type
) AS
  cur_email employees.email%type;
  f_name employees.first_name%TYPE;
  l_name employees.last_name%TYPE;
  d_name departments.department_name%TYPE;
BEGIN
  IF employee_id_ IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'employee_id_ must not be null');
  END IF;

  BEGIN
    SELECT email, first_name, last_name, department_name INTO cur_email, f_name, l_name, d_name
      FROM employees INNER JOIN departments ON (employees.department_id = departments.department_id)
      WHERE employee_id = employee_id_;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20011, 'Employee not found');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20099, 'SEVERE SERVER ERROR');
  END;

  IF cur_email = ' ' THEN
    IF f_name IS NULL OR length(f_name) = 0 THEN
      RAISE_APPLICATION_ERROR(-20011, 'Employee has no first name');
    END IF;

    IF l_name IS NULL OR length(l_name) = 0 THEN
      RAISE_APPLICATION_ERROR(-20012, 'Employee has no last name');
    END IF;

    IF d_name IS NULL OR length(d_name) = 0 THEN
      RAISE_APPLICATION_ERROR(-20013, 'Employee has no department');
    END IF;

    UPDATE employees SET email = concat(concat(concat(concat(f_name, '@'), l_name), '.'), d_name) WHERE employee_id = employee_id_;

    IF sql%ROWCOUNT != 1 THEN
      RAISE_APPLICATION_ERROR(-20014, 'Employee email could not be changed');
    END IF;
  END IF;
END CREATE_EMAIL_FOR_EMPLOYEES;
```

### Implementieren Sie einen Trigger, der sichser stellt, dass ein Mitarbeiter genau so viel verdient, wie das Max_salaray seiner Job_ID (insert)

```sql

-- Test Case
INSERT INTO EMPLOYEES VALUES (999,'Max','Mustermann',null,'147','2016-1-1',10,0,0,100,90);

-- Übung
create or replace TRIGGER test1
AFTER INSERT ON EMPLOYEES FOR EACH ROW
DECLARE
  v_max_salary jobs.max_salary%type;
BEGIN
  select max_salary
  into v_max_salary
  from jobs
  where job_id = :NEW.job_id;

  UPDATE EMPLOYEES
  set salary = v_max_salary
  where employee_id = :NEW.employee_id;
END;
```

### Schreiben sie einen Trigger, der sichser stellt, der die Email Adresse eines Mitarbeiters (beim Insert und falls leer) ändert auf \<Vorname>.\<Familienname>@\<Department_Name\>

*Lösung von Juri Schreib*

```sql
create or replace TRIGGER test2
AFTER INSERT ON EMPLOYEES FOR EACH ROW
DECLARE
pragma autonomous_transaction;
  v_employee employees%rowtype;
  v_dep_name departments.department_name%type;
BEGIN
  select *
  into v_employee
  from employees
  where employee_id = :NEW.employee_id;
  select DEPARTMENT_NAME
  into v_dep_name
  from departments
  where department_id = v_employee.department_id;

  if v_employee.email = '' then
    UPDATE EMPLOYEES
    set email = (v_employee.first_name || '.' || v_employee.last_name || '@' || v_dep_name)
    where employee_id = v_employee.employee_id;
  end if;
END;
```

### Erstellen Sie eine Prozedur die einen neuen Mitarbeter anlegne kann bzw. einen Jobwechsel eines bestehnden Mitarbeiters durchführen kann

### Implementieren sie ein Trigger, der sicherstellt das ein Mitarbeiter genau so viel verdient, wie das Max_Salaray seiner Job_Id

```sql
CREATE OR REPLACE TRIGGER check_max_salaray
BEFORE INSERT ON employees
v_max_salary jobs.max_salary%type;
BEGIN

  if new.job_id is null then
    RAISE_APPLICATION_ERROR(-20001, "job_id should be defined");
  end if;
  if new.salary is null then
    RAISE_APPLICATION_ERROR(-20001, "Salary should be defined");
  end if;

  select max_salary
  from jobs
  into v_max_salary
  where new.job_id = job_id;

  if v_max_salary is null or v_max_salary%rowxount > 1 then
      RAISE_APPLICATION_ERROR(-20001, "Could not retrive the max salaray for the job id" || job_id);

  if v_max_salary is not new.salary then
    RAISE_APPLICATION_ERROR(-20001, "max_salary is " || new.salary || ", but should be " || v_max_salary);
  end if;

END;

ALTER TRIGGER check_max_salaray DISABLE;
```

# Übungsbeispiele (von Markus)

### Erhöhen Sie das Einkommen der Mitarbeiter 110 wie folgt:
- die Firmenzugehörigkeit ist mehr als 7 Jahre -> 25%
- die Firmenzugehörigkeit ist mehr als 4 Jahre -> 12%
- in jedem anderen Fall: -> 9%

```sql
create or replace PROCEDURE inc_salary AS
  v_salary employees.salary%type;
  v_hire_date employees.hire_date%type;
  v_hire_age Number;


BEGIN
  select salary
  into v_salary
  from employees
  where employee_id = 110;

  if v_salray is null then
    RAISE_APPLICATION_ERROR(-20001, 'salry must not be null');
  end if;

  select hire_date
  into v_hire_date
  from employees
  where employee_id = 110;

  if v_hire_date is null then
    RAISE_APPLICATION_ERROR(-20002, 'hire_date must not be null');
  end if;

  v_hire_age := extract(year from current_timestamp) - extract(year from v_hire_date);



  if v_hire_age > 7 then
  update employees
  set salary = v_salary * 1.25
  where employee_id = 110;
  elsif v_hire_age > 4 then
  update employees
  set salary = v_salary * 1.12
  where employee_id = 110;
  else
  update employees
  set salary = v_salary * 1.07
  where employee_id = 110;
  end if;
EXCEPTION
when OTHERS
if v_salray is null then
  RAISE_APPLICATION_ERROR(-20420, 'internal server error');
end if;
END;

-- Test Case

select salaray
from employees
where employee_id = 110

-- Dann die Prozdur durchlaufen
-- Und prüfen ob sich der Betrag erhöht hat


```
