public class Pair {
	public static int productDigits(int n){
    		int value = n%10;
		n=n/10;
		System.out.println("hey");
		if(value==0){
			return n;}
		value=value*productDigits(n);
		//return(value);
	}
    public static void main(String[] args) {
        Pair apair = new Pair();
        System.out.println(apair.productDigits(123));
    }
}
