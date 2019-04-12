import java.util.Scanner;

public class SpeedCounter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Add a distance to the airport in km:");
        double distance = scanner.nextDouble();
        System.out.println("Add a time, which you need to get to the airport in minutes:");
        double time = scanner.nextDouble();
        double speed = (distance/(time/60));
        System.out.println("Your speed should be " + speed);
    }
}
