create or replace procedure proc_products as
   v_tablecnt number;
begin
  select count(*)
    into v_tablecnt
    from all_tables
    where table_name = 'products' and owner = 'schreib_explain';

  if v_tablecnt = 0 then
    execute immediate
      'create table products(
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
        activated number,
        repairs integer,
        repair_cost decimal(7,2),
        primary key(product_series, product_category, insurance_plan)
      )';
  end if;
end;
