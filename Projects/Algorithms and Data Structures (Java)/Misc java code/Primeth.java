public class Primeth {

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

    public static void main(String[] args){
    System.out.println(prime(10000));
    }
}
