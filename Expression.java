import java.util.Scanner;

public class Expression {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Your mathematical expression: y = cos(x³/2,1) + cos(x²/1,1) - 8,3*sin(3*x + 1)");
        System.out.println("Add your value for x:");
        double number = scanner.nextInt();
        double y = Math.cos(Math.pow(number,3)/2.1) + Math.cos(Math.pow(number,2)/1.1) + 8.3*Math.sin(3*number + 1);
        System.out.println("Value for y equals: " + y);
    }
}
