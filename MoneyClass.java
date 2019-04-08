import java.util.Scanner;

public class MoneyClass {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Add your sum:");
        double gryvnia = scanner.nextDouble();
        if (gryvnia > 0) {
            int integer = (int) gryvnia;
            double coin = gryvnia - integer;
            coin = coin*100;
            int cent = (int) coin;
            System.out.println(integer + " gryvnias " + cent + " cents");
        }
    }
}