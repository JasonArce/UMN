import java.util.Scanner;
import java.io.PrintWriter;
import java.io.File;

public class PracticeWrite {
    public static void main(String[] args) {

//        Scanner s = null;

//        try {
//            s = new Scanner(new File("Longhand.java"));
//        }
//        catch (Exception e){
//            System.out.println("false");
//            return;}

        try {
            PrintWriter p = new PrintWriter("Sample.txt", "UTF-8");
            p.print("Hello, ");
            p.close();
        }
        catch (Exception e) {
            System.out.println("false");
            return;}
    }
}