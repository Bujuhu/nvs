---
title: Oracle 2.2 Analytical Functions
layout: report
date: 2016-12-11
task: Introduction Uebung_001
taskHref: http://griesmayer.com/?menu=Oracle&semester=Semester_4&topic=02_AnalyticalFunctions
subject: dbi
---

Add the followng Table:

```sql
Create Table LAST_NAME_STOCK (
  stock_name varchar2(255),
  trading_date date,
  closing_price decimal(10, 2)
);
```

![](20170109_1109x766.png)

Fill the table with Data from the *Code_Stock.xlsx* file

![](20170109_645x491.png)

![](20170109_646x486.png)

![](20170109_464x817.png)

## Average per Stock

```sql
select stock_name, trading_date, closing_price, avg(closing_price) over
  (partition by stock_name) as AVG_PRICE
from last_name_stock;
```

![](20170109_1789x995.png)

## Total Average

```sql
select stock_name, trading_date, closing_price, avg(closing_price) over
  (partition by '') as AVG_PRICE
from last_name_stock;
```

![](20170109_1896x773.png)

## Yesterday & Tomorrow

```sql
select stock_name, trading_date, closing_price, avg(closing_price) over
  (partition by '') as AVG_PRICE
from last_name_stock;
```

```sql
select stock_name, trading_date, closing_price, FIRST_VALUE(closing_price) over
  (partition by closing_price
   ORDER BY stock_name, trading_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) as yesterday,
LAST_VALUE(closing_price) over
  (partition by closing_price
  ORDER BY stock_name, trading_datem ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) as tomorrow
from last_name_stock;
```

![](20170109_1919x925.png)

## Rank function

```sql
select RANK(1.43) WITHIN GROUP (ORDER BY closing_price)
```

![](20170109_1487x835.png)
