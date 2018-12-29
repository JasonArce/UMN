public class pEquals {
    static char data[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    private static int count;
    private static int i;
    private int encyptarray[] = new int[100];
    public String message="dog";

    //    public String encrypt(String message) {
    //       for (int i = 0; i < message.length(); i++) {
    //           if (message.charAt(i).equals(data[count])) {
    //               encyptarray[i] = data[count + akey];
    //               count = 0;
    //           } else {
    //               count++;
    //          }
    //     }
    //  }
    public static String encypt(String message) {
        while (i < message.length()) {
            System.out.println(message.charAt(i));
            i++;
        }
        while(i<message.length()){
            System.out.println(data[count]);{
                count++;
            }
        }
        return(null);
    }


    public static void main(String[] args) {
        encypt("dog");
    }
}