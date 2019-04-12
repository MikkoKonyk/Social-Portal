public class DeleteWords {
    public static void main(String[] args) {
        String text = "function hi cat or function cat not function cat but cat is cat after";
        text = text.replaceAll("function", "");
        System.out.println(text.replaceAll("\\s+", " "));
    }
}
