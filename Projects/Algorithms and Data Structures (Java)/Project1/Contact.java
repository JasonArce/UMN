/**
 * Created by jasonarce on 7/23/17.
 */
public class Contact {
    String name;
    long phone;
    String address;
    String comments;
    public Contact(String n, long p, String a, String c){
        name=n;
        phone=p;
        address=a;
        comments=c;
    }
    public String toString(){
        String all=" ";
        all+=(name+" "+phone+" "+address+" "+comments);
        return all;
    }

    public String getName() {
        return name;
    }

    public long getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getComments() {
        return comments;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public boolean equals(Contact other){
        if(getName().equals(other.getName()) && getPhone()==other.getPhone() && getAddress().equals(other.getAddress()) && getComments().equals(other.getComments())){
            return true;
        }
        else{
            return false;
        }
    }

}
