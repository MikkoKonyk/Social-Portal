import java.util.Scanner;

public class TestDivider {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter you first number: ");
        int number1 = scanner.nextInt();
        Scanner scanner2 = new Scanner(System.in);
        System.out.println("Please enter you second number: ");
        int number2 = scanner2.nextInt();
        if (number1%number2 == 0) {
            System.out.println("Second number is a divider for first number");
        } else {
            System.out.println("Second number isn't a divider for first number");
        }
    }
}