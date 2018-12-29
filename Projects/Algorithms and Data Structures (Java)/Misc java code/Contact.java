public class Contact{
	private String name;
	private long phone;
	private String address;
	private String comments;

	public Contact(String aName, long aPhone, String anAddress, String aComment){
		name = aName;
		phone = aPhone;
		address = anAddress;
		comments = aComment;
	}
		
	public String getName(){
		return name;}

	public void setName(String newName){
		name = newName;}

	public long getPhone(){
		return phone;}

	public void setPhone(long newPhone){
		 phone=newPhone;}

	public String getAddress(){
		return address;}

	public void setAddress(String newAddress){
		address=newAddress;}

	public String getComments(){
		return comments;}

	public void setComments(String newComments){
		comments=newComments;}

	public String toString(){
		String aString="";
		aString+= "Name: "+getName()+"    Phone: "+getPhone()+"    Address: "+getAddress()+"     Comments: "+getComments();
		return(aString);
		}

	public boolean equals(Contact other){
		if(name.equals(other.getName()) && phone==other.getPhone() && address.equals(other.getAddress()) && comments.equals(other.getComments())){
			return (true);}
		else{
			return (false);}
	}

	public static void main(String[] args){
		Contact aContact = new Contact("Jerry",6122453918L, "7315", "Neat");
		Contact otherContact = new Contact("Jerry", 6122453918L, "7315", "Neat");
		System.out.println(aContact.equals(otherContact));
}
}
		
