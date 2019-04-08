import java.util.Scanner;

public class PercentOfSum {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter you sum: ");
        double number1 = scanner.nextInt();
        System.out.println("Please enter part of your sum: ");
        double number2 = scanner.nextInt();
        double result = number2*100/number1;
        System.out.println("Percent of your sum equals: " + result + "%");
    }
}
