---
title: 6 Rights
layout: report
date: 2016-11-07
task: Rights Uebung_001
taskHref: http://griesmayer.com/?menu=Oracle&semester=Semester_3&topic=06_Rights
subject: dbi
---

```sql
create smallfile tablespace "shop_schreib" DATAFILE
'/home/oracle/app/oracle/oradata/orcl/shop_schreib1.dbf' size 200M autoextend on next 100M maxsize 300M,
'/home/oracle/app/oracle/oradata/orcl/shop_schreib2.dbf' size 100m logging extent management local segment space management auto

```

Create a new user

```sql

create user "ADMIN_SCHREIB" profile "DEFAULT" identified by "pass" default tablespace "shop_schreib" temporary tablespace "temp" account unlock
grant grant any object privilege to "ADMIN_SCHREIB"
grant grant any privilege to "ADMIN_SCHREIB"
grant selct any dictionary to "ADMIN_SCHREIB" with admin option    
grant unlimited tablespace to "ADMIN_SCHREIB"
grant "CONNECT" to "ADMIN_SCHREIB"
grant "RESOURCE" to "ADMIN_SCHREIB";
```

Create the table and insert some lines:

```sql
CREATE TABLE schreib.product
(
product_id INTEGER PRIMARY KEY,
product_name VARCHAR2(20),
product_price DECIMAL(10,2)
)

insert into schreib.product values
  (1, 'Brot', 2.49),
  (2, 'Pizza', 5),
  (3, 'Zahnpasta', 5)
```

  Create a new user

```sql
create user "SCHREIB" profile "DEFAULT" identified by "pass" default tablespace "shop_schreib" temporary tablespace "temp" account unlock
grant select, insert on schreib.product to "SCHREIB"
grant insert to "SCHREIB"
grant update(product_price) on schreib.product to "SCHREIB"
grant delete on schreib.product_delete to "SCHREIB"
```
