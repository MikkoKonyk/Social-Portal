import java.util.Scanner;

public class ArrayOfNumbers {
    public static void main(String[] args) {
        int numbers1;
        int numbers2 = 0;
        do {
            Scanner scanner = new Scanner(System.in);
            System.out.println("Add your number but more than 3: ");
            numbers1 = scanner.nextInt();
            if (numbers1 < 4) {
                System.out.println("Error! You added not a right number! Try again!");
            }
        }
        while (numbers1 < 4);
        int[] array1 = new int[numbers1];
        for (int i = 0; i < array1.length; i++) {
            array1[i] = (int) (Math.random() * (numbers1 + 1));
            System.out.print(array1[i] + " ");
            if (array1[i] % 2 == 0 & array1[i] != 0) {
                numbers2++;
            }
        }
        System.out.println();
        if (numbers2 > 0) {
            int[] array2 = new int[numbers2];
            for (int b = 0, d = 0; b < array1.length; b++) {
                if (array1[b] % 2 == 0 & array1[b] != 0) {
                    array2[d] = array1[b];
                    System.out.print(array2[d] + " ");
                }
            }
        }
    }
}