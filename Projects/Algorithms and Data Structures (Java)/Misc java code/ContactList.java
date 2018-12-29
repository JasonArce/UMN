import java.util.Scanner;
import java.io.PrintWriter;
import java.io.File;
public class ContactList{

	private int ptr= -1;
	private int count;
	private static Contact [] anarray;

	public ContactList(){
		anarray = new Contact[20];}
	public ContactList(int arrayLength){
		anarray = new Contact[arrayLength];}
	public boolean add(Contact c){
		if(count<anarray.length){
			anarray[count]= c;
			count++;
			ptr++;
			return true;}
		else{return false;}
	}
	
	public Contact find(String name){
		int found = 0;
		if(ptr+1>=anarray.length){
			ptr=0;}
	
		for(int i=ptr+1; i<anarray.length; i++){
			if(ptr>=anarray.length){
				ptr=0;}
			if(name.equals(anarray[i].getName())){
				found++;				
				return anarray[i];}
			ptr++;}
		if(found==0){
			return null;}
	return null;}

	public Contact remove(){
		if(ptr+1>=anarray.length){
			ptr=0;}
		anarray[ptr]=null;
		ptr++;
		return null;}

	public boolean write(String fileName){
		try {
			PrintWriter p = new PrintWriter(fileName);
			for (int i = 0; i < anarray.length; i++) {
				p.println(anarray[i].toString());
			}
			p.close();
		}
		catch (Exception e) {
			return false;}
	return true;}

	public boolean read(String fileName){
		try {
			Scanner s = new Scanner(new File(fileName));
			while (s.hasNextLine()){
				String i = s.nextLine();
				System.out.println(i);
			}
			s.close();}
		catch (Exception e) {
		return false;}
	return true;}

	public Contact getCurrent(){
		return anarray[ptr];
	}

	public Contact get(int i){
		if(anarray.length==0 || anarray.length<i){
			return null;
		}
		return anarray[i];
	}

	public Contact next(){
		ptr++;
		if(ptr>=anarray.length){
			ptr=0;}
		if(anarray.length==0 || anarray[ptr]==null){
			return null;
		}
		else{return anarray[ptr];}
	}

	public Contact previous(){
		ptr--;
		if(ptr<0){
			ptr=anarray.length-1;
		}
		if(anarray.length==0 || anarray[ptr]==null){
			return null;
		}
		else{return anarray[ptr];}
	}

	public void sort() {
		Contact[] sortarray = new Contact[anarray.length];
		int check = 0;
		int tries=0;
		int i = 0;
		int j = 1;
		int s = 0;
		while(tries<(anarray.length*anarray.length)) {
			while (j < anarray.length) {
				Character c1 = new Character((anarray[i].getName()).charAt(0));
				Character c2 = new Character((anarray[j].getName()).charAt(0));
				check = c1.compareTo(c2);
				if (check <= 0) {
					sortarray[s] = anarray[i];
					sortarray[s + 1] = anarray[j];
					s++;
				} else {
					sortarray[s] = anarray[j];
					sortarray[s + 1] = anarray[i];
					anarray[j] = anarray[i];
					s++;
				}
				i++;
				j++;
				tries++;
			}
			for (int y = 0; y < sortarray.length; y++) {
				anarray[y] = sortarray[y];
			}
			i = 0;
			j = 1;
			s = 0;

		}
			for (int z = 0; z < sortarray.length; z++) {
				System.out.println(sortarray[z].getName());
			}
			System.out.println(" ");
	}

//	String a="horse";
//		System.out.println(a.charAt(0));
//
//	Character c1 = new Character('a');
//	Character c2 = new Character('c');
//	int res;
//	res = c1.compareTo(c2);
//		System.out.println(res);







	public static void main(String[] args){
		Contact Contact1 = new Contact("Jerry",6122453918L, "7315", "Neat");
		Contact Contact2 = new Contact("Jim", 6122453918L, "7315", "Neat");
		Contact Contact3 = new Contact("Sarah",6122453918L, "7315", "Neat");
		Contact Contact4 = new Contact("Carl", 6122453918L, "7315", "Neat");
		Contact Contact5 = new Contact("Sue", 6122453918L, "7315", "Neat");
		ContactList aContactList = new ContactList(5);
		aContactList.add(Contact1);
		aContactList.add(Contact2);
		aContactList.add(Contact3);
		aContactList.add(Contact4);
		aContactList.add(Contact5);
//			for(int i=0; i<anarray.length; i++){
//				System.out.println(anarray[i].getName());
//			}
//		System.out.println(aContactList.find("Carl"));
//		aContactList.remove();
//		aContactList.remove();
//		aContactList.remove();
//		aContactList.remove();
//		aContactList.remove();
//		for(int i=0; i<anarray.length; i++){
//				if(anarray[i]!=null){
//				System.out.println(anarray[i].getName());}
//			}
//		System.out.println(aContactList.write("MyContacts"));
		System.out.println(aContactList.read("MyContacts"));
//		System.out.println(aContactList.getCurrent());
//		System.out.println(aContactList.get(10));
//		System.out.println(aContactList.next());
//		System.out.println(aContactList.next());
//		System.out.println(aContactList.previous());
//		System.out.println(aContactList.previous());
//		System.out.println(aContactList.previous());
//		System.out.println(aContactList.previous());
//		System.out.println(aContactList.previous());
//		System.out.println(aContactList.previous());
//		aContactList.sort();

	}
}

