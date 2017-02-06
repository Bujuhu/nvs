package at.spengergasse;


import java.sql.Date;

public class Product {
    /*
| Key | name | type
| --|--
| PK | Product_uid | Integer
| PK | Product_series | Integer
| PK | Product_category | Integer
| PK | Insurance_plan | Integer
|| Name | Varchar(255)
|| product_activation_date | date
|| iteration | Integer
|| insurance_years | integer
|| insurance_details | varchar(4095)
|| products_sold | integer
|| price | decimal (7,2)
|| activated | boolean
|| repairs | integer
     */

    private int productUid;
    private int productSeries;
    private int productCategory;
    private int insurancePlan;
    private String name;
    private String date;
    private int iteration;
    private int insuranceYears;
    private String insuranceDetaails;
    private int productsSold;
    private double price;
    private String activated;
    private int repairs;

    public Product(int uid, int series) {
        set_product_uid(uid);
        set_product_series(series);
        set_product_category();
        set_insurance_plan();
        set_name();
        set_date();
        set_iteration();
        set_insurance_years();
        set_insurance_details();
        set_products_sold();
        set_price();
        set_activated();
        set_repairs();
    }


    public void set_product_uid(int productUid) {
        this.productUid = productUid;
    }
    public void set_product_series(int productSeries) {

        this.productSeries = productSeries / 4;
    }
    public void set_product_category() {
        this.productCategory =  Math.round(Math.round(Math.random()* 4));
    }
    public void set_insurance_plan() {
        this.insurancePlan = Math.round(Math.round(Math.random()* 3));
    }
    public void set_name() {
        this.name =  "Sample Product";
    }

    public void set_date() {

        this.date =  new Date(1,1,1).toString();
    }
    public void set_iteration() {
        this.iteration = Math.round(Math.round(Math.random()* 20));
    }
    public void set_insurance_years() {
        this.insuranceYears = Math.round(Math.round(Math.random()* 20));
    }
    public void set_insurance_details() {
        this.insuranceDetaails =  "Sample Insurance";
    }
    public void set_products_sold() {
        this.productsSold =  Math.round(Math.round(Math.random()* 2000));
    }
    public void set_price() {
        this.price =  Math.round(Math.random()* 5000);
    }
    public void set_activated() {
        if(Math.random() > 0.5) {
            this.activated = "1";
        }
        else {
            this.activated = "0";
        }
    }
    public void set_repairs() {
        this.repairs =  Math.round(Math.round(Math.random()* 10));
    }

    public static String getCSVHEADER() {
            /*
| Key | name | type
| --|--
| PK | Product_series | Integer
| PK | Product_category | Integer
| PK | Insurance_plan | Integer
|| Name | Varchar(255)
|| product_activation_date | date
|| warrenty_years | integer
|| insurance_years | integer
|| sold_date | date
|| products_sold | integer
|| product_price | decimal (7,2)
|| insurance_price | decimal(7,2)
|| activated | boolean
|| repairs | integer
|| repair_cost | price
     */
            return  "PRODUCT_SERIES\tPRODUCT_CATEGORY\tINSURANCE_PLAN\tNAME\tACTIVATION_DATE\twarrenty_years\tINSURANCE_YEARS\tSOLD_DATE\tPRODUICT_SOLD\tPRODUCT_PRICE\tINSURANCE_PRICE\tACTIVATED\tREPAIRS\tRepair_cost";
    }
    public String getCSVLine() {
     return new StringBuilder()
             .append(productSeries)
             .append("\t")
             .append(productCategory)
             .append("\t")
             .append(insurancePlan)
             .append("\t")
             .append(name)
             .append("\t")
             .append("2000-1-1")
             .append("\t")
             .append(insuranceYears)
             .append("\t")
             .append(insuranceYears + 6)
             .append("\t")
             .append("2000-1-1")
             .append("\t")
             .append(productsSold)
             .append("\t")
             .append(price)
             .append("\t")
             .append(price * 1.2)
             .append("\t")
             .append(activated)
             .append("\t")
             .append(repairs)
             .append("\t")
             .append(price * 2)
             .append("\t").toString();
    }
}
