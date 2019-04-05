import java.util.Scanner;

public class Factorial {
    public static void main(String[] args) {
        int number;
        long result = 1;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Add a number:");
        if (scanner.hasNextInt()) {
            number = scanner.nextInt();
            for (int i = number; i > 0; i--) {
                result *= i;
            }
            System.out.println("Factorial of number " + number + " = " + result);
        } else {
            System.out.println("Error! You added not number!");
        }

        Scanner scanner2 = new Scanner(System.in);
        System.out.println("Add a number for a second variant:");
        System.out.println("Factorial of from second number = " + factorial(scanner2.nextInt()));
    }

    public static int factorial(int number) {
        if (number == 0) {
            return 1;
        } else {
            return (number * factorial(number - 1));
        }
    }
}