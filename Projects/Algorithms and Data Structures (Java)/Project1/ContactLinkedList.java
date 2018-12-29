/**
 * Created by arcex012 on 7/23/17.
 */
import java.util.Scanner;
import java.io.PrintWriter;
import java.io.File;

public class ContactLinkedList {
    private int length;
    private ContactNode ptr;
    private int maxLength;
    private ContactNode root;

    public ContactLinkedList(){ //Default Constructor
         maxLength=20;
         this.root=null;
    }

    public ContactLinkedList(int customLength){//Constructor with parameteres
        maxLength=customLength;
    }

    public boolean add(Contact c){ //Add a Contact to the linked list
        ContactNode newContact = new ContactNode(c);
        ContactNode pointer = root;
        while(pointer!=null && pointer.getNext() != null){ //Iterating through the linked list
            pointer = pointer.getNext();
        }
        if(length>=maxLength){ //See if list is full
            return false;
        }
        else{
            length++; //Essentially a counter that holds how many places are in the list
        }
        if(pointer != null){ //Set the next Contact if the list isn't empty
            pointer.setNext(newContact);
            ptr=pointer.getNext();
        }
        else { //Assign the Contact to the root of the linked list.
            root = newContact;
            ptr = root;
        }
        return true;
    }

    public Contact find(String name){ //Finds the name in the list
        ContactNode pointer;
        if(ptr.getNext()==null){ //if the next value in the list is null, ptr is wrapped around to the root as instructed
            pointer=ptr;
            pointer=root;
        }
        else { //the pointer is set to the next value in the list, as instructed
            pointer= ptr.getNext();
        }
        if(root==null){ //Checks to see if list is empty
            System.out.println("Nothing to find!");
            return null;
        }
        while(pointer!=null){ //checks to see if the current pointer is null
            if(pointer.getName().contains(name)==true){ //checks for a match
                ptr=pointer;
                return pointer.getContact();
            }
            if(pointer.getNext()==null){ //wraps the pointer around the list
                pointer=root;
                if(pointer.getName().contains(name)==true){ //checks for a match
                    ptr=pointer;
                    return pointer.getContact();
                }
            }
            if(pointer.getNext()!=null) { //iterates pointer
                pointer = pointer.getNext();
            }
            if((pointer.getContact()).equals(ptr.getContact())){ //checks for a match
                return null;
            }
        }
        return null;
    }

    public Contact remove(){ //removes and returns the current contact
        ContactNode previous = root;
        ContactNode pointer = root;
        if(root==null){ //checks for a null list
            System.out.println("Nothing to remove!");
            return null;
        }
        length--; //decrements the counter of how many contacts are in the list
        if(root.equals(ptr) && ptr.getNext()==null){ //list is null and is set to be empty
            root=null;
            ptr=previous;
            return pointer.getContact();
        }
        if(root.equals(ptr)){ //if this is the first contact in the list
            root=pointer.getNext();
            ptr=previous;
            return previous.getContact();
        }
        while(pointer!=null&&pointer.getNext()!=null){ //iterates through list
            if((pointer.getNext()).equals(ptr)){ //this essentially cuts out the point needed, then stiches the list back together
                previous=pointer; //previous is the trailer
                pointer=pointer.getNext();
                previous.setNext(pointer.getNext());
                ptr=previous;
                return pointer.getContact();
            }
            pointer=pointer.getNext();
        }
        if(pointer.getNext()==null){ //if the next thing in the list is null then simply delete the last contact
            while(!previous.equals(pointer)){
                previous=previous.getNext();
            }
            ContactNode temp = pointer;
            pointer=null;
            ptr=previous;
            return temp.getContact();
        }
        return null;
    }

    public boolean write(String fileName) { //writes the list into another file
        if(root==null){ //if the list is empty
            System.out.println("This is only create a text file of '[ ]' ");
        }
        PrintWriter p = null;
        try {
            p = new PrintWriter(new File(fileName));
        } catch (Exception e) {
            return false;
        } //try catch block
        p.println(toString());
        p.close();
        return true;
    }

    public boolean read(String fileName){ //reads in the individual contact information and adds the contacts into a linked list.
        Scanner s = null;
        try{
            s=new Scanner(new File(fileName));
        } catch(Exception e){
            return false;
        }
        try {
            while (s.hasNextLine()) {
                String hold = s.nextLine();
                String[] arr = hold.split(" ");
                String name = arr[1];
                Long number = Long.parseLong(arr[2]);
                String address = arr[3];
                String comments = arr[4];
                Contact person = new Contact(name, number, address, comments);
                add(person);
            }
            return true;
        }
        catch(Exception e){ //try-catch catches improper syntax
            System.out.println("Next time, try to enter in the contact information as: Jack 6122223333 Airport Neat ");
            return false;
        }
    }

    public Contact getCurrent(){ //returns current contact
        if(root==null){ //checks for an empty list
            return null;
        }
        if(ptr!=null){
            return ptr.getContact();
        }
        return null;
    }

    public Contact get(int i){ //The method reads 1 as the first index in the list instead of 0
        if(i>maxLength || i<1){ //checks for values in range for list
            System.out.println("Index out of range");
            return null;
        }
        if(root==null){//checks for null list
            return null;
        }
        int count = 1;
        ContactNode pointer = root;
        while(pointer!=null && pointer.getNext()!=null){//iterates through the linked list
            pointer=pointer.getNext();
            count++;
            if(count==i){
                ptr=pointer;
                return pointer.getContact();
            }
        }
        return null;
    }

    public Contact next(){ //gets the next contact in the list
        if(root==null){ //checks for null list
            return null;
        }
        if(ptr!=null && ptr.getNext()!=null){ //checks if the contact is not the last in the list
            ptr=ptr.getNext();
            return ptr.getContact();
        }
        else{
            if(ptr!=null){// checks for the contact for being the last in the list
                ptr=root;
                if(root!=null){
                    return ptr.getContact();
                }
                else{ //checks for any remainder failure conditions
                    return null;
                }
            }
        }
        return null;
    }

    public Contact previous(){ //returns the previous contact in the list
        ContactNode pointer = root;
        if(root==null){ //checks for a null list
            return null;
        }
        if(pointer.equals(ptr)){//checks if the index is the first in the list so it iterates to the end which simiulates wrapping around
            while(pointer!=null && pointer.getNext()!=null) {
                pointer=pointer.getNext();
            }
            ptr=pointer;
            return pointer.getContact();
        }
        while(pointer!=null && pointer.getNext()!=null){ //iterates to the spot in the list right before the current index
            if(pointer.getNext().equals(ptr)){
                ptr=pointer;
                return pointer.getContact();
            }
            pointer=pointer.getNext();
        }
        return null;
    }

    public void sort() {//sorts list alphabetically
        ContactNode current = root;
        if(root==null){ //if the list is empty, don't do anything
        }
        else {
            boolean done = false;
            while (done == false) {
                current = root; //reset conditions
                done = true;
                    while (current != null && current.getNext() != null) {
                        if (current.getName().compareTo(current.getNext().getName()) > 0) { //using add and remove to sort the list
                            find(current.getName());
                            Contact hold = remove();
                            add(hold);
                            done = false;
                        }
                        current = current.getNext();

                    }
                }
        }
    }

    public String toString() { //prints the list of the string
        ContactNode pointer= root;
        String hold = "[ ";
        while (pointer!=null && pointer.getNext() != null) { //makes the list
            hold += pointer.getName() + " , ";
            pointer = pointer.getNext();
        }
        if(pointer==null){
            hold+=" ]"; //makes the display look nicer
        }
        else {
            hold += pointer.getName() + " ]"; //makes the display look nicer
        }
        return hold;
    }

    public static void main(String[] args) {
        ContactLinkedList aList = new ContactLinkedList(4); //initialization of ContactLinkedList
        ContactLinkedList newList = new ContactLinkedList((3));
        Contact Jason = new Contact("Jason",6122453918L,"7315 Columbus","Me"); //initialization of contacts
        Contact Alex = new Contact("Alex",6127491827L,"Somewhere","Who?");
        Contact Xavier = new Contact("Xavier",6123334444L,"There","Professor");
        Contact Seth = new Contact("Seth",9999991299L,"Nowhere",":(");

        System.out.println("Adding Jason to list: "+aList.add(Jason)); //test cases
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println("Adding Alex to list: "+aList.add(Alex));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println("Adding Xavier to list: "+aList.add(Xavier));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println(aList.toString());
        System.out.println("Adding Seth to list: "+aList.add(Seth));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println(aList.toString());
        System.out.println("Return Jason's contact in the list: "+aList.find("Jason"));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println("Remove current"+aList.remove());
        System.out.println("The new list: "+aList.toString());
        System.out.println("Return Xavier's contact in the list: "+aList.find("Xav"));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println("Return Seth's contact in the list: "+aList.find("Seth"));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println("Remove current: "+aList.remove());
        System.out.println("The new list: "+aList.toString());
        System.out.println("Adding Jason to list: "+aList.add(Jason));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println("Adding Xavier to list: "+aList.add(Xavier));
        System.out.println("The pointer is pointing to: "+aList.getCurrent().getName());
        System.out.println(aList.toString());
        System.out.println("Copying list to given file name..."+aList.write("Copy"));
        System.out.println("Reading list from given file name to newList..."+newList.read("ReadFrom"));
        System.out.println(newList.toString());
        System.out.println("The current contact is: "+newList.getCurrent());
        System.out.println("Find the 2nd person in the list: "+newList.get(2));
        System.out.println("Get the next Contact: "+newList.next());
        System.out.println("The current contact is now: "+newList.getCurrent());
        System.out.println("Get the next Contact: "+newList.next());
        System.out.println("The current contact is now: "+newList.getCurrent());
        System.out.println("The previous contact is: "+newList.previous());
        System.out.println("The current contact is now: "+newList.getCurrent());
        System.out.println("The previous contact is: "+newList.previous());
        System.out.println("The current contact is now: "+newList.getCurrent());
        System.out.println("The current list: "+newList.toString());
        newList.sort();
        System.out.println("Sorted: "+ newList.toString());
        aList.sort();
        System.out.println("Sorted: "+aList.toString());
        System.out.println("We removed: "+aList.remove());
        System.out.println(aList.toString());
        System.out.println("We removed: "+aList.remove());
        System.out.println(aList.toString());
        System.out.println("We removed: "+aList.remove());
        System.out.println(aList.toString());
        System.out.println("We removed: "+aList.remove());
        System.out.println(aList.toString());
        System.out.println("We removed: "+aList.remove());
        System.out.println(aList.toString());
        System.out.println(aList.write("Copy2"));
        System.out.println(aList.read("Copy2"));
        System.out.println(aList.getCurrent());
        System.out.println(aList.get(1));
        System.out.println(aList.next());
        System.out.println(aList.previous());
        System.out.println("Sorting an empty list");
        aList.sort();
        System.out.println(aList.toString());
        System.out.println("Adding Seth, Jason, Savier, and Alex");
        aList.add(Seth);
        aList.add(Jason);
        aList.add(Xavier);
        aList.add(Alex);
        aList.sort();
        System.out.println(aList.toString());

    }

}
