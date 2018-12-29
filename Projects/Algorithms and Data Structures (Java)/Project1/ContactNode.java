/**
 * Created by arcex012 on 7/23/17.
 */
public class ContactNode {
    String name;
    long phone;
    String address;
    String comments;
    ContactNode next;
    Contact  contact;

    public Contact getContact() { //getter Contact
        return contact;
    }

    public ContactNode getNext() { //gets the next contact
        return next;
    }

    public void setNext(ContactNode next) { //sets the next contact
        this.next = next;
    }

    public ContactNode(Contact contact){ //constructor
        this.contact=contact;
        name=contact.getName();
        phone=contact.getPhone();
        address=contact.getAddress();
        comments=contact.getComments();
    }
    public String toString(){ //toString
        String all=" ";
        all+=(name+" "+phone+" "+address+" "+comments);
        return all;
    }

    public String getName() {//name getter
        return name;
    }

    public long getPhone() {//phone number getter
        return phone;
    }

    public String getAddress() {//address getter
        return address;
    }

    public String getComments() {//comments getter
        return comments;
    }

    public void setName(String name) {//name setter
        this.name = name;
    }

    public void setPhone(long phone) {//phone number setter
        this.phone = phone;
    }

    public void setAddress(String address) {//address setter
        this.address = address;
    }

    public void setComments(String comments) {//comment setter
        this.comments = comments;
    }

    public boolean equals(ContactNode other){ //equivalency check
        if(getName().equals(other.getName()) && getPhone()==other.getPhone() && getAddress().equals(other.getAddress()) && getComments().equals(other.getComments())){
            return true;
        }
        else{
            return false;
        }
    }

}
