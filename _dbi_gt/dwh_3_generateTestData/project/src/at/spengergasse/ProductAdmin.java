package at.spengergasse;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class ProductAdmin {
    private int year;
    private int month;
    private int day;
    private int number_of_files;
    private int datalines = 0;

    public ProductAdmin(int year, int month, int day, int number_of_files) {
        for(int i = 0; i < number_of_files; i++) {
            int currentDay = day + i;

            try {
                FileOutputStream fileOs = new FileOutputStream("products_" + year + month + currentDay + ".txt", true);
                PrintStream printOs = new PrintStream(fileOs);
                printOs.println(Product.getCSVHEADER());
                for(int j = 0; j < 12142; j++) {
                    if(Math.random() > 0.2) {
                        printOs.println(new Product(i * 10 + j, i * 10 + j).getCSVLine());
                    }
                    else {
                        printOs.println(" ");
                    }
                    datalines++;
                }
                printOs.println("---EOF---");
                printOs.println("Lines: " + datalines);

                printOs.flush();
                printOs.close();
                fileOs.flush();
                fileOs.close();
            }
            catch(Exception e) {
                System.out.println("An error occured while creating a new file," + e.getMessage());
            }

        }
    }
}
