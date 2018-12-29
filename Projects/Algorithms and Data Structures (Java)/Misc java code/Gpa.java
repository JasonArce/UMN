import java.util.Scanner;
public class Gpa {
	public static void main(String[] args){
	double a = 0;
	double b = 0;
	double c = 0;
	Scanner keyboard = new Scanner(System.in);
	String inputString = keyboard.nextLine();
	Scanner scanner = new Scanner(inputString);
	
	while(scanner.hasNext()){
		String grade = scanner.next();
		if (grade.equals("A")) {
            b = scanner.nextInt();
            c = b + c;
            a = a + 4.0 * b;
        }
		if (grade.equals("A-")) {
            System.out.println("dog");
            b = scanner.nextInt();
            c = b + c;
            a = a + 3.667 * b;
        }
		if (grade.equals("B+")){
            b=scanner.nextInt();
            c=b+c;
            a=a+3.333*b;
}
		if (grade.equals("B")){
            b=scanner.nextInt();
            c=b+c;
            a=a+3.0*b;
}
		if (grade.equals("B-")){
            b=scanner.nextInt();
            c=b+c;
            a=a+2.667*b;
}
		if (grade.equals("C+")){
            b=scanner.nextInt();
            c=b+c;
            a=a+2.333*b;
}
		if (grade.equals("C")){
            b=scanner.nextInt();
            c=b+c;
            a=a+2.0*b;
}
		if (grade.equals("C-")){
            b=scanner.nextInt();
            c=b+c;
            a=a+1.667*b;
}
		if (grade.equals("D+")){
            b=scanner.nextInt();
            c=b+c;
            a=a+1.333*b;
}
		if (grade.equals("D")){
            b=scanner.nextInt();
            c=b+c;
            a=a+1.0*b;
}
		if (grade.equals("F")){
            b=scanner.nextInt();
            c=b+c;
            a=a+0*b;
}
}
	System.out.println(a/c);
}
}
