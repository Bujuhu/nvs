---
title: DWH 2 FactTable
layout: report
date: 2017-01-02
task: Introduction Uebung_001
taskHref: http://griesmayer.com/?menu=Dataware%20House&semester=Semester_5&topic=02_FactTable
subject: dbi
---

## Products

| Key | name             | type
| --- | ---------------- |
| PK  | Product_series   | Integer
| PK  | Product_category | Integer
| PK  | Insurance_plan   | Integer
|     | Name             | Varchar(255)
|     | activation_date  | date
|     | warrenty_years   | integer
|     | insurance_years  | integer
|     | sold_date        | date
|     | products_sold    | integer
|     | product_price    | decimal (7,2)
|     | insurance_price  | decimal(7,2)
|     | activated        | boolean
|     | repairs          | integer
|     | repair_cost      | price

Aufsummierbare Werte (Bsp.):

- Produkte verkauft
- Umsatz pro Produkt
- VProdukte Versichert
- Produkte in einer Kategorie
- Anzahl notweniger Reperaturen


## Bill

| Key | name | type
| -- |
| PK | First_name | varchar(255)
| PK | Last_name | varchar(255)
| PK | employee_id | Integer
| Pk | customer_id | Integer
| PK | store | Integer
|| Street | varchar(255)
|| ZIP | varchar(255)
|| Country | varchar(255)
|| price | decimal(7,2)
|| billing_date | datetime
|| product | integer


## Software
| Key | name | type
| -- |
| PK | software_id | varchar(255)
| PK | version | varchar(255)
| PK | category | varchar(255)
|| publishDate | Date
|| name | varchar(255)
|| public | boolean
|| description | varchar(4095)
|| downloads | integer
