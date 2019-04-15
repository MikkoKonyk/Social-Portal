import java.util.Scanner;

public class CircleSquare {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Add your circle radius:");
        double radius = scanner.nextDouble();
        double pi = 3.14;
        double area = pi*(radius*radius);
        System.out.println("Your circle square equals " + area);
        double circleLength= pi*2*radius;
        System.out.println("Your circle length equals: " + circleLength) ;
    }
}