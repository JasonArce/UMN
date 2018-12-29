/**
 * Created by arcex012 on 6/22/17.
 */
public class Random {
    private int prime1 = 7919;
    private int prime2 = 65537;
    private int modular=102611;
    private int theSeed;
    public Random(int p1, int p2, int m){ //Constructor
        prime1=p1;
        prime2=p2;
        modular=m;
        theSeed=0;
    }
    public void setSeed(int seed){ //This is manually update the seed as opposed to the automatic change when random is called.
        theSeed=seed;
    } //setter
    public int getMaximum(){ //This gets we are modding by
        return modular;
    } //getter
    public int random(){
        int total=0;
        total=((prime1*theSeed)+prime2)%modular;
        theSeed=total;
        return total;
    }
    public int randomInteger(int lower, int upper){
        int hold=0;
        boolean done=false;
        if(lower<0 || upper<0){
            System.out.println("The following value cannot be negative with the given seed or prime values. -1 is returned.");
            return -1; //If statements checks failure conditions. -1 is the failure to be within the range of possible values
        }
        if(lower>upper){ //should swap values if upper value is actually smaller than the lower value
            hold=upper;
            upper=lower;
            lower=hold;
        }
        int temp=0;
        while(done==false){
            temp=random();
            if(temp>=lower && temp<=upper){
                done=true;
            }
        }
        return temp;
    }
    public boolean randomBoolean(){ //Randomly returns true or false. Even is true, odd is false.
        int result = random();
        if(result%2==0){
            return true;
        }
        else{
            return false;
        }
    }
    public double randomDouble(double lower, double upper){ //Randomly returns a decimal value between two values.
        double hold=0;
        boolean done = false;
        double temp=0;
        if(lower<0 || upper<0){
            System.out.println("The following value cannot be negative with the given seed or prime values. -1.0 is returned.");
            return -1; //If statement checks failure conditions. -1 is the failure to be within the range of possible values
        }
        if(lower>upper){ //Will swap similar to the randomInteger method.
            hold=upper;
            upper=lower;
            lower=hold;
        }
        while(done==false){
            temp=((double)random())/(5.48539720);
            if(temp>=lower && temp<=upper){
                done=true;
            }
        }
        return temp;
    }

    public static void main(String[] args) {
        Random randy = new Random(7919,65537,102611);
        System.out.println("A random whole number between 0 and 50 is: "+randy.randomInteger(0,50));
        System.out.println("A random whole number between 0 and 50 is: "+randy.randomInteger(0,50));
        System.out.println("A random whole number between 0 and 50 is: "+randy.randomInteger(50,0));
        System.out.println("A random whole number between 0 and 50 is: "+randy.randomInteger(50,0));
        System.out.println("A random whole number between -10 and -1 is: "+randy.randomInteger(-1,-10));
        System.out.println("A random whole number between -10 and -1 is: "+randy.randomInteger(-10,-1));
        System.out.println("A random boolean value is: "+randy.randomBoolean());
        System.out.println("A random boolean value is: "+randy.randomBoolean());
        System.out.println("A random boolean value is: "+randy.randomBoolean());
        System.out.println("A random boolean value is: "+randy.randomBoolean());
        System.out.println("A random boolean value is: "+randy.randomBoolean());
        System.out.println("A random boolean value is: "+randy.randomBoolean());
        System.out.println("A random decimal number between 0 and 50 is: "+randy.randomDouble(0,50));
        System.out.println("A random decimal number between 0 and 50 is: "+randy.randomDouble(0,50));
        System.out.println("A random decimal number between 0 and 50 is: "+randy.randomDouble(0,50));
        System.out.println("A random decimal number between 0 and 50 is: "+randy.randomDouble(50,0));
        System.out.println("A random decimal number between 0 and 50 is: "+randy.randomDouble(50,0));
        System.out.println("A random decimal number between 0 and 1 is: "+randy.randomDouble(0,1));
        System.out.println("A random decimal number between 0 and 1 is: "+randy.randomDouble(0,1));
        System.out.println("A random decimal number between 0 and 1 is: "+randy.randomDouble(0,1));
        System.out.println("A random decimal number between 0 and 1 is: "+randy.randomDouble(0,1));
        System.out.println("A random decimal number between -10 and -1 is: "+randy.randomDouble(-1,-10));
        System.out.println("A random decimal number between -10 and -1 is: "+randy.randomDouble(-10,-1));
    }
}
