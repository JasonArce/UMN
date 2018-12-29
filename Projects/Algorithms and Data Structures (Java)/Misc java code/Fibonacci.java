import java.util.Scanner;
public class Fibonacci {
    public static int Fibonacci(int number) {
        if (number == 1 || number == 2) {
            return 1;
        }

        return Fibonacci(number - 1) + Fibonacci(number - 2);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String hold = scanner.next();
        int number=Integer.valueOf(hold);
        if(number<1){
            System.out.println("Not a valid number");
        }
        else{
        System.out.println(Fibonacci(number));
    }
}}