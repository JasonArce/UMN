public class Owl{
	private String name="Jason";
	private int age=19;
	private int weight=140;
	public Owl(String newName, int newAge, int newWeight){
		name=newName;
		age=newAge;
		weight=newWeight;
	}
	public String getName(){
		return name;}
	public int getAge(){
		return age;}
	public int getWeight(){
		return weight;}
	public boolean equals(Owl other){
		if (name.equals(other.getName()) && age==other.getAge() && weight==other.getWeight()){
			return true;}
		else{return false;}
	}
	public static void main(String[] args){
		Owl me = new Owl("Jason",19,140);
		Owl you = new Owl("Jason", 19,140);
		System.out.println(me.equals(you));
	}
		

}
