//Written by mcfad088 and arcex012

public class Random {
	private int p1 = 7919;
	private int p2 = 65537;
	private int m = 102611;
	private int s = 0;
	private int rOld = 0;
	private int rNew;
	private int dp1=0;
	private int dp2=0;

	public Random(int pOne, int pTwo, int eM) {
		p1 = pOne;
		p2 = pTwo;
		m = eM;


	} //random method

	public void setSeed(int seed) {
		s = seed;
		rOld = 0;
	} //setSeed

	public int getMaximum() {
		return m;
	} //getMax

	public int random() {
		if (rOld == 0) {
			rNew = ((p1 * s) + p2) % m;
			rOld = rNew;
			return rNew;
		}//if
		else {
			rNew = ((p1 * rOld) + p2) % m;
			rOld = rNew;
			return rNew;
		} //else
	} //random

	public int randomInteger(int lower, int upper) {
		if (lower > upper) {int x = lower; lower = upper; upper = x;}
		int hold = random();
		boolean attempt = false;
		while (attempt != true) {
			if (hold < lower || hold > upper) {
				hold = random();}
			else {attempt = true;} } //while
		return hold;
		
	} //randomInteger

	public boolean randomBoolean() {
		int TorF = random();
		if ((TorF%2)==0){
			return true;}
		else{
			return false;}
	} //randomBoolean

	public double randomDouble(double lower, double upper) {
		if (lower > upper) {double x = lower; lower = upper; upper = x;}
		double hold = random();
		double hold2 = random();
		boolean attempt = false;
		boolean attempt2 = false;
		while (attempt != true) {
			if (hold < lower || hold > upper) {
				hold = random();}
			else {attempt = true;} } //while
		while (attempt2 != true){
			if (hold2>=99){
				hold2 = random();}
			else {attempt2 = true;}}
		double hold3 = hold2/100;
		double hold4 = hold+hold3;
		return (hold4);
	} //randDouble


	public static void main(String[] args) {
		
		Random TrialOne = new Random(7919,65537,102611);
		Random TrialTwo = new Random(7919,65537,2);
		System.out.println("");
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("The random Boolean value is: "+TrialTwo.randomBoolean());
		System.out.println("");
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomInteger(20,50));
		System.out.println("");
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(20,50));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		System.out.println("The random Integer value is: "+TrialOne.randomDouble(50,20));
		
		System.out.println("The Maximum is: "+TrialOne.getMaximum());


} //main





} //Random
