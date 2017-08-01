--------------------------------------------------------
--  File created - Monday-October-10-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "DEMO"."PRODUCT" 
   (	"PRODUCT_ID" NUMBER(*,0), 
	"PRODUCT_NAME" VARCHAR2(20 BYTE), 
	"PRODUCT_PRICE" NUMBER(2,6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEMO"."PRODUCT_PK" ON "DEMO"."PRODUCT" ("PRODUCT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "DEMO"."PRODUCT" MODIFY ("PRODUCT_PRICE" NOT NULL ENABLE);
  ALTER TABLE "DEMO"."PRODUCT" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
  ALTER TABLE "DEMO"."PRODUCT" ADD CONSTRAINT "PRODUCT_PK" PRIMARY KEY ("PRODUCT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "DEMO"."PRODUCT" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);



///
--------------------------------------------------------
--  File created - Monday-October-10-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "DEMO"."CUSTOMER" 
   (	"CUSTOMER_ID" NUMBER, 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"CREDIT" NUMBER(2,10)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEMO"."CUSTOMER_PK" ON "DEMO"."CUSTOMER" ("CUSTOMER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "DEMO"."CUSTOMER" ADD CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "DEMO"."CUSTOMER" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);

////
--------------------------------------------------------
--  File created - Monday-October-10-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SALES
--------------------------------------------------------

  CREATE TABLE "DEMO"."SALES" 
   (	"CUSTOMER_ID" NUMBER(*,0), 
	"PRODUCT_ID" NUMBER(*,0), 
	"SALES_DATE" DATE, 
	"PIECES" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Ref Constraints for Table SALES
--------------------------------------------------------

  ALTER TABLE "DEMO"."SALES" ADD CONSTRAINT "CUSTOMER_ID" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "DEMO"."CUSTOMER" ("CUSTOMER_ID") ENABLE;



///
--------------------------------------------------------
--  File created - Monday-October-10-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STOCK
--------------------------------------------------------

  CREATE TABLE "DEMO"."STOCK" 
   (	"PRODUCT_ID" NUMBER(*,0), 
	"SHELF" CHAR(1 BYTE), 
	"PIECES" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index STOCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEMO"."STOCK_PK" ON "DEMO"."STOCK" ("SHELF") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table STOCK
--------------------------------------------------------

  ALTER TABLE "DEMO"."STOCK" ADD CONSTRAINT "STOCK_PK" PRIMARY KEY ("SHELF")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "DEMO"."STOCK" MODIFY ("SHELF" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table STOCK
--------------------------------------------------------

  ALTER TABLE "DEMO"."STOCK" ADD CONSTRAINT "PRODUCT_ID" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "DEMO"."PRODUCT" ("PRODUCT_ID") ENABLE;


