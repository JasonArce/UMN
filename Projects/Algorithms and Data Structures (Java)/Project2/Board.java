/**
 * Created by jasonarce on 7/12/17.
 */
import java.util.Scanner;

    public class Board{

        private int row=0;
        private int column=0;
        private String[][] mainBoard;
        private String[][] playerBoard;
        private int a1; private int b1; private int c1;
        private int d1; private int e1; private int f1;
        private int g1; private int h1; private int i1;
        private int j1; private int k1; private int l1;
        private int m1; private int n1; private int o1;
        private int a2; private int b2; private int c2;		//Variables for the coordinate x or y that will be checked later for if a boat has sunk or not.
        private int d2; private int e2; private int f2;         //Six for each boat, 1's corresponding to the row value, 2's corresponding the the column value.
        private int g2; private int h2; private int i2;
        private int j2; private int k2; private int l2;
        private int m2; private int n2; private int o2;
        int quantity=0;

        public Board (int sideways, int vertical){
            try{                                            //try to make an array within the proper bounds.
                row = sideways;
                column = vertical;
                mainBoard = new String[column][row];		//Constructor for the dimensions of the board.
                playerBoard = new String[column][row];
            }//try
            catch(NegativeArraySizeException e){            //catches an array with insufficient size.
            }//catch
        }//Board()

        public void makeBoard() {

            for (int i = 0; i < column; i++) {
                for (int j = 0; j < row; j++) {        //Creates a mainBoard full of empty spaces
                    mainBoard[i][j] = "O";
                }//forLoop
            }//forLoop

            for (int a = 0; a < column; a++) {
                for (int b = 0; b < row; b++) {        //Creates a playerBoard full of empty spaces
                    playerBoard[a][b] = "O";
                }//forLoop
            }//forLoop

            System.out.println("Place rocks? Type uppercase 'Y' for yes. Anything else for no"); //Scanner used to prompt the player to place rocks or not.
            Scanner rocks = new Scanner(System.in);
            String rHold = rocks.nextLine();
            boolean isDone = false;
            int numberOfRocks = 0;
            if (rHold.equals("Y")) { //if statement used if the player would like to place rocks.
                if (row < column) {
                    System.out.println("You can place up to " + (row - 2) + " rocks. If you would like to place less than " + (row - 2) + " rocks, type 'stop'. Enter (row,column) with no spaces. Press enter after each coordinate entry.");
                    while (isDone == false && numberOfRocks < (row - 2)) { //Loop used to repeatedly place rocks until told to 'stop' or if the sufficient number of rocks has been placed.
                        rHold = rocks.nextLine();
                        if (rHold.equals("stop")) {
                            isDone = true;
                        }//if
                        else {
                            char rHoldA = rHold.charAt(1);
                            char rHoldB = rHold.charAt(3);
                            int rockX = Integer.parseInt(String.valueOf(rHoldA));
                            int rockY = Integer.parseInt(String.valueOf(rHoldB));
                            if(rockX<row && rockY<column) {
                                mainBoard[rockY][rockX] = "#";
                                playerBoard[rockY][rockX] = "#";
                                numberOfRocks++;
                            }//if
                            else{
                                System.out.println("Please enter a rock that is in range. Try again.");
                            }//else
                        }//else
                    }//while
                } //if
                else {
                    System.out.println("You can place up to " + (column - 2) + " rocks. If you would like to place less than "+(row-2)+" rocks, type 'stop'. Enter (row,column) with no spaces. Press enter after each coordinate entry.");
                    while (isDone == false && numberOfRocks < (row - 2)) {
                        rHold = rocks.nextLine();
                        if (rHold.equals("stop")) {
                            isDone = true;
                        }//if
                        else {
                            char rHoldA = rHold.charAt(1);
                            char rHoldB = rHold.charAt(3);
                            int rockX = Integer.parseInt(String.valueOf(rHoldA));
                            int rockY = Integer.parseInt(String.valueOf(rHoldB));
                            if(rockX<row && rockY<column) {
                                mainBoard[rockY][rockX] = "#";
                                playerBoard[rockY][rockX] = "#";
                                numberOfRocks++;
                            }//if
                            else{
                                System.out.println("Please enter a rock that is in range. Try again.");
                            }//else
                        }//else
                    }//while
                }//else
            }//if
        }//end makeBoard

        public void placeBoats(){
            int counter=0;
            if(column==3 || row==3){       //Will check for how many boats will be in the game.
                quantity=1;
            }//if
            if((3<row && row<=5) || (3<column && column<=5)){
                quantity=2;
            }//if
            if((5<row && row<=7) || (5<column && column<=7)){
                quantity=3;
            }//if
            if((7<row && row<=9) || (7<column && column<=9)){
                quantity=4;
            }//if
            if((9<row && row<=12) || (9<column && column<=12)){
                quantity=6;
            }//if
            if(quantity==1){
                System.out.println("ATTENTION: There is one boat");
            }//if
            if(quantity==2){
                System.out.println("ATTENTION: There are two boats");
            }//if
            if(quantity==3){
                System.out.println("ATTENTION: There are three boats");			//Print out to tell the player how many boats are in the game.
            }//if
            if(quantity==4){
                System.out.println("ATTENTION: There are four boats");
            }//if
            if(quantity==6){
                System.out.println("ATTENTION: There are six boats");
            }//if
            for(int i=0; i<quantity; i++) {
                int[][] boatCoords = new int[1][3];
                int[][] boatCoords2 = new int[1][3];
                int newBoatCol1 = 0;
                int newBoatCol2 = 0;
                int newBoatCol3 = 0;
                int newBoatRow1 = 0;
                int newBoatRow2 = 0;
                int newBoatRow3 = 0;
                boolean status = false;
                while (status == false) {

                    boolean isVertical= Math.random() > 0.5;		//Will decide whether the boat will be vertical or horizontal.
                    status=true;
                    if(isVertical==true){
                        boatCoords2[0][0] = (int)(Math.random()*(row-2));
                        boatCoords2[0][1] = boatCoords2[0][0]+1;
                        boatCoords2[0][2] = boatCoords2[0][1]+1;
                        boatCoords[0][0] = (int)(Math.random()*(column));	//Will place the boat vertical and at random coordinates.
                        boatCoords[0][1] = boatCoords[0][0];
                        boatCoords[0][2] = boatCoords[0][1];
                    }
                    else{
                        boatCoords2[0][0] = (int)(Math.random()*(row));
                        boatCoords2[0][1] = boatCoords2[0][0];
                        boatCoords2[0][2] = boatCoords2[0][1];
                        boatCoords[0][0] = (int)(Math.random()*(column-2));		//Will place the boat horizontal and at random coordinates.
                        boatCoords[0][1] = boatCoords[0][0]+1;
                        boatCoords[0][2] = boatCoords[0][1]+1;
                    }
                    newBoatCol1 = boatCoords[0][0];
                    newBoatCol2 = boatCoords[0][1];
                    newBoatCol3 = boatCoords[0][2];
                    newBoatRow1 = boatCoords2[0][0];
                    newBoatRow2 = boatCoords2[0][1];
                    newBoatRow3 = boatCoords2[0][2];

                    if (mainBoard[newBoatCol1][newBoatRow1].equals("X") || mainBoard[newBoatCol2][newBoatRow2].equals("X") || mainBoard[newBoatCol3][newBoatRow3].equals("X")) {
                        status = false;		//Will check to see if a boat has been placed in any of the three coordinates.
                    }
                    if (mainBoard[newBoatCol1][newBoatRow1].equals("#") || mainBoard[newBoatCol2][newBoatRow2].equals("#") || mainBoard[newBoatCol3][newBoatRow3].equals("#")) {
                        status = false;		//Will check to see if a rock has been placed in any of the three coordinates.
                    }

                }//endWhile
                counter++;
                mainBoard[newBoatCol1][newBoatRow1] = "X"; //Boats are actually placed at their respective coordinates.
                mainBoard[newBoatCol2][newBoatRow2] = "X";
                mainBoard[newBoatCol3][newBoatRow3] = "X";
                if(counter==1){		//Counter is equivalent to how many boats are on the board.
                    a1=newBoatCol1;
                    b1=newBoatCol2;  //1's represent the boats x-value, and the 2's represent the boats y-value.
                    c1=newBoatCol3;
                    a2=newBoatRow1;
                    b2=newBoatRow2;
                    c2=newBoatRow3;
                }//if
                if(counter==2){
                    d1=newBoatCol1;
                    e1=newBoatCol2;
                    f1=newBoatCol3;
                    d2=newBoatRow1;
                    e2=newBoatRow2;
                    f2=newBoatRow3;
                }//if
                if(counter==3){
                    g1=newBoatCol1;
                    h1=newBoatCol2;
                    i1=newBoatCol3;
                    g2=newBoatRow1;
                    h2=newBoatRow2;
                    i2=newBoatRow3;
                }//if
                if(counter==4){
                    j1=newBoatCol1;
                    k1=newBoatCol2;
                    l1=newBoatCol3;
                    j2=newBoatRow1;
                    k2=newBoatRow2;
                    l2=newBoatRow3;
                }//if
                if(counter==5){
                    m1=newBoatCol1;
                    n1=newBoatCol2;
                    o1=newBoatCol3;
                    m2=newBoatRow1;
                    n2=newBoatRow2;
                    o2=newBoatRow3;
                }//if
            }//endFor
        }//end placeBoats


        public String takeTurn(int y, int x) {
            if (x > column || x < 0 || y > row || y < 0) {	//Checks if the player made a shot that is out of range.
                return "Penalty";
            }//if
            if (mainBoard[x][y].equals("*")) {		//Checks if the player hit the same coordinate twice.
                return "Penalty";
            }//if
            if (mainBoard[x][y].equals("X")) {		//Checks if the player hit a boat coordinate.
                mainBoard[x][y] = "*";
                playerBoard[x][y] = "*";
                return "Hit";
            }//if
            if (mainBoard[x][y].equals("O")){		//Checks if the player misses a ship.
                mainBoard[x][y]= "^";
                playerBoard[x][y]="^";
                return "Miss";
            }//if
            if (mainBoard[x][y].equals("^")){		//Checks if the player misses the same spot twice.
                return "Penalty";
            }//if
            if(mainBoard[x][y].equals("#")){
                return "Penalty";
            }
            return null;
        }//end takeTurn

        public static void main(String[] args){
            int shots = 0;
            int count = 0;
            int countshot = 0;
            int countshot1 = 0;
            int countshot2 = 0;
            int countshot3 = 0;
            int countshot4 = 0;
            String hold;
            String valueHold="";
            System.out.println("Debug Mode? Type uppercase 'Y' for yes or anything else for no:"); //Scanner used to check if the player would like to Debug or not.
            Scanner debugger = new Scanner(System.in);
            String dHold = debugger.nextLine();

            System.out.println("Enter row length: ");			//Scanner used to check what the player would like the length of the board to be.
            Scanner sideways = new Scanner(System.in);
            int testS = sideways.nextInt();

            System.out.println("Enter a column length: ");			//Scanner used to check what the player would like the height of the board to be.
            Scanner vertical = new Scanner(System.in);
            int testV = vertical.nextInt();

            Board board = new Board(testS, testV);				//New board is being created.
            if((testS>=3 && testS<=12) && (testV>=3 && testV<=12)){		//Checks to see if the player entered rows and columns within the 3 and 12 boundaries.
                board.makeBoard();
                board.placeBoats();
                boolean done = false;
                while (done==false){
                    if(dHold.equals("Y")){ 				//This is the board that will be printed if debug mode is chosen and all the locations of the ships will be printed. The for 												loops print out the board and any updates before the start of every turn.
                        System.out.println("Here is the board: ");
                        for(int a=0; a<testV; a++) {
                            System.out.println(" ");
                            for(int b=0; b<testS; b++) {
                                System.out.print(board.mainBoard[a][b]+ " ");
                            }//insideForLoop
                        }//outsideForLoop
                        System.out.println(" ");
                    }//if
                    else{						//This is the board that will be printed if debug mode is not chosen. All the locations of the ships will be hidden upon 												start. The for loops print out the board and any updates before the start of every turn.
                        System.out.println("Here is the board: ");
                        for(int a=0; a<testV; a++) {
                            System.out.println(" ");
                            for(int b=0; b<testS; b++) {
                                System.out.print(board.playerBoard[a][b]+ " ");
                            }//insideForLoop
                        }//outsideForLoop
                        System.out.println(" ");
                    }//else
                    done = true;
                    System.out.println("Enter coordinate guess in form of: (Row,Column) with no spaces. Press enter after each coordinate : ");
                    try{						//Try-catch to see if the values entered are positive numbers. If negative, the player is penalized.
                        Scanner coords = new Scanner(System.in);	//Scanner for the player to enter in their coordinate values.
                        hold = coords.nextLine();
                        char holdA = hold.charAt(1);
                        char holdB = hold.charAt(3);
                        int testX=Integer.parseInt(String.valueOf(holdA));
                        int testY=Integer.parseInt(String.valueOf(holdB));
                        if(testX<board.column && testY<board.row) {
                            valueHold = board.takeTurn(testY, testX);
                            count++;
                            if (valueHold.equals("Penalty")) {
                                System.out.println("Turn " + count + ": Penalty");
                                count++;
                                System.out.println("Turn " + count + ": skipped");
                            }//if
                            else {
                                System.out.println("Turn " + count + ": (" + testX + "," + testY + "); " + valueHold);
                            }//else
                        }//if
                        else{
                            System.out.println("Out of bounds!");
                            System.out.println("Turn " + count + ": Penalty");
                            count++;
                            System.out.println("Turn " + count + ": skipped");
                        }
                        if(countshot==0&&board.quantity>=1){	//if the player has at least one boat, and the player has yet to sink the boat, 'Ship sunk!' will be printed.
                            if((board.mainBoard[board.a1][board.a2].equals("*")) && (board.mainBoard[board.b1][board.b2].equals("*")) && (board.mainBoard[board.c1][board.c2].equals("*"))){
                                board.a1=0;
                                board.a2=0;
                                board.b1=0;
                                board.b2=0;
                                board.c1=0;
                                board.c2=0; //1 boat's coordinates
                                System.out.println("Ship sunk!");
                                countshot++;}
                        }
                        if(countshot1==0&&board.quantity>=2){	//if the player has at least two boats, and the player has yet to sink the boat, 'Ship sunk!' will be printed.
                            if((board.mainBoard[board.d1][board.d2].equals("*")) && (board.mainBoard[board.e1][board.e2].equals("*")) && (board.mainBoard[board.f1][board.f2].equals("*"))){
                                board.d1=0;
                                board.d2=0;
                                board.e1=0;
                                board.e2=0;
                                board.f1=0;
                                board.f2=0; //another boat's coordinates
                                System.out.println("Ship sunk!");
                                countshot1++;}
                        }
                        if(countshot2==0&&board.quantity>=3){	//if the player has at least three boats, and the player has yet to sink the boat, 'Ship sunk!' will be printed.
                            if((board.mainBoard[board.g1][board.g2].equals("*")) && (board.mainBoard[board.h1][board.h2].equals("*")) && (board.mainBoard[board.i1][board.i2].equals("*"))){
                                board.g1=0;
                                board.g2=0;
                                board.h1=0;
                                board.h2=0;
                                board.i1=0;
                                board.i2=0; //another boat's coordinates
                                System.out.println("Ship sunk!");
                                countshot2++;}
                        }
                        if(countshot3==0&&board.quantity>=4){	//if the player has at least four boats, and the player has yet to sink the boat, 'Ship sunk!' will be printed.
                            if((board.mainBoard[board.j1][board.j2].equals("*")) && (board.mainBoard[board.k1][board.k2].equals("*")) && (board.mainBoard[board.l1][board.l2].equals("*"))){
                                board.j1=0;
                                board.j2=0;
                                board.k1=0;
                                board.k2=0;
                                board.l1=0;
                                board.l2=0; //another boat's coordinates
                                System.out.println("Ship sunk!");
                                countshot3++;}
                        }
                        if(countshot4==0&&board.quantity>=6){	//if the player has six boats, and the player has yet to sink the boat, 'Ship sunk!' will be printed.
                            if((board.mainBoard[board.m1][board.m2].equals("*")) && (board.mainBoard[board.n1][board.n2].equals("*")) && (board.mainBoard[board.o1][board.o2].equals("*"))){
                                board.m1=0;
                                board.m2=0;
                                board.n1=0;
                                board.n2=0;
                                board.o1=0;
                                board.o2=0; //another boat's coordinates
                                System.out.println("Ship sunk!");
                                countshot4++;}
                        }
                        shots++;
                        for(int j=0; j<testV; j++) {
                            for(int i=0; i<testS; i++) {	//forLoop checks if any spots on the board have an X(a component of a ship). If there is none, the loop will be exited and the 											player will win.
                                if(board.mainBoard[j][i].equals("X")) {
                                    done = false;}//if
                            }//forLoop
                        }//forLoop
                    }//try
                    catch(NumberFormatException e){
                        count++;
                        System.out.println("Turn "+ count+": Penalty");
                        count++;
                        System.out.println("Turn "+count+": skipped");
                        shots++;
                        done=false;}//try-catchEnd
                }//while
                System.out.println("You win!");
                System.out.println("Number of turns: "+count);
                System.out.println("Number of cannon shots: "+shots);
            }//if
            else{System.out.println("row and column must be between 3 and 12.");} //if the user inputs row/col length not within 3 to 12
        }//main
    }//Board.java

