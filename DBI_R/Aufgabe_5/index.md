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
