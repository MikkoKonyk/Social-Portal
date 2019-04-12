import java.util.Scanner;

public class LaptopPrices {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Add price of laptop:");
        double laptopPrice = scanner.nextDouble();
        System.out.println("Add quantity of laptops:");
        double laptopQuantity = scanner.nextDouble();
        System.out.println("Add you discount, %:");
        double discount = scanner.nextDouble();
        double total = (laptopPrice*(1-(discount/100))*laptopQuantity);
        System.out.println("Total value of laptops equals " + total);
    }
}
