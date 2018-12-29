import java.util.Scanner;
public class Longhand {
    public static String Ones(String hold) {
        //if (hold.length() == 1)
        {
            if (hold.substring(hold.length() - 1).equals("0")) {
                return ("Zero");
            }
            if (hold.substring(hold.length() - 1).equals("1")) {
                return ("One");
            }
            if (hold.substring(hold.length() - 1).equals("2")) {
                return ("Two");
            }
            if (hold.substring(hold.length() - 1).equals("3")) {
                return ("Three");
            }
            if (hold.substring(hold.length() - 1).equals("4")) {
                return ("Four");
            }
            if (hold.substring(hold.length() - 1).equals("5")) {
                return ("Five");
            }
            if (hold.substring(hold.length() - 1).equals("6")) {
                return ("Six");
            }
            if (hold.substring(hold.length() - 1).equals("7")) {
                return ("Seven");
            }
            if (hold.substring(hold.length() - 1).equals("8")) {
                return ("Eight");
            }
            if (hold.substring(hold.length() - 1).equals("9")) {
                return ("Nine");
            }
        }
        return null;
    }

    public static String Teens(String hold) {
        //if (hold.length() == 2)
        {
            if (hold.substring(hold.length() - 1).equals("0")) {
                return ("Ten");
            }
            if (hold.substring(hold.length() - 1).equals("1")) {
                return ("Eleven");
            }
            if (hold.substring(hold.length() - 1).equals("2")) {
                return ("Twelve");
            }
            if (hold.substring(hold.length() - 1).equals("3")) {
                return ("Thirten");
            }
            if (hold.substring(hold.length() - 1).equals("4")) {
                return ("Fourteen");
            }
            if (hold.substring(hold.length() - 1).equals("5")) {
                return ("Fifteen");
            }
            if (hold.substring(hold.length() - 1).equals("6")) {
                return ("Sixteen");
            }
            if (hold.substring(hold.length() - 1).equals("7")) {
                return ("Seventeen");
            }
            if (hold.substring(hold.length() - 1).equals("8")) {
                return ("Eighteen");
            }
            if (hold.substring(hold.length() - 1).equals("9")) {
                return ("Nineteen");
            }
        }
        return null;
    }

    public static String Tens(String hold) {
        //if (hold.length() == 2)
        {
            if (hold.substring(0, 1).equals("0")) {
                return (Ones(hold));
            }
            if (hold.substring(0, 1).equals("2")) {
                return ("Twenty " + Ones(hold));
            }
            if (hold.substring(0, 1).equals("3")) {
                return ("Thirty " + Ones(hold));
            }
            if (hold.substring(0, 1).equals("4")) {
                return ("Forty " + Ones(hold));
            }
            if (hold.substring(0, 1).equals("5")) {
                return ("Fifty " + Ones(hold));
            }
            if (hold.substring(0, 1).equals("6")) {
                return ("Sixty " + Ones(hold));
            }
            if (hold.substring(0, 1).equals("7")) {
                return ("Seventy " + Ones(hold));
            }
            if (hold.substring(0, 1).equals("8")) {
                return ("Eighty " + Ones(hold));
            }
            if (hold.substring(0, 1).equals("9")) {
                return ("Ninty " + Ones(hold));
            }
        }
        return null;
    }

    public static String Hundreds(String hold) {
        {
            if (hold.substring(0, 1).equals("0")) {
                return (Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("1")) {
                return ("One Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("2")) {
                return ("Two Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("3")) {
                return ("Three Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("4")) {
                return ("Four Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("5")) {
                return ("Five Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("6")) {
                return ("Six Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("7")) {
                return ("Seven Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("8")) {
                return ("Eight Hundred " + Tens(hold.substring(1, 3)));
            }
            if (hold.substring(0, 1).equals("9")) {
                return ("Nine Hundred " + Tens(hold.substring(1, 3)));
            }
        }
        return null;
    }

    public static String Thousands(String hold) {
        {
            if (hold.substring(0, 1).equals("0")) {
                return (Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("1")) {
                return ("One Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("2")) {
                return ("Two Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("3")) {
                return ("Three Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("4")) {
                return ("Four Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("5")) {
                return ("Five Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("6")) {
                return ("Six Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("7")) {
                return ("Seven Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("8")) {
                return ("Eight Thousand " + Hundreds(hold.substring(1, 4)));
            }
            if (hold.substring(0, 1).equals("9")) {
                return ("Nine Thousand " + Hundreds(hold.substring(1, 4)));
            }
        }
        return null;
    }

    public static String TenThousands(String hold) {
        {
            if (hold.substring(0, 1).equals("0")) {
                return (Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("1")) {
                return ("Ten Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("2")) {
                return ("Twenty Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("3")) {
                return ("Thirty Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("4")) {
                return ("Forty Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("5")) {
                return ("Fifty Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("6")) {
                return ("Sixty Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("7")) {
                return ("Seventy Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("8")) {
                return ("Eight Thousand " + Thousands(hold.substring(1, 5)));
            }
            if (hold.substring(0, 1).equals("9")) {
                return ("Nine Thousand " + Thousands(hold.substring(1, 5)));
            }
        }
        return null;
    }

    public static String HundredThousands(String hold) {
        {
            if (hold.substring(0, 1).equals("0")) {
                return (Thousands(hold.substring(1, 6)));
            }
        }
        if (hold.substring(0, 1).equals("1")) {
            return ("One Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("2")) {
            return ("Two Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("3")) {
            return ("Three Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("4")) {
            return ("Four Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("5")) {
            return ("Five Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("6")) {
            return ("Six Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("7")) {
            return ("Seven Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("8")) {
            return ("Eight Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        if (hold.substring(0, 1).equals("9")) {
            return ("Nine Hundred Thousand " + TenThousands(hold.substring(1, 6)));
        }
        return null;
    }


    public static void main(String[] args) {
        String hold;
        Scanner scan = new Scanner(System.in);
        hold = scan.next();
        int holdint = Integer.parseInt(hold);
        if (hold.length() == 1) {
            System.out.println(Ones(hold));
        }

        if (hold.length() == 2) {
            if (9 < holdint) {
                if (holdint < 20) {
                    System.out.println(Teens(hold));
                } else {
                    System.out.println(Tens(hold));
                }
            }
        }
        if (hold.length() == 3) {
            System.out.println(Hundreds(hold));
        }
        if (hold.length() == 4) {
            System.out.println(Thousands(hold));
        }
        if (hold.length() == 5) {
            System.out.println(TenThousands(hold));
        }
        if (hold.length() == 6) {
            System.out.println(HundredThousands(hold));
            if (hold == "1000000") {
                System.out.println("One Million");
            }

        }
    }
}


