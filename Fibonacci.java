import java.util.Scanner;

public class Fibonacci {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter number for first method: ");
        long number = scanner.nextLong();
        if (number >= 0) {
            long fibo = getFibonacciOf(number);
            System.out.println("Sum all numbers from Fibonacci method equals = " + fibo);
        }

        Scanner input = new Scanner(System.in);
        System.out.println("Enter number for second method: ");
        int number2 = input.nextInt();
        long a1 = 0;
        long a2 = 1;
        for (int i = 1; i < number2; i++) {
            long a3 = a1 + a2;
            a1 = a2;
            a2 = a3;
            System.out.println(a3);
        }
    }

    public static long getFibonacciOf(long number) {
        if (number == 0) {
            return 0;
        } else if (number == 1) {
            return 1;
        } else {
            return getFibonacciOf(number - 2) + getFibonacciOf(number - 1);
        }
    }
}
