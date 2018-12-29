import java.util.Scanner;
public class CaesarCipher {
    private int akey;
    static char data[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    private int count;
    private int count2;

    public CaesarCipher(int key) {
        akey = key;
    }

    public String encrypt(String message) {
        char encryptarray[] = new char[message.length()];
        for (int i = 0; count2 < message.length(); i++) {
            if ((message.charAt(count2)) == data[count]) {
                if (Integer.valueOf(akey) + Integer.valueOf(count) > 26) {
                    encryptarray[count2] = data[(Integer.valueOf(akey) + Integer.valueOf(count)) - 26];
                    count = 0;
                    count2++;
                } else {
                    encryptarray[count2] = data[Integer.valueOf(akey) + Integer.valueOf(count)];
                    count = 0;
                    count2++;
                }
            } else {
                count++;
            }
        }
        for (int i = 0; i < encryptarray.length; i++) {
            System.out.print(encryptarray[i]);
        }
        count2 = 0;
        return null;
    }

    public String decrypt(String message) {
        char decryptarray[] = new char[message.length()];
        for (int i = 0; count2 < message.length(); i++) {
            if ((message.charAt(count2)) == data[count]) {
                if (Integer.valueOf(count) - Integer.valueOf(akey) < 0) {
                    decryptarray[count2] = data[25 - (Integer.valueOf(akey) - Integer.valueOf(count))];
                    count = 0;
                    count2++;
                } else {
                    decryptarray[count2] = data[Integer.valueOf(akey - (2 * akey)) + Integer.valueOf(count)];
                    count = 0;
                    count2++;
                }
            } else {
                count++;
            }
        }
        for (int i = 0; i < decryptarray.length; i++) {
            System.out.print(decryptarray[i]);
        }
        count2 = 0;
        return null;
    }

    public static void crack(String message) {
        Scanner scanner = new Scanner(System.in);
        int a = 0;
        while (a == 0) {
            System.out.println("Key?");
            int input = scanner.nextInt();
            int akey = input;
            if (akey != 0) {
                CaesarCipher another = new CaesarCipher(akey);
                System.out.print("Result: ");
                another.decrypt(message);
                System.out.println("");
                akey++;
            } else {
                a++;
            }
        }
    }
    public void displayEncryptionStats(){

    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        char countarray[] = new char[52];
        boolean end=true;
        while (end==true) {
            int counter=0;
            int counter2=0;
            int counter3=0;
            int counter4=0;
            int counter5=0;
            System.out.println("What is your key? ");
            int keyvalue = scanner.nextInt();
            CaesarCipher trial = new CaesarCipher(keyvalue);
            System.out.println("what would you like to do?");
            System.out.println("encrypt");
            System.out.println("decrypt");
            System.out.println("crack");
            System.out.println("quit");
            String choice = scanner.next();
            if (choice.equals("encrypt")) {
                System.out.println("Please enter the message: ");
                String input = scanner.next();
                for (int i = 0; counter2 < input.length(); i++) {
                    if ((input.charAt(counter2)) == data[counter3]) {
                        countarray[counter2] = data[Integer.valueOf(counter4) + Integer.valueOf(counter3)];
                        System.out.println(countarray[counter2]);
                        counter3 = 0;
                        counter2++;
                    } else {
                        counter3++;
                    }
                }
                System.out.print("Result: ");
                trial.encrypt(input);
                System.out.println("");
                while (counter < input.length()) {
                    System.out.print(countarray[counter] + ":");
                    for (int i = 0; i < 26; i++) {
                        if(countarray[counter]==data[i]){counter5++;}
                        else{;}
                    }
                    System.out.print(counter5);
                    System.out.println("");
                    counter5=0;
                    counter++;
                }
            }
            if (choice.equals("decrypt")) {
                System.out.println("Please enter the message: ");
                String input = scanner.next();
                System.out.print("Result: ");
                trial.decrypt(input);
                System.out.println("");
            }
            if (choice.equals("crack")) {
                System.out.println("Please enter the message: ");
                String input = scanner.next();
                trial.crack(input);
            }
            if (choice.equals("quit")){
                end=false;
            }
        }
    }
}