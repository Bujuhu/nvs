---
title: BI 1 ETL_MLoad
layout: report
date: 2017-03-10
task: BI 1 ETL_MLoad
description: Erfüllung der Aufgabenstellung
subject: dbi
---

## Creating a new Database and Table

Connect to the Microsoft Database and create a new Database:
*Databases -> New Database*

Select proucts_schreib, open a new query.

Run the same sql create table script that we used in the DWH excersises

```sql
create table products(
        product_series integer,
        product_category integer,
        insurance_plan integer,
        name  varchar(255),
        activation_date date,
        warrenty_years integer,
        insurance_years integer,
        sold_date date,
        products_sold integer,
        product_price decimal(7,2),
        insurance_price decimal(7,2),
        activated integer,
        repairs integer,
        repair_cost decimal(7,2),
        primary key(product_series, product_category, insurance_plan)
      )
```

### Result

![](20170310_240x423.png)

## Creating the Integration Service

*Note: If a Null Pointer Exception occurs on project creation, just restart the application*

Connection Manager -> New Connection -> OLE DB Connection

![](20170310_566x628.png)


Add a Textfile from your Project that should be imported to the VM.

Connection Manager -> New Flat File Connection

![](20170310_769x699.png)


Automatically set the Data Type of each Column

![](20170310_605x561.png)


### Create the Workflow

Add a ForEach Loop Container from the Sidebar

![](20170310_779x678.png)

![](20170310_736x489.png)


Add a new Variables

![](20170310_712x561.png)

### Add copy files task

![](20170310_689x411.png)

### Add a Data Flow task

Add a flat file source to the Dataflow task

Add transformation (derived column)

 substring([ACTIVATION_DATE],1,4) + "-"  + substring([ACTIVATION_DATE],5,2) + "-" +  substring([ACTIVATION_DATE],7,2)

 ![](20170310_854x673.png)

Add a Data Conversion

![](20170310_816x489.png)

![](20170310_620x152.png)

Add OLEDB Destination

![](20170310_816x582.png)

## Run

![](20170310_399x496.png)

![](20170310_385x439.png)

I had an Issue where, Null Collumns would not be ignored correctly, so I added a confitional split

![](20170310_249x403.png)

![](20170310_390x520.png)
