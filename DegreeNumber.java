import java.util.Scanner;

public class DegreeNumber {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Your mathematical expression: y = aⁿ");
        System.out.println("n = 4 and n = 20: ");
        System.out.println("Add your value for a: ");
        int number = scanner.nextInt();
        double z = Math.pow(number,2);
        double z1 = Math.pow(z,2);
        double y = z1*2;
        double y1 = Math.pow(y,2);
        double y2 = Math.pow(y1,2);
        System.out.println("Your result: y = " + z1 + " and y = " + y2);
    }
}
