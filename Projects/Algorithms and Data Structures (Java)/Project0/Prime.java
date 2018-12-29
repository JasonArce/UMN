/**
 * Created by arcex012 on 6/24/17.
 */
public class Prime {
    public static boolean isPrime(int number) { //Verifies if input is prime.
        if (number == 1 || number == 0 || number < 0) { //Checks failure conditions.
            return false;
        }
        for (int i = 2; i < number; i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static boolean isMersennePrime(int number) { //Verifies if input is a Mersenne Prime.
        double value = 0;
        if (isPrime(number) == false) {
            return false;
        }
        for (int i = 2; i < number; i++) {
            if (isPrime(i) == true) {
                value = ((Math.pow(2, number)) - 1); //Mersenne Prime formula
            }
            if (isPrime((int) value)) {
                return true;
            }
        }
        return false;
    }

    public static int prime(int n) { //Gets the nth prime number.
        if (n < 1) { //Checks failure condiitons.
            return -1;
        }
        int count = 0;
        int i = 0;
        boolean done = false;
        while (done == false) {
            for (i = 0; count < n; i++) {
                if (isPrime(i) == true) {
                    count++;
                }
            }
            done = true;
        }
        return i - 1;
    }

    public static int[] primeArray(int howMany) { //Returns the first n prime numbers.
        if (howMany < 1) { //Checks for failures.
            return null;
        }
        int[] anArray = new int[howMany];
        int count = 0;
        for (int i = 1; count < howMany; i++) {
            anArray[count] = prime(i);
            count++;

        }
        return anArray;
    }
    public static int[] primeFactors(int number){ //Gets the prime factors of input.
        if(number<1){ //Checks for failures
            return null;
        }
        boolean done=false;
        int count=1;
        int[] anArray = new int[number/2]; //The array is set to a value, number/2, as there does not exist a value larger than 1, that has more prime factors than number/2.
        int placeHolder = 0;
        while(done==false){
            if(number%prime(count)==0){
                anArray[placeHolder]=prime(count);
                number=number/prime(count);
                placeHolder++;
            }
            else{
                count++;
            }
            if(number==1 || number<count){
                done=true;
            }
        }
        return anArray;
    }

    public static void main(String[] args) {
        Prime aPrime = new Prime();
        int[] hold;
        System.out.println("Is 3 a prime number? "+aPrime.isPrime(3));
        System.out.println("Is 8191 a prime number? "+aPrime.isPrime(8191));
        System.out.println("Is 57 a prime number? "+aPrime.isPrime(57));
        System.out.println("Is 1083 a prime number? "+aPrime.isPrime(1083));
        System.out.println("Is 66 a prime number? "+aPrime.isPrime(66));
        System.out.println("Is 1 a prime number? "+aPrime.isPrime(1));
        System.out.println("Is 0 a prime number? "+aPrime.isPrime(0));
        System.out.println("Is -48 a prime number? "+aPrime.isPrime(-48));
        System.out.println("Is -3 a prime number? "+aPrime.isPrime(-3));
        System.out.println("Is 10000001 a prime number? "+aPrime.isPrime(10000001));
        System.out.println("Is 2 a mersenne prime number? "+aPrime.isMersennePrime(2));
        System.out.println("Is 5 a mersenne prime number? "+aPrime.isMersennePrime(5));
        System.out.println("Is 31 a mersenne prime number? "+aPrime.isMersennePrime(31));
        System.out.println("Is 23 a mersenne prime number? "+aPrime.isMersennePrime(23));
        System.out.println("Is 607 a mersenne prime number? "+aPrime.isMersennePrime(607));
        System.out.println("Is 1083 a mersenne prime number? "+aPrime.isMersennePrime(1083));
        System.out.println("Is 0 a mersenne prime number? "+aPrime.isMersennePrime(0));
        System.out.println("Is -3 a mersenne prime number? "+aPrime.isMersennePrime(-3));
        System.out.println("Is -11 a mersenne prime number? "+aPrime.isMersennePrime(-11));
        System.out.println("Is 2203 a mersenne prime number? "+aPrime.isMersennePrime(2203));
        System.out.println("What is the 1st prime number? "+aPrime.prime(1));
        System.out.println("What is the 2nd prime number? "+aPrime.prime(2));
        System.out.println("What is the 11th prime number? "+aPrime.prime(11));
        System.out.println("What is the 20th prime number? "+aPrime.prime(20));
        System.out.println("What is the -4th prime number? "+aPrime.prime(-4));
        System.out.println("What is the 50th prime number? "+aPrime.prime(50));
        System.out.println("What is the 100th prime number? "+aPrime.prime(100));
        System.out.println("What is the 150th prime number? "+aPrime.prime(150));
        System.out.println("What is the 500th prime number? "+aPrime.prime(500));
        System.out.println("What is the 10000th prime number? "+aPrime.prime(10000));
        hold = aPrime.primeArray(3);
        System.out.println("What is the first 3 prime numbers?");
        for (int i = 0; i < hold.length; i++) {
            System.out.print(hold[i]+" ");
        }
        System.out.println(" ");
        hold = aPrime.primeArray(10);
        System.out.println("What is the first 10 prime numbers?");
        for (int i = 0; i < hold.length; i++) {
            System.out.print(hold[i]+" ");
        }
        System.out.println(" ");
        hold = aPrime.primeArray(20);
        System.out.println("What is the first 20 prime numbers?");
        for (int i = 0; i < hold.length; i++) {
            System.out.print(hold[i]+" ");
        }
        System.out.println(" ");
        hold = aPrime.primeArray(50);
        System.out.println("What is the first 50 prime numbers?");
        for (int i = 0; i < hold.length; i++) {
            System.out.print(hold[i]+" ");
        }
        System.out.println(" ");
        hold = aPrime.primeArray(100);
        System.out.println("What is the first 100 prime numbers?");
        for (int i = 0; i < hold.length; i++) {
            System.out.print(hold[i]+" ");
        }
        System.out.println(" ");
        hold = aPrime.primeArray(1);
        System.out.println("What is the first prime number?");
        for (int i = 0; i < hold.length; i++) {
            System.out.print(hold[i]+" ");
        }
        System.out.println(" ");
        hold = aPrime.primeArray(0);
        System.out.println("What is the first 0 prime numbers?");
        System.out.println(hold);
        hold = aPrime.primeArray(-3);
        System.out.println("What is the first -3 prime numbers?");
        System.out.println(hold);
        System.out.println("What are the prime factors of 17?");
        hold = aPrime.primeFactors(17);
        for(int i =0; i<hold.length; i++) {
            if (hold[i] != 0) {
                System.out.print(hold[i] + " ");
            }
        }
        System.out.println(" ");
        System.out.println("What are the prime factors of 8?");
        hold = aPrime.primeFactors(8);
        for(int i =0; i<hold.length; i++) {
            if (hold[i] != 0) {
                System.out.print(hold[i] + " ");
            }
        }
        System.out.println(" ");
        System.out.println("What are the prime factors of 2?");
        hold = aPrime.primeFactors(2);
        for(int i =0; i<hold.length; i++) {
            if (hold[i] != 0) {
                System.out.print(hold[i] + " ");
            }
        }
        System.out.println(" ");
        System.out.println("What are the prime factors of 26?");
        hold = aPrime.primeFactors(26);
        for(int i =0; i<hold.length; i++) {
            if (hold[i] != 0) {
                System.out.print(hold[i] + " ");
            }
        }
        System.out.println(" ");
        System.out.println("What are the prime factors of 100?");
        hold = aPrime.primeFactors(100);
        for(int i =0; i<hold.length; i++) {
            if (hold[i] != 0) {
                System.out.print(hold[i] + " ");
            }
        }
        System.out.println(" ");
        System.out.println("What are the prime factors of 1024?");
        hold = aPrime.primeFactors(1024);
        for(int i =0; i<hold.length; i++) {
            if (hold[i] != 0) {
                System.out.print(hold[i] + " ");
            }
        }
        System.out.println(" ");
        System.out.println("What are the prime factors of -46?");
        hold = aPrime.primeFactors(-46);
        System.out.println(hold);
        System.out.println("What are the prime factors of 0?");
        hold = aPrime.primeFactors(0);
        System.out.println(hold);
        System.out.println("What are the prime factors of 3?");
        hold = aPrime.primeFactors(3);
        for(int i =0; i<hold.length; i++) {
            if (hold[i] != 0) {
                System.out.print(hold[i] + " ");
            }
        }
    }
}
