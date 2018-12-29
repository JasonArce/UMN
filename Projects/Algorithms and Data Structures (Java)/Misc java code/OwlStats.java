public class OwlStats{
	int agehold=0;
	int weighthold=0;
	int average=0;
	Owl theyoungest=null;
	Owl theheaviest=null;	
	int analysis=0;
	public void analyze(Owl[] owls){
		analysis++;
		int a=owls.length;	
		//int [] names = new int[a];
		int [] weights = new int[a];
		int [] ages = new int[a];
		int counter=0;
		//age comparison
		for (int i=0; i<owls.length; i++){
			ages[i]=owls[i].getAge();
		}
		for (int i = 0; i < ages.length; i++){
			if(i==0){
				agehold=ages[0];
				counter++;
			}
			if(agehold>ages[i]){
				agehold=ages[i];
				counter++;
			}
		}
		for(int i=0; i<owls.length; i++){
			if(agehold==owls[i].getAge()){
				theyoungest=owls[i];
			}
		}	
		//weight comparison
		for (int i=0; i<owls.length; i++){
			weights[i]=owls[i].getWeight();
		}
		for (int i = 0; i < weights.length; i++){
			if(i==0){
				weighthold=weights[0];
			}
			if(weighthold<weights[i]){
				weighthold=weights[i];
			}
		}
		for(int i=0; i<owls.length; i++){
			if(weighthold==owls[i].getWeight()){
				theheaviest=owls[i];
			}
		}
		//age comparison
		int allages=0;
		for (int i = 0; i < ages.length; i++){
			allages=allages+ages[i];
		}
		average=allages/counter;	
	}
	public Owl getYoungest(){
		if (analysis==0){
			return null;}
		else{
			return theyoungest;}
	}	
	public Owl getHeaviest(){
		if (analysis==0){
			return null;}
		else{
			return theheaviest;}
	}		
	public int getAverage(){
		if (analysis==0){
			return 0;}
		else{
			return average;}
	}
	public String toString(){
		return ("The Youngest: "+theyoungest.getName()+" The Heaviest: "+theheaviest.getName()+""+" The Average: "+average);
		}

	public static void main(String[] Args){
		Owl leslie = new Owl("leslie",10,10);
		Owl andy = new Owl("andy",5,11);
		Owl ron = new Owl("ron", 21,21);
		Owl[] dataset = {leslie,andy,ron};
		OwlStats pawneePop = new OwlStats();
		pawneePop.analyze(dataset);
		Owl youngest = pawneePop.getYoungest();
		String actualSummary = pawneePop.toString();
		Owl heaviest = pawneePop.getHeaviest();
		Owl ayoungest = pawneePop.getYoungest();
		System.out.println("Heaviest Test: "+heaviest.equals(ron));
		System.out.println("Youngest Test: "+ayoungest.equals(andy));
		System.out.println("The average age: "+pawneePop.getAverage());
		System.out.println(pawneePop.toString());
	}
}
