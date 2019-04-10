public class CatCounter {
    public static void main(String[] args) {
        int count = 0;
        String text = "hi cat or cat not cat but cat is cat after";
        String[] textArray = text.split(" ");
        for(int i=0; i<textArray.length; i++) {
            if (textArray[i].equals("cat")) {
                count++;
            }
        }
        System.out.println(count);
    }
}
