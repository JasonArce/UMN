/**
 * Created by arcex012 on 7/5/17.
 */
import java.util.Scanner;
import java.io.PrintWriter;
import java.io.File;
public class ContactList {
    int ptr=-1;
    Contact[] anArray;
    public ContactList(){ //default constructor
        anArray = new Contact[20];
    }
    public ContactList(int length){ //custom constructor
        anArray = new Contact[length];
    }
    public boolean add(Contact c){ //adds contacts to the next open spot in the list
        if(ptr==(anArray.length-1)){
            return false;
        }
        else{
            ptr++;
            anArray[ptr]=c;
            return true;
        }
    }

    public int getPtr() {
        return ptr;
    }

    public Contact find(String name) {//determines if a name is in the array of contacts
        int ptr2;
        if(ptr<anArray.length-1){
            ptr2=ptr+1;
        }
        else{
            ptr2=0;
        }
        boolean done = false;
        while (done == false) {
            if(anArray[ptr2]==null && ptr2+1<anArray.length){
                ptr2++;
            }
            if(anArray[ptr2]==null && ptr2+1>=anArray.length){
                ptr2=0;
            }
            if ((anArray[ptr2].getName()).contains(name)) {
                return anArray[ptr2];
            }
            else {
                if (ptr2 < anArray.length) {
                    ptr2++;
                } else {
                    ptr2 = 0;
                }
            }
            if (ptr2 == ptr+1) {
                done = true;
            }
        }
        return null;
    }
    public Contact remove(){//removes the current contact and shifts the others over
        anArray[ptr]=null;
        Contact hold = anArray[ptr];
        for(int i=ptr;i+1<anArray.length;i++){
            anArray[i]=anArray[i+1];
        }
        ptr--;
        return hold;
    }

    public boolean write(String fileName) { //writes the contacts in an array to an external file
        PrintWriter p = null;
        try {
            p = new PrintWriter(new File(fileName));
        } catch (Exception e) {
            return false;
        }
        for(int i=0;i<anArray.length; i++) {
            if (anArray[i] != null) {
                p.println(anArray[i].toString());
            }
        }
        p.close();
        return true;
    }

    public boolean read(String fileName){ //reads in a file with individual contact information and adds complete contacts to the array
        Scanner s = null;
        try{
            s=new Scanner(new File(fileName));
        } catch(Exception e){
            return false;
        }
        while(s.hasNextLine()){
            String hold=s.nextLine();
            String[] arr = hold.split(" ");
            String name=arr[1];
            Long number = Long.parseLong(arr[2]);
            String address=arr[3];
            String comments=arr[4];
            Contact person = new Contact(name,number,address,comments);
            add(person);
        }
        return true;
    }
    public Contact getCurrent(){ //gets the current contact
        return anArray[ptr];
    }
    public Contact get(int i){ //gets the contact at index i
        if(i<anArray.length) {
            return anArray[i];
        }
        return null;
    }
    public Contact next(){//gets the next contact
        boolean done =false;
        int initialPTR = ptr;
        while(done==false) {
            if (ptr + 1 < anArray.length) {
                ptr++;
            }
            else {
                ptr = 0;
            }
            if(anArray[ptr]!=null){
                done=true;
            }
            if(ptr==initialPTR){
                return null;
            }
        }
        return anArray[ptr];
    }
    public Contact previous(){//gets the previous contact
        boolean done = false;
        int initialPTR = ptr;
        while(done==false){
            if(ptr-1<0){
                ptr=anArray.length-1;
            }
            else{
                ptr--;
            }
            if(anArray[ptr]!=null){
                done=true;
            }
            if(ptr==initialPTR){
                return null;
            }
        }
        return anArray[ptr];
    }
    public void sort(){//sort (bubble sort)
        boolean done = true;
        while(done==true){
            done=true;
            for(int i=0; i+1<anArray.length;i++){
                if((anArray[i]==null&&anArray[i+1]!=null) || anArray[i+1].getName().compareTo(anArray[i].getName())>=0){
                    Contact hold = anArray[i+1];
                    anArray[i+1]=anArray[i];
                    anArray[i]=hold;
                    done =false;
                }
            }
        }
        Contact[] holding = new Contact[anArray.length];
        for(int i=0; i<anArray.length; i++){
            holding[i]=anArray[anArray.length-1-i];
        }
        anArray=holding;
    }
    public void mergeSort(){//MergeSort
        Contact[] temp = new Contact[anArray.length];
        mergeSortHelper(anArray, 0, anArray.length-1,temp);
        write("Merge Sorted");
    }

    private Contact[] mergeSortHelper(Contact[] contacts, int start, int end, Contact[] temp){ //Helps mergeSort
        if(start<end){
            int middle=start+ (end-start)/2;
            mergeSortHelper(contacts,start,middle,temp);
            mergeSortHelper(contacts,middle+1,end,temp);
            merge(contacts,start,middle,end,temp);
        }
        return contacts;
    }

    private static Contact[] merge(Contact[] arr1, int start, int mid, int end, Contact[] temp){ //merges into one sorted array
        for(int i=start; i<= end; i++){
            temp[i]=arr1[i];
        }
        int beginning = start;
        int middle = mid+1;
        int ptr=start;
        while(beginning<=mid && middle<=end){
            if(temp[beginning].getName().compareTo(temp[middle].getName())<0){
                arr1[ptr]=temp[beginning];
                beginning++;
            }
            else{
                arr1[ptr]=temp[middle];
                middle++;
            }
            ptr++;
        }
        while(beginning<=mid){
            arr1[ptr]=temp[beginning];
            beginning++;
            ptr++;
        }
        while(middle<=end){
            arr1[ptr]=temp[middle];
            middle++;
            ptr++;
        }
        return arr1;
    }
    public void moveAhead(int n){ //moves ptr forward
        if(ptr+n<anArray.length){//wrap around
            ptr=ptr+n;
        }
        else{
            ptr=anArray.length-1;
        }
    }
    public void moveBack(int n){//moves the ptr back
        if(ptr-n>0){//wrap around
            ptr=ptr-n;
        }
        else{
            ptr=0;
        }
    }


    public static void main(String[] args) {
        ContactList newList = new ContactList(4);
        Contact Jack = new Contact("Jack", 6122223333L, "Airport", "Neat");
        Contact Taylor = new Contact("Taylor", 6124445555L, "Home", "Cool");
        Contact Alaya = new Contact("Alaya", 6124445555L, "Home", "Cool");
        Contact Jason = new Contact("Jason", 6128889999L, "Downtown", "Me");
        Contact Sarah = new Contact("Sarah", 6120001111L, "Apartment","Not me");
        System.out.println(newList.add(Jack));
        System.out.println(newList.add(Taylor));
        System.out.println(newList.add(Alaya));
        System.out.println(newList.add(Jason));
        System.out.println(newList.add(Sarah));
        System.out.println(newList.find("Jason"));
        System.out.println(newList.find("Sarah"));
        System.out.println(newList.remove());
        System.out.println(newList.find("Jason"));
        System.out.println(newList.write("aFile"));
        ContactList readIn = new ContactList(4);
        readIn.read("aFile");
        System.out.println(readIn.write("moreFiles"));
        System.out.println(newList.getCurrent().getName());
        System.out.println(" ");
        System.out.println(newList.get(1).getName());
        System.out.println(newList.get(2).getName());
        System.out.println(newList.next().getName());
        System.out.println(newList.previous().getName());
        System.out.println(newList.add(Jason));
        //  newList.sort();
        // newList.write("Merge Sorted");
        newList.mergeSort();
        System.out.println(newList.getPtr());
        newList.moveBack(2);
        System.out.println(newList.getPtr());
        newList.moveBack(2);
        System.out.println(newList.getPtr());
        newList.moveAhead(4);
        System.out.println(newList.getPtr());



    }
}
