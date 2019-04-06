public class TestArrey {
    public static void main(String[] args) {
        int[] numbers = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        int maxValue = numbers[0];
        int index = 0;
        for (int i = 0; i < numbers.length; i++) {
            int number = numbers[i];
            if (maxValue < number) {
                maxValue = number;
                index = i;
            }
        }
        System.out.println("Index of max number: " + index);
        System.out.println("Value of max number: " + numbers[index]);
    }
}
