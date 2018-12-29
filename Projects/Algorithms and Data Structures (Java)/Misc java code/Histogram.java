import java.util.Scanner;
import java.lang.Math;
public class Histogram {
    private int lower;
    private int upper;
    private int swapper;
    private int holder;
    private int dcounter;
    private int counter;
    private static int failsafe;
    private int[] anarray = new int[100];
    private int[] dataarray = new int[100];

    public Histogram(int m, int n) {
        if (m > n) {
            swapper = m;
            m = n;
            n = swapper;
        }
        if(m<0){
            m=Math.abs(m);
            n=Math.abs(n);
        }
        else{lower = m;
        upper = n;}
//        if (lower < 0) {
//            m = Math.abs(upper);
//            n = Math.abs(lower);
//            for (int i = m; i <= n; i++) {
//                anarray[i] = m++;
//            }
//            System.out.println("Data? ");

        //ADD METHOD
//            Scanner keyboard = new Scanner(System.in);
//            String inputString = keyboard.nextLine();
//            Scanner scanner = new Scanner(inputString);
//            while (scanner.hasNext()) {
//                int number = scanner.nextInt();
//                    dataarray[dcounter] = number;
//                    dcounter++;
        //           }
        //      }

        for (int i = m; i <= n; i++) {
            anarray[i] = m++;
        }
        System.out.println("Data? ");

        //ADD METHOD
        Scanner keyboard = new Scanner(System.in);
        String inputString = keyboard.nextLine();
        Scanner scanner = new Scanner(inputString);
        while (scanner.hasNext()) {
            int number = scanner.nextInt();
            if (add(number) == true) {
                dataarray[dcounter] = number;
                dcounter++;
            }
        }
    }
    //WITHOUT USING ADD OUT OF RANGE
    //    else {
    //        System.out.println("User input not in range");
    //          failsafe++;
    //            return;
    //          }
//        }

//    ADD OUT OF RANGE METHOD
//        System.out.println("New upper? ");
//        Scanner keyboard2 = new Scanner(System.in);
//        String inputString2 = keyboard2.nextLine();
//        Scanner scanner2 = new Scanner(inputString2);
//        while (scanner2.hasNext()) {
//            int number = scanner2.nextInt();
//            addOutOfRange(Math.abs(number));
//            }
//}

    public boolean add(int i) {
        if (i <= Math.abs(upper) && i >= Math.abs(lower)) {
            return true;
        } else {
           return false;
        }
    }

    public void addOutOfRange(int i) {
        anarray[upper+1]=i;
        upper=i;
    }

    public String toString() {
        if(lower<0){
            int m=Math.abs(lower);
            int n=Math.abs(upper);
            int a = lower;
            int boundscount = lower;
            while (boundscount <= upper) {
                System.out.print("-"+m + ": ");
                for (int i = 0; i < dcounter; i++) {
                    //     System.out.println("anarry: "+anarray[a]+"dataarray: "+dataarray[i]);
                    if (anarray[a] == dataarray[i]) {
                        counter++;
                    } else {
                        ;
                    }
                }
                for (int i = 0; i < counter; i++) {
                    System.out.print("*");
                }
                a++;
                boundscount++;
                counter = 0;
                m++;
                System.out.println("");
            }
            return null;
        }
        else{
            int a = lower;
            int boundscount = lower;
            while (boundscount <= upper) {
                System.out.print("-"+lower + ": ");
                for (int i = 0; i < dcounter; i++) {
                    //     System.out.println("anarry: "+anarray[a]+"dataarray: "+dataarray[i]);
                    if (anarray[a] == dataarray[i]) {
                        counter++;
                    } else {
                        ;
                    }
                }
                for (int i = 0; i < counter; i++) {
                    System.out.print("*");
                }
                a++;
                boundscount++;
                counter = 0;
                lower++;
                System.out.println("");
            }
            return null;
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter lowerbound");
        int m = scanner.nextInt();
        System.out.println("Please enter upperbound");
        int n = scanner.nextInt();
        Histogram data = new Histogram(m, n);
        if (failsafe == 0) {
            data.toString();
            System.out.println("");
        } else {
            return;
        }
    }
        }
