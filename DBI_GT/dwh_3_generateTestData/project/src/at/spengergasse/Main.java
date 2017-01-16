package at.spengergasse;

public class Main {
    public static void main(String[] args) {
        try {
            if (args.length != 0) {
                ProductAdmin product = new ProductAdmin(
                        Integer.parseInt(args[0]),
                        Integer.parseInt(args[1]),
                        Integer.parseInt(args[2]),
                        Integer.parseInt(args[3]));
            }
        } catch (NumberFormatException e) {
            System.err.println("Wrong format");
            System.err.println("USE: YEAR MONTH DAY NUMBER_OF_DAYS");
        } catch (Exception e) {
            e.getMessage();
        }
    }
}
