import java.util.Scanner;

public class WordsCounter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please add your text:");
        String text = scanner.nextLine();
        String[] textArray = text.split(" ");
        System.out.println(textArray.length);
    }
}