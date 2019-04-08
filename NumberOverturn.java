import java.util.Scanner;

public class NumberOverturn {
    public static void main(String[] args) {
        System.out.println("Enter number which you want to overturn:");
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        int over_number = overturn(number);
        System.out.println("Your overturned number is: " + over_number);
    }
    private static int overturn(int number) {
        int backup = number;
        int count = 0;
        while (number != 0) {
            number = number / 10;
            count++;
        }
        number = backup;
        int sum = 0;
        for (int i = count; i > 0; i--) {
            int sum10 = 1;
            int last = number % 10;
            for (int j = 1; j < i; j++) {
                sum10 = sum10 * 10;
            }
            sum = sum + (last * sum10);
            number = number / 10;
        }
        return sum;
    }
}
