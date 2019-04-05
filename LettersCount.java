import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class LettersCount {

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

        System.out.println("Add your text, please:");
        String text = in.readLine();
        Integer count = 0;
        for (Integer i = 0; i < text.length(); i++) {
            if (text.charAt(i) == 'a') {
                count++;
            }
        }
        System.out.println("Count of 'a' letters = " + count);
    }
}