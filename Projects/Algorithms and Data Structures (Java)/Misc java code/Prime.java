//Written by mcfad088 and arcex012

import java.lang.Math;


public class Prime {

	public static boolean isPrime(int number) {
		if (number == 1 || number == 0 || number<0) {return false;}
		for (int i = 2; i < number; i++) {
			if (number%i == 0) {return false;}
		}//forloop
		return true;
	}//isPrime

	public static boolean isMersennePrime(int number) {
	int hold = (int)Math.pow(2,number)-1;
		if (isPrime(hold) == true) {return true;}//if
		return false;
	}//isMersennemethod

	public static int prime(int n) {
		if (n==1){
			return(2);
		}
		if (n<1){
			return(0);
		}
		int place=0;
		int count=0;
		while(count<n){
			if(isPrime(place)==true){
				count++;
				place++;
			}
			else{place++;
			}
		}//whileloop;
		return place-1;
	}//primeMethod

	public static int[] primeArray(int HowMany){
		int[] mylist=new int[HowMany];
		int number=0;
		int tries=2;
		while(number<HowMany){
			if (HowMany < 1) {
				return null;}
			if( isPrime(tries)==true){
				mylist[number] = tries;
				number++;
				tries++;
			}
			else{
				tries++;
			}
		}
		
	return mylist;}//primeArrayMethod


	public static int[] primeFactors(int number) {
		int[] faillist=new int[0];
		if (isPrime(number)==true){
			int[] factor1 = new int[1];
			factor1[0] = number;
			System.out.println("THE NUMBER IN THE NEXT PRINT LINE HAS NO PRIME FACTORS");
			return faillist;}
		if (number<1){
			System.out.println("THE NUMBER IN THE NEXT PRINT LINE HAS NO PRIME FACTORS");
			return faillist;}
		int primenum=2;
		int counter = 0;
		int counter2=0;
		int acounter=0;
		String hold="";
		while(number!=1){
			if(isPrime(primenum)==true){
				if(number%primenum==0){
					hold=hold+""+primenum;
					number=number/primenum;
					counter2++;
					}
				else{primenum++;}}
			else{counter++;
				primenum++;}
			//if(counter>=number){
			//	return null;}
		}//while
		System.out.println(hold);
		int [] anarray= new int[counter2];
		int newhold=Integer.valueOf(hold);
		while (acounter<counter2){
			anarray[acounter]= newhold % 10;
			newhold = newhold/10;
			acounter++;
		}//while
		return anarray;
		


	}//primeFactorsMethod






public static void main(String[] args) {
	System.out.println("");
	System.out.println("Is the number 1 prime? "+isPrime(1));
	System.out.println("Is the number 7 prime? "+isPrime(7));
	System.out.println("Is the number 9 prime? "+isPrime(9));
	System.out.println("Is the number -7 prime? "+isPrime(-7));
	System.out.println("Is the number 571 prime? "+isPrime(571));
	System.out.println("Is the number 0 prime? "+isPrime(0));
	System.out.println("Is the number 6961 prime? "+isPrime(6961));
	System.out.println("Is the number 712 prime? "+isPrime(712));
	System.out.println("Is the number 9,994,827 prime? "+isPrime(9994827));
	System.out.println("Is the number 5039 prime? "+isPrime(5039));
	System.out.println("");
	System.out.println("Is the number 8 a Mersenne prime? "+isMersennePrime(8));
	System.out.println("Is the number 5 a Mersenne prime? "+isMersennePrime(5));
	System.out.println("Is the number 22 a Mersenne prime? "+isMersennePrime(22));
	System.out.println("Is the number 2 a Mersenne prime? "+isMersennePrime(2));
	System.out.println("Is the number 7 a Mersenne prime? "+isMersennePrime(7));
	System.out.println("Is the number 1 a Mersenne prime? "+isMersennePrime(1));
	System.out.println("Is the number 0 a Mersenne prime? "+isMersennePrime(0));
	System.out.println("Is the number -3 a Mersenne prime? "+isMersennePrime(-3));
	System.out.println("Is the number 19 a Mersenne prime? "+isMersennePrime(19));
	System.out.println("Is the number 11 a Mersenne prime? "+isMersennePrime(11));
	System.out.println("");
	System.out.println("What is the 5th prime number? "+prime(5));
	System.out.println("What is the 43rd prime number? "+prime(43));
	System.out.println("What is the 77th prime number? "+prime(77));
	System.out.println("What is the 10,000th prime number? "+prime(10000));
	System.out.println("What is the 2nd prime number? "+prime(2));
	System.out.println("What is the 0th prime number? "+prime(0));
	System.out.println("What is the -7th prime number? "+prime(-7));
	System.out.println("What is the 500th prime number? "+prime(500));
	System.out.println("What is the 12th prime number? "+prime(12));
	System.out.println("What is the 1st prime number? "+prime(1));
	System.out.println("");
	int[] aTrial1 = primeArray(3);
	System.out.print("The first 3 prime numbers are: ");
	for (int i = 0; i < aTrial1.length; i++) {System.out.print(aTrial1[i] + " ");}
	System.out.println("");
	int[] aTrial2 = primeArray(7);
	System.out.print("The first 7 prime numbers are: ");
	for (int i = 0; i < aTrial2.length; i++) {System.out.print(aTrial2[i] + " ");}
	System.out.println("");
	int[] aTrial3 = primeArray(1);
	System.out.print("The first 1 prime numbers are: ");
	for (int i = 0; i < aTrial3.length; i++) {System.out.print(aTrial3[i] + " ");}
	System.out.println("");
	int[] aTrial4 = primeArray(0);
	System.out.print("The first 0 prime numbers are: ");
	for (int i = 0; i < aTrial4.length; i++) {System.out.print(aTrial4[i] + " ");}
	System.out.println("");
	int[] aTrial5 = primeArray(10);
	System.out.print("The first 10 prime numbers are: ");
	for (int i = 0; i < aTrial5.length; i++) {System.out.print(aTrial5[i] + " ");}
	System.out.println("");
	int[] aTrial6 = primeArray(20);
	System.out.print("The first 20 prime numbers are: ");
	for (int i = 0; i < aTrial6.length; i++) {System.out.print(aTrial6[i] + " ");}
	System.out.println("");
	int[] aTrial7 = primeArray(15);
	System.out.print("The first 15 prime numbers are: ");
	for (int i = 0; i < aTrial7.length; i++) {System.out.print(aTrial7[i] + " ");}
	System.out.println("");
	int[] aTrial8 = primeArray(25);
	System.out.print("The first 25 prime numbers are: ");
	for (int i = 0; i < aTrial8.length; i++) {System.out.print(aTrial8[i] + " ");}
	System.out.println("");
	int[] aTrial9 = primeArray(30);
	System.out.print("The first 30 prime numbers are: ");
	for (int i = 0; i < aTrial9.length; i++) {System.out.print(aTrial9[i] + " ");}
	System.out.println("");
	int[] aTrial10 = primeArray(50);
	System.out.print("The first 50 prime numbers are: ");
	for (int i = 0; i < aTrial10.length; i++) {System.out.print(aTrial10[i] + " ");}
	System.out.println("");
	System.out.println("");
//	int[]fTrial1=primeFactors(630);
//	System.out.print("The prime factors of 630 are: ");
//	for (int i = 0; i < fTrial1.length; i++) {System.out.print(fTrial1[i]+" ");}
//	System.out.println("");
//	int[]fTrial2=primeFactors(12);
//	System.out.print("The prime factors of 12 are: ");
//	for (int i = 0; i < fTrial2.length; i++) {System.out.print(fTrial2[i]+" ");}
//	System.out.println("");
//	int[]fTrial3=primeFactors(41);
//	System.out.print("The prime factors of 41 are: ");
//	for (int i = 0; i < fTrial3.length; i++) {System.out.print(fTrial3[i]+" ");}
//	System.out.println("");
	int[]fTrial4=primeFactors(77);
	System.out.print("The prime factors of 77 are: ");
	for (int i = 0; i < fTrial4.length; i++) {System.out.print(fTrial4[i]+" ");}
	System.out.println("");
//	int[]fTrial5=primeFactors(100);
//	System.out.print("The prime factors of 100 are: ");
//	for (int i = 0; i < fTrial5.length; i++) {System.out.print(fTrial5[i]+" ");}
//	System.out.println("");
//	int[]fTrial6=primeFactors(258);
//	System.out.print("The prime factors of 258 are: ");
//	for (int i = 0; i < fTrial6.length; i++) {System.out.print(fTrial6[i]+" ");}
//	System.out.println("");
//	int[]fTrial7=primeFactors(2);
//	System.out.print("The prime factors of 2 are: ");
//	for (int i = 0; i < fTrial7.length; i++) {System.out.print(fTrial7[i]+" ");}
//	System.out.println("");
//	int[]fTrial8=primeFactors(0);
//	System.out.print("The prime factors of 0 are: ");
//	for (int i = 0; i < fTrial8.length; i++) {System.out.print(fTrial8[i]+" ");}
//	System.out.println("");
//	int[]fTrial9=primeFactors(506);
//	System.out.print("The prime factors of 506 are: ");
//	for (int i = 0; i < fTrial9.length; i++) {System.out.print(fTrial9[i]+" ");}
//	System.out.println("");
//	int[]fTrial10=primeFactors(1046);
//	System.out.print("The prime factors of 1046 are: ");
//	for (int i = 0; i < fTrial10.length; i++) {System.out.print(fTrial10[i]+" ");}
//	System.out.println("");
}//main
	

} //primeclass
