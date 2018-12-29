import java.util.Scanner;
import java.util.Random;

public class Board{
	
	private int row=0;
	private int column=0;
	private static String[][] mainBoard;
	public Board (int sideways, int vertical){
		if( sideways < 3 || vertical <3 || sideways > 12 || vertical > 12){
			System.out.println("row and column must be between 3 and 12");
			return;}		
		else{		
		row = sideways;
		column = vertical;
		mainBoard = new String[column][row];
		}
	}

	public void makeBoard(){
		for(int i=0; i<column; i++) {
			//System.out.println(" ");
			for(int j=0; j<row; j++) {
				mainBoard[i][j] = "O";
				//System.out.print(mainBoard[i][j]+ " ");
			}

		}System.out.println(" ");	
	}

	public void placeBoats(){
		int counter=0;
		int quantity=0;
		if(column==3 || row==3){
			quantity=1;
			}
		if((3<row && row<=5) || (3<column && column<=5)){
			quantity=2;
			}
		if((5<row && row<=7) || (5<column && column<=7)){
			quantity=3;
			}
		if((7<row && row<=9) || (7<column && column<=9)){
			quantity=4;
			}
		if((9<row && row<=12) || (9<column && column<=12)){
			quantity=6;
			}
		Random placement = new Random();
		for(int i=0; i<quantity; i++) {
			int[][] boatCoords = new int[1][3];
			int[][] boatCoords2 = new int[1][3];
			//int or array?
			int newBoatCol1 = 0;
			int newBoatCol2 = 0;
			int newBoatCol3 = 0;
			int newBoatRow1 = 0;
			int newBoatRow2 = 0;
			int newBoatRow3 = 0;
			boolean status = false;
			while (status == false) {

				boatCoords[0][0] = placement.nextInt(row);
				boatCoords[0][1] = placement.nextInt(row);
				boatCoords[0][2] = placement.nextInt(row);
				boatCoords2[0][0] = placement.nextInt(column);
				boatCoords2[0][1] = placement.nextInt(column);
				boatCoords2[0][2] = placement.nextInt(column);

				if ((boatCoords[0][2] - boatCoords[0][1] == 1 && boatCoords[0][2] - boatCoords[0][0] == 2 && boatCoords[0][1] - boatCoords[0][0] == 1) && (boatCoords2[0][2] - boatCoords2[0][1] == 0 && boatCoords2[0][2] - boatCoords2[0][0] == 0 && boatCoords2[0][1] - boatCoords2[0][0] == 0)) {
					newBoatCol1 = boatCoords[0][0];
					newBoatCol2 = boatCoords[0][1];
					newBoatCol3 = boatCoords[0][2];
					newBoatRow1 = boatCoords2[0][0];
					newBoatRow2 = boatCoords2[0][1];
					newBoatRow3 = boatCoords2[0][2];
					status = true;
				}//endIf

				if ((boatCoords2[0][2] - boatCoords2[0][1] == 1 && boatCoords2[0][2] - boatCoords2[0][0] == 2 && boatCoords2[0][1] - boatCoords2[0][0] == 1) && (boatCoords[0][2] - boatCoords[0][1] == 0 && boatCoords[0][2] - boatCoords[0][0] == 0 && boatCoords[0][1] - boatCoords[0][0] == 0)) {
					newBoatCol1 = boatCoords[0][0];
					newBoatCol2 = boatCoords[0][1];
					newBoatCol3 = boatCoords[0][2];
					newBoatRow1 = boatCoords2[0][0];
					newBoatRow2 = boatCoords2[0][1];
					newBoatRow3 = boatCoords2[0][2];
					status = true;
				}//endIf
				if (newBoatCol1 >= column || newBoatCol2 >= column || newBoatCol3 >= column || newBoatRow1 >= row || newBoatRow2 >= row || newBoatRow3 >= row) {
					status = false;
				}
				else {
					if (mainBoard[newBoatCol1][newBoatRow1].equals("X") || mainBoard[newBoatCol2][newBoatRow2].equals("X") || mainBoard[newBoatCol3][newBoatRow3].equals("X")) {
						status = false;
					}
				}//endElse
			}//endWhile
			System.out.println("(" + newBoatRow1 + "," + newBoatCol1 + ")" + "(" + newBoatRow2 + "," + newBoatCol2 + ")" + "(" + newBoatRow3 + "," + newBoatCol3 + ")");
			mainBoard[newBoatCol1][newBoatRow1] = "X";
			mainBoard[newBoatCol2][newBoatRow2] = "X";
			mainBoard[newBoatCol3][newBoatRow3] = "X";
		}//endFor
		for(int a=0; a<column; a++) {
			System.out.println(" ");
			for(int b=0; b<row; b++) {
				System.out.print(mainBoard[a][b]+ " ");
			}
		}System.out.println(" ");	
			
		


	}//end placeBoats()


	public String takeTurn(int y, int x) {
		if (x > column || x < 0 || y > row || y < 0) {
			return "Penalty";}
			if (mainBoard[x][y].equals("*")) {
				return "Penalty";
			}
			if (mainBoard[x][y].equals("X")) {
				mainBoard[x][y] = "*";
				return "Hit";
			}
			if (mainBoard[x][y].equals("O")){
				mainBoard[x][y]= "^";
				return "Miss";
			}
			if (mainBoard[x][y].equals("^")){
				return "Penalty";
			}
		return null;
		}

	public static void main(String[] args){
		int count = 0;
		String hold;
		String valueHold="";
		System.out.println("Enter row length: ");
		Scanner sideways = new Scanner(System.in);
		int testS = sideways.nextInt();

		System.out.println("Enter a column length: ");		
		Scanner vertical = new Scanner(System.in);
		

		
		int testV = vertical.nextInt();

		Board board = new Board(testS, testV);
		board.makeBoard();
		board.placeBoats();
		boolean done = false;
		while (done==false){
			int found = 0;
			done = true;
			System.out.println("Enter coordinate guess: ");
			Scanner coords = new Scanner(System.in);
			hold = coords.nextLine();
			char holdA = hold.charAt(1);
			char holdB = hold.charAt(3);
			int testY=Integer.parseInt(String.valueOf(holdA));
			int testX=Integer.parseInt(String.valueOf(holdB));
			valueHold=board.takeTurn(testY, testX);
			count++;
			if(valueHold.equals("Penalty")) {
				System.out.println("Turn "+count+": Penalty");
				count++;
				System.out.println("Turn "+count+": skipped");
				count++;
			}
			else{
			System.out.println("Turn "+count+": (" + testY+ ","+testX+ "); "  + valueHold);}


			for(int j=0; j<testV; j++) {
				for(int i=0; i<testS; i++) {
					if(j+2<testV) {
						if (mainBoard[j][i] == "*" && mainBoard[j + 1][i] == "*" && mainBoard[j + 2][i] == "*") {
							found++;
						}
					}
					if(i+2<testS) {
						if (mainBoard[j][i] == "*" && mainBoard[j][i + 1] == "*" && mainBoard[j][i + 2] == "*") {
							found++;
						}
					}
					if(mainBoard[j][i].equals("X")) {
						done = false;}
					}
				}//forLoop
								//System.out.println("You have 1 ship Sunk!");
			}//while
		System.out.println("You win!");
		
	}//main
}//Board.java
