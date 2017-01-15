package at.spengergasse;

import java.sql.Date;

public class Main {
    public static void main(String[] args) {
        try
        {
            Product product;
            if (args.length != 0)
            {
                productAdmin = new ProductAdministration();

                productAdmin = new ProductAdministration(
                        Integer.parseInt(args[0]),
                        Integer.parseInt(args[1]),
                        Integer.parseInt(args[2]),
                        Integer.parseInt(args[3]));
            }
        }
        catch (NumberFormatException e)
        {
            System.err.println("Wrong format");
            System.err.println("USE: YEAR MONTH DAY NUMBER_OF_DAYS");
        }
        catch (Exception e) {
            e.getMessage();
        }
}
