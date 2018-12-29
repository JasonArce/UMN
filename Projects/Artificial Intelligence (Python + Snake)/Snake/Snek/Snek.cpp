// Snek.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <SFML/Graphics.hpp>
#include <SFML/Window.hpp>
#include <SFML/OpenGL.hpp>
#include <iostream>
#include <iostream>
#include <functional>
#include <algorithm>  
#include <chrono>
#include <thread>

using std::vector;
using std::cout;
using std::endl;

sf::Mutex mutex;
int color = 255;
int color2 = 50;
bool on_the_up = false;
int gameSpeed = -1;
int s = 100;
std::string alg;
std::string game = "playing";
int foward_check_buffer = 20;
int long_path_buffer = 20;

double tries = 1;
double moves = 0;
double eaten = 0;
double total_moves = 0;
double total_eaten = 0;

//allows for the initialization of parts of the snake on the grid.
class location {
public:
	location(int a = 0, int b = 0) {
		x = a;
		y = b;
	}
	int x;
	int y;
};

//used for graphics
class ent {
public:
	ent(int x = 0, int y = 0) {
		loc = location(x, y);
		name = "e";


		shape = new sf::RectangleShape(sf::Vector2f(s - 1, s - 1));
		shape->setFillColor(sf::Color(38, 56, 37));
		shape->setPosition(x * s, y * s);
	}
	std::string debug() {
		std::string temp;
		temp = std::to_string(loc.x) + ":" + std::to_string(loc.y) + name;
		return temp;
	}
	void draw(sf::RenderWindow* window) {
		window->draw(*shape);
	}
	void sync() {
		shape->setPosition(loc.x * s, loc.y * s);
	}
	void uloc(int a, int b) {
		loc.x = a;
		loc.y = b;
		sync();
	}
	location loc;
	std::string name;
protected:
	sf::RectangleShape * shape;
};

class motorNeuron : public ent {
public:
	motorNeuron(int x = 0, int y = 0) {
		loc = location(x, y);
		name = "m";

		shape = new sf::RectangleShape(sf::Vector2f(s - 1, s - 1));
		shape->setFillColor(sf::Color(255, 0, 0, 30));
		//shape->setOutlineThickness(-1);
		//shape->setOutlineColor(sf::Color(255, 0, 0));
		shape->setPosition(x * s, y * s);
	}
};

//this class stores the data of the piece of food on the board.
class food : public ent {
public:
	food(int x = 0, int y = 0) {
		ent::loc = location(x, y);
		ent::name = "f";
		ent::shape = new sf::RectangleShape(sf::Vector2f(s - 1, s - 1));
		ent::shape->setFillColor(sf::Color(255, 96, 96));
		ent::shape->setPosition(x * s, y * s);
	}
private:
};

//snake tails are nodes. The class holds node information, the location of the node, as well as information for the graphics.
class snakeTail : public ent {
public:
	snakeTail(int x = 0, int y = 0) {
		ent::loc = location(x, y);
		ent::name = "t";
		ent::shape = new sf::RectangleShape(sf::Vector2f(s - 1, s - 1));
		if (color <= 30) {
			on_the_up = true;
		}
		if (on_the_up == false) {
			color = color - 5;
		}
		else {
			color2 = color2 + 2;
		}

		ent::shape->setFillColor(sf::Color(107, color, color2));
		ent::shape->setPosition(x * s, y * s);
	}
	snakeTail * next;
	snakeTail * previous;
private:
};

//The snake head is a node. The class holds node information, the location of the head node, as well as information for the graphics. Along with this, the direction of
//the snake is set.
class snakeHead : public ent {
public:
	snakeHead(int x = 0, int y = 0) {
		ent::loc = location(x, y);
		ent::name = "h";
		ent::shape = new sf::RectangleShape(sf::Vector2f(s - 1, s - 1));
		ent::shape->setFillColor(sf::Color(35, 255, 50));
		ent::shape->setPosition(x * s, y * s);
		direction = "E";
		ndirection = "0";
	}
	void update() {
		if (direction == "E") {
			ent::loc.x = ent::loc.x + 1;
			ent::shape->setPosition(loc.x * s, loc.y * s);
			return;
		}
		if (direction == "N") {
			ent::loc.y = ent::loc.y - 1;
			ent::shape->setPosition(loc.x * s, loc.y * s);
			return;
		}
		if (direction == "S") {
			ent::loc.y = ent::loc.y + 1;
			ent::shape->setPosition(loc.x * s, loc.y * s);
			return;
		}
		if (direction == "W") {
			ent::loc.x = ent::loc.x - 1;
			ent::shape->setPosition(loc.x * s, loc.y * s);
			return;
		}
		cout << "GIVEN DIRECTION" << direction << endl;
		cout << "INVALID SNEK UPDATE DIRECTION" << endl;
	}
	std::string direction;
	std::string ndirection;
	snakeTail * next;
private:
};

class motorNet {
public:
	motorNet(snakeHead* mask, int x = 3, int y = 3) {
		snek = mask;
		for (int z = 0; z < x; z++) {
			vector<motorNeuron*> aRow;

			for (int a = 0; a < y; a++) {
				motorNeuron * temp = new motorNeuron(z + snek->loc.x, a + snek->loc.y);
				aRow.push_back(temp);
			}
			net.push_back(aRow);
		}
	}

	void draw(sf::RenderWindow* window) {
		/*for (int x = 0; x < board.size(); x++) {
		for (int y = 0; y < board[x].size(); y++) {
		board[x][y]->draw(window);
		}
		}*/

		std::for_each(net.begin(), net.end(), [&](vector <motorNeuron*> n) { std::for_each(n.begin(), n.end(), [&](motorNeuron *e) { e->draw(window); }); });
	}
	void update() {
		for (int x = 0; x < net.size(); x++) {
			for (int y = 0; y < net[x].size(); y++) {
				net[x][y]->uloc(x + snek->loc.x, y + snek->loc.y);
			}
		}
	}
private:
	vector< vector<motorNeuron*> > net;
	snakeHead* snek;
};

//The node class has information about the location of the node, as well as the parent. It also holds useful information such as g and h which help to create the heuristic
// function that is used in the A* algorithms.
class node {
public:
	node(int x, int y, node * parent1, int g1, int h1) {
		loc = location(x, y);
		parent = parent1;
		g = g1;
		h = h1;
		cost = g + h;
	}
	location loc;
	node * parent;
	int g;
	int h;
	int cost;
};

//The gameboard holds everything related to the snake and the board itself.
class gameBoard {
public:
	//gameboard creates food and places the head of the snake and its two tails on the board.
	gameBoard(int x = 9, int y = 8) {
		for (int z = 0; z < x; z++) {
			vector<ent*> aRow;

			for (int a = 0; a < y; a++) {
				ent * tempent = new ent(z, a);
				aRow.push_back(tempent);
			}
			board.push_back(aRow);
		}
		snek = new snakeHead(3, 3);
		board[3][3] = snek;

		snakeTail * t1 = new snakeTail(2, 3);
		board[2][3] = t1;
		snek->next = t1;

		snakeTail * t2 = new snakeTail(1, 3);
		board[1][3] = t2;
		t1->next = t2;
		t2->previous = t1;
		createFood();
		inet = new motorNet(snek, 3, 3);

	}
	//reset() simply resets the board to how the snake algorithm would run if the code were to be run anew.
	void reset() {
		eaten = eaten - 1;
		total_eaten = total_eaten - 1;

		if ((int)tries % 1 == 0) {
			cout << "Try: " << tries << " ";
			cout << "Eaten: " << eaten << " ";
			cout << "Moves: " << moves << " ";
			cout << "Eaten/Moves: " << eaten / moves << " ";
			cout << endl;

			cout << "Total_Eaten: " << total_eaten << " ";
			cout << "Total_Moves: " << total_moves << " ";
			cout << "Avg Moves/Eaten: " << total_moves / total_eaten  << " ";
			cout << "Avg Eaten/Trial: " << total_eaten / tries << " ";
			cout << "Avg Moves/Trial: " << total_moves / tries << " ";
			cout << endl;
		}


		tries++;
		moves = 0;
		eaten = 0;



		int x = board.size();
		int y = board[0].size();
		mutex.lock();
		board.clear();

		color = 255;
		color2 = 50;
		bool on_the_up = false;

		for (int z = 0; z < x; z++) {
			vector<ent*> aRow;

			for (int a = 0; a < y; a++) {
				ent * tempent = new ent(z, a);
				aRow.push_back(tempent);
			}
			board.push_back(aRow);
		}
		snek->uloc(3, 3);
		snek->direction = "E";
		board[3][3] = snek;

		snakeTail * t1 = new snakeTail(2, 3);
		board[2][3] = t1;
		snek->next = t1;

		snakeTail * t2 = new snakeTail(1, 3);
		board[1][3] = t2;
		t1->next = t2;
		t2->previous = t1;
		createFood();
		restart = 1;
		west = 0;
		color = 200;
		mutex.unlock();
	}
	//debug() allows the user to view what the board looks like.
	void debug() {
		vector<std::string> strings(board[0].size());
		for (int x = 0; x < board.size(); x++) {
			for (int y = 0; y < board[x].size(); y++) {
				strings[y] = strings[y] + board[x][y]->debug() + " ";
			}
		}
		for (int x = 0; x < strings.size(); x++) {
			cout << strings[x];
			cout << endl;
		}
		cout << endl;
	}
	//draw() makes the board itself in the graphics window
	void draw(sf::RenderWindow* window) {
		/*for (int x = 0; x < board.size(); x++) {
		for (int y = 0; y < board[x].size(); y++) {
		board[x][y]->draw(window);
		}
		}*/

		std::for_each(board.begin(), board.end(), [&](vector <ent*> n) { std::for_each(n.begin(), n.end(), [&](ent *e) { e->draw(window); }); });
		//inet->draw(window);
	}
	//update() determines the type of algorithm to be used in this iteration of Snake.
	void update() {
		if (alg == "random_move") {
			randomMove();
		}
		if (alg == "super_loop") {
			superLoop();
		}
		if (alg == "greedy_alg") {
			greedy(snek->loc);
		}
		if (alg == "a_star") {
			aStar();
		}
		if (alg == "dynamic_star") {
			dynamic_a_Star();
		}
		if (alg == "dynamic_star_ff") {
			dynamic_a_Star_ff();
		}
		else if (alg == "player_input") {
			if (snek->ndirection != "0") {
				snek->direction = snek->ndirection;
				snek->ndirection = "0";
			}
		}
		int status = updateSnakePosition();
		if (status == -1) {
			//cout << "You Died " << endl;
			//game = "over";
			//std::this_thread::sleep_for(std::chrono::milliseconds(5000));
			reset();
		}
		inet->update();
	}

	void key(std::string input) {
		if (input == "W")
		{
			if (snek->direction != "E")
			{
				snek->ndirection = "W";
			}
		}
		if (input == "N")
		{
			if (snek->direction != "S")
			{
				snek->ndirection = "N";
			}
		}
		if (input == "E")
		{
			if (snek->direction != "W")
			{
				snek->ndirection = "E";
			}
		}
		if (input == "S")
		{
			if (snek->direction != "N")
			{
				snek->ndirection = "S";
			}
		}
	}

	void randomMove() {
		vector<std::string> possible_moves = getLegalMoves();
		// "E" //
		if (snek->loc.x + 1 >= board.size() || (board[snek->loc.x + 1][snek->loc.y]->name != "e" && board[snek->loc.x + 1][snek->loc.y]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "E"), possible_moves.end());
		}
		// "N" //
		if (snek->loc.y - 1 < 0 || (board[snek->loc.x][snek->loc.y - 1]->name != "e" && board[snek->loc.x][snek->loc.y - 1]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "N"), possible_moves.end());
		}
		// "S" //
		if (snek->loc.y + 1 >= board[0].size() || (board[snek->loc.x][snek->loc.y + 1]->name != "e" && board[snek->loc.x][snek->loc.y + 1]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "S"), possible_moves.end());
		}
		// "W" //
		if (snek->loc.x - 1 < 0 || (board[snek->loc.x - 1][snek->loc.y]->name != "e" && board[snek->loc.x - 1][snek->loc.y]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "W"), possible_moves.end());
		}

		try {
			if (possible_moves.size() > 0) {
				int t1 = (rand() % possible_moves.size());
				snek->direction = possible_moves[t1];
			}
		}
		catch (int e) {
			cout << "random_move_exception: " << e << endl;
		}
	}

	void superLoop() {

		if (restart == 0 && snek->direction == "E" && snek->loc.y - 1 < 0 && !(snek->loc.x + 1 <= board.size() - 1)) {
			snek->direction = "S";
			west = 0;
		}
		else if (restart == 0 && snek->direction == "E" && snek->loc.y - 1 > 0 && !(snek->loc.x + 2 <= board.size() - 1)) {
			snek->direction = "N";
		}
		else if (snek->direction == "N" && west == 1) {
			snek->direction = "W";
			west = 0;
		}
		else if (snek->direction == "E" && snek->loc.x + 2 <= board.size() - 1) {
			snek->direction = "E";
		}
		else if (snek->direction == "E" && snek->loc.y - 1 > 0 && !(snek->loc.x + 2 <= board.size() - 1)) {
			snek->direction = "S";
		}
		else if (snek->direction == "S" && (snek->loc.y + 1 >= board[0].size())) {
			snek->direction = "W";
		}
		else if (snek->direction == "W" && (snek->loc.x - 1 < 0)) {
			snek->direction = "N";
			restart = 0;
		}
		else if (snek->direction == "N" && (snek->loc.x - 1 < 0) && west == 0) {
			snek->direction = "E";
			west = 1;
		}
	}

	void greedy(location loc) {
		vector<std::string> possible_moves = getLegalMoves();
		int shortest = -1;
		int distance;
		int index = 0;
		int xAxis = 0;
		int yAxis = 0;
		//cout << "\n"
		for (int x = 0; x < possible_moves.size(); x++) {

			//cout << possible_moves[x]; 


			if (possible_moves[x] == "N") {
				xAxis = loc.x;
				yAxis = loc.y - 1;
			}
			if (possible_moves[x] == "E") {
				xAxis = loc.x + 1;
				yAxis = loc.y;
			}
			if (possible_moves[x] == "W") {
				xAxis = loc.x - 1;
				yAxis = loc.y;
			}
			if (possible_moves[x] == "S") {
				xAxis = loc.x;
				yAxis = loc.y + 1;
			}
			if (shortest == -1) {
				shortest = abs((xAxis - apple->loc.x)) + abs((yAxis - apple->loc.y));
			}
			else {
				distance = abs((xAxis - apple->loc.x)) + abs((yAxis - apple->loc.y));
				if (distance < shortest) {
					index = x;
					shortest = distance;
				}
			}


		}
		if (possible_moves[index] != "") {
			snek->direction = possible_moves[index];
		}


	}

	void longestPath(node * current) {
		current = longestPathHelper(current);
		node * papa = current->parent;
		node * nextmove = current;
		while (papa != nullptr && papa->parent != nullptr) {
			nextmove = papa;
			papa = papa->parent;
		}
		//cout << "NEXT MOVE" << nextmove->loc.x << "|" << nextmove->loc.y << endl;
		if (nextmove->loc.x > snek->loc.x) {
			snek->direction = "E";
		}
		else if (nextmove->loc.x < snek->loc.x) {
			snek->direction = "W";
		}
		else if (nextmove->loc.y > snek->loc.y) {
			snek->direction = "S";
		}
		else if (nextmove->loc.y < snek->loc.y) {
			snek->direction = "N";
		}
		else {
			//cout << "Longest Path Executed on Dead End" << endl;
		}
	}

	node * longestPathHelper(node * current) {
		int g = current->g;
		int max_search = long_path_buffer + g;
		vector<node*> open;
		//vector<node*> dead_end;
		node * largest = new node(0, 0, nullptr, -1, 0);
		open.push_back(current);
		int loopcount = 0;
		while (open.size() > 0) {
			/*loopcount++;
			if (loopcount % 1000 == 0) {
				cout << "ll loop: " << loopcount / 1000 << endl;
			}*/
			node * current = open.back();
			open.erase(std::remove(open.begin(), open.end(), current), open.end());
			vector<node*> sucs = dynamic_sucessors(current);
			if (sucs.size() == 0) {
				if (current->g > largest->g) {
					largest = current;
				}
			}
			else {
				for (node * x : sucs) {
					if (x->g > max_search) {
						return x;
					}
					open.push_back(x);
				}
			}
		}
		//find largest
		return largest;
	}

	int ff(node * current) {
		node * largest = new node(0, 0, nullptr, -1, 0);
		int g = current->g;
		int max_search = foward_check_buffer + g;
		vector<node*> open;
		open.push_back(current);
		int loopcount = 0;
		while (open.size() > 0) {
			/*loopcount++;
			if (loopcount % 1000 == 0) {
				cout << "ff loop: " << loopcount / 1000 << endl;
			}*/
			node * current = open.back();
			if (current->g > max_search) {
				return (current->g - g);
			}
			open.erase(std::remove(open.begin(), open.end(), current), open.end());
			vector<node*> sucs = dynamic_sucessors(current);
			if (sucs.size() == 0) {
				if (current->g > largest->g) {
					largest = current;
				}
			}
			else {
				for (node * x : sucs) {
					if (x->g > max_search) {
						return (current->g - g);
					}
					open.push_back(x);
				}
			}
		}
		//find largest
		return (largest->g - g);
	}

	int aStar() {
		bool solved = false;
		vector<node*> open;
		vector<node*> closed;
		node * current = new node(snek->loc.x, snek->loc.y, nullptr, 0, man(snek->loc));
		open.push_back(current);
		int loopcount = 0;
		while (open.size() > 0) {
			node * current = cheapest(open);
			open.erase(std::remove(open.begin(), open.end(), current), open.end());
			closed.push_back(current);
			if (current->h == 0) {
				node * papa = current->parent;
				node * nextmove = current;
				while (papa->parent != nullptr) {
					nextmove = papa;
					papa = papa->parent;
				}
				if (nextmove->loc.x > snek->loc.x) {
					snek->direction = "E";
				}
				else if (nextmove->loc.x < snek->loc.x) {
					snek->direction = "W";
				}
				else if (nextmove->loc.y > snek->loc.y) {
					snek->direction = "S";
				}
				else if (nextmove->loc.y < snek->loc.y) {
					snek->direction = "N";
				}
				else {
					cout << "FATAL MOVE SELCTION ERROR A*" << endl;
				}
				return 1;
			}
			vector<node*> sucs = sucessors(current);
			for (node * x : sucs) {


				if (find(closed, x) != nullptr) {
					/* closed contains x */
				}
				else {
					/* closed does not contain x */
					if (find(open, x) != nullptr) {
						/* open contains x */
						node * other_x = find(open, x);
						if (x->g < other_x->g) {
							open.erase(std::remove(open.begin(), open.end(), other_x), open.end());
							open.push_back(x);
						}

					}
					else {
						/* open does not contain x */
						open.push_back(x);
					}

				}



			}

		}
		//cout << "NO PATH FOUND" << endl;
		greedy(snek->loc);
	}

	int dynamic_a_Star() {
		bool solved = false;
		vector<node*> open;
		vector<node*> closed;
		node * current = new node(snek->loc.x, snek->loc.y, nullptr, 0, man(snek->loc));
		open.push_back(current);
		int loopcount = 0;
		while (open.size() > 0) {
			//loopcount++;
			//cout << "L: " << loopcount;

			/*
			cout << "AVAILABLE NODES: " << endl;
			for (node * x : open) {
			cout << x->loc.x << "|" << x->loc.y << "   Man: " << x->h << " Total: " << x->cost << endl;
			}
			cout << endl;
			*/

			node * current = cheapest(open);
			open.erase(std::remove(open.begin(), open.end(), current), open.end());
			closed.push_back(current);
			//cout << "Node Selected: " << current->loc.x << "|" << current->loc.y << "   Man: " << current->h << " Total: " << current->cost << endl;
			//std::this_thread::sleep_for(std::chrono::milliseconds(3000));


			if (current->h == 0) {
				//cout << "SOLUTION FOUND A*" << endl;
				node * papa = current->parent;
				node * nextmove = current;
				while (papa->parent != nullptr) {
					nextmove = papa;
					papa = papa->parent;
				}
				//cout << "NEXT MOVE" << nextmove->loc.x << "|" << nextmove->loc.y << endl;
				if (nextmove->loc.x > snek->loc.x) {
					snek->direction = "E";
				}
				else if (nextmove->loc.x < snek->loc.x) {
					snek->direction = "W";
				}
				else if (nextmove->loc.y > snek->loc.y) {
					snek->direction = "S";
				}
				else if (nextmove->loc.y < snek->loc.y) {
					snek->direction = "N";
				}
				else {
					cout << "FATAL MOVE SELCTION ERROR A*" << endl;
				}
				return 1;
			}
			//do it
			vector<node*> sucs = dynamic_sucessors(current);
			for (node * x : sucs) {


				if (find(closed, x) != nullptr) {
					/* closed contains x */
				}
				else {
					/* closed does not contain x */
					if (find(open, x) != nullptr) {
						/* open contains x */
						node * other_x = find(open, x);
						if (x->g < other_x->g) {
							open.erase(std::remove(open.begin(), open.end(), other_x), open.end());
							open.push_back(x);
						}

					}
					else {
						/* open does not contain x */
						open.push_back(x);
					}

				}



			}

		}
		//cout << "NO PATH FOUND" << endl;
		greedy(snek->loc);
	}

	int dynamic_a_Star_ff() {
		bool solved = false;
		vector<node*> open;
		vector<node*> closed;
		node * current = new node(snek->loc.x, snek->loc.y, nullptr, 0, man(snek->loc));
		open.push_back(current);
		int loopcount = 0;
		while (open.size() > 0) {
			bool add_nodes = true;
			loopcount++;
			if (loopcount % 1000 == 0) {
				cout << "1000 A* loop: " << loopcount / 1000 << endl;
			}
			//cout << "L: " << loopcount;

			/*
			cout << "AVAILABLE NODES: " << endl;
			for (node * x : open) {
			cout << x->loc.x << "|" << x->loc.y << "   Man: " << x->h << " Total: " << x->cost << endl;
			}
			cout << endl;
			*/

			node * current = cheapest(open);
			open.erase(std::remove(open.begin(), open.end(), current), open.end());
			closed.push_back(current);
			//cout << "Node Selected: " << current->loc.x << "|" << current->loc.y << "   Man: " << current->h << " Total: " << current->cost << endl;
			//std::this_thread::sleep_for(std::chrono::milliseconds(3000));


			if (current->h == 0) {
				int moves = ff(current);
				//cout << "moves after: " << moves << endl;
				if (moves >= foward_check_buffer) {
					//cout << "SOLUTION FOUND A*" << endl;
					node * papa = current->parent;
					node * nextmove = current;
					while (papa != nullptr && papa->parent != nullptr) {
						nextmove = papa;
						papa = papa->parent;
					}
					//cout << "NEXT MOVE" << nextmove->loc.x << "|" << nextmove->loc.y << endl;
					if (nextmove->loc.x > snek->loc.x) {
						snek->direction = "E";
					}
					else if (nextmove->loc.x < snek->loc.x) {
						snek->direction = "W";
					}
					else if (nextmove->loc.y > snek->loc.y) {
						snek->direction = "S";
					}
					else if (nextmove->loc.y < snek->loc.y) {
						snek->direction = "N";
					}
					else {
						/////////////////////////////////////////cout << "FATAL MOVE SELCTION ERROR A*" << endl;
						reset();
					}
					return 1;
				}
				else {
					add_nodes = false;
				}

			}
			if (add_nodes) {
				vector<node*> sucs = dynamic_sucessors(current);
				for (node * x : sucs) {
					if (find(closed, x) != nullptr) {
						/* closed contains x */
					}
					else {
						/* closed does not contain x */
						if (find(open, x) != nullptr) {
							/* open contains x */
							node * other_x = find(open, x);
							if (x->g < other_x->g) {
								open.erase(std::remove(open.begin(), open.end(), other_x), open.end());
								open.push_back(x);
							}

						}
						else {
							/* open does not contain x */
							open.push_back(x);
						}
					}
				}


			}

		}
		//cout << "INTITIATE LONGEST PATH" << endl;

		current = new node(snek->loc.x, snek->loc.y, nullptr, 0, man(snek->loc));
		longestPath(current);
	}


	int man(location loc) {
		int manh = abs(loc.x - apple->loc.x) + abs(loc.y - apple->loc.y);
		//cout << "Man of: " << loc.x << "|" << loc.y << " to: " << apple->loc.x << "|" << apple->loc.y << "=" << manh << endl;
		return manh;
	}

	node * cheapest(vector<node*> list) {
		node * cheap = list[0];
		for (node * x : list) {
			if (x->cost < cheap->cost) {
				cheap = x;
			}
			else if (x->cost <= cheap->cost) {
				if (x->h < cheap->h) {
					cheap = x;
				}
			}
		}
		return cheap;
	}

	vector<node*> sucessors(node * start) {
		vector<node*> sucs;
		if (start->loc.x + 1 < board.size()) {
			location loc2 = location(start->loc.x + 1, start->loc.y);
			node * E = new node(start->loc.x + 1, start->loc.y, start, start->g + 1, man(loc2));
			sucs.push_back(E);
		}
		if (start->loc.y - 1 >= 0) {
			location loc2 = location(start->loc.x, start->loc.y - 1);
			node * N = new node(start->loc.x, start->loc.y - 1, start, start->g + 1, man(loc2));
			sucs.push_back(N);
		}
		if (start->loc.y + 1 < board[0].size()) {
			location loc2 = location(start->loc.x, start->loc.y + 1);
			node * S = new node(start->loc.x, start->loc.y + 1, start, start->g + 1, man(loc2));
			sucs.push_back(S);
		}
		if (start->loc.x - 1 >= 0) {
			location loc2 = location(start->loc.x - 1, start->loc.y);
			node * W = new node(start->loc.x - 1, start->loc.y, start, start->g + 1, man(loc2));
			sucs.push_back(W);
		}
		vector<node*> to_remove;
		for (node * x : sucs) {
			if (board[x->loc.x][x->loc.y]->name != "e" && board[x->loc.x][x->loc.y]->name != "f") {
				//sucs.erase(std::remove(sucs.begin(), sucs.end(), x), sucs.end());
				to_remove.push_back(x);
			}
			node * papa = x->parent;
			//erase successors with same location as parents of a node
			while (papa != nullptr && papa->parent != nullptr) {
				if (papa->loc.x == x->loc.x && papa->loc.y == x->loc.y) {
					//sucs.erase(std::remove(sucs.begin(), sucs.end(), x), sucs.end());
					to_remove.push_back(x);
				}
				papa = papa->parent;
			}
		}
		for (node * x : to_remove) {
			sucs.erase(std::remove(sucs.begin(), sucs.end(), x), sucs.end());
		}
		/*cout << "SUCCESSORS GENERATED: ";
		for (node * x : sucs) {
		cout << x->loc.x << "|" << x->loc.y << "||" << x->h << " ";
		}*/
		//cout << endl;
		return sucs;
	}

	vector<node*> dynamic_sucessors(node * start) {
		vector<node*> sucs;
		if (start->loc.x + 1 < board.size()) {
			location loc2 = location(start->loc.x + 1, start->loc.y);
			node * E = new node(start->loc.x + 1, start->loc.y, start, start->g + 1, man(loc2));
			sucs.push_back(E);
		}
		if (start->loc.y - 1 >= 0) {
			location loc2 = location(start->loc.x, start->loc.y - 1);
			node * N = new node(start->loc.x, start->loc.y - 1, start, start->g + 1, man(loc2));
			sucs.push_back(N);
		}
		if (start->loc.y + 1 < board[0].size()) {
			location loc2 = location(start->loc.x, start->loc.y + 1);
			node * S = new node(start->loc.x, start->loc.y + 1, start, start->g + 1, man(loc2));
			sucs.push_back(S);
		}
		if (start->loc.x - 1 >= 0) {
			location loc2 = location(start->loc.x - 1, start->loc.y);
			node * W = new node(start->loc.x - 1, start->loc.y, start, start->g + 1, man(loc2));
			sucs.push_back(W);
		}

		//get g
		int g = start->g;

		snakeTail * temp = snek->next;


		//iterate to the end of the tail
		while (temp->next != nullptr) {
			temp = temp->next;
		}

		vector< vector<ent*> > newBoard;

		for (int i = 0; i < board.size(); i++) {
			newBoard.push_back(board[i]);
		}


		//set old space name
		std::string hold = board[temp->loc.x][temp->loc.y]->name;

		int count = 0;
		//only set the last segments of the snake that are less than g to be e
		while (count < g - 1 && temp->previous != nullptr) {
			newBoard[temp->loc.x][temp->loc.y]->name = "e";
			temp = temp->previous;
			count++;
		}


		vector<node*> to_remove;
		for (node * x : sucs) {
			if (newBoard[x->loc.x][x->loc.y]->name != "e" && newBoard[x->loc.x][x->loc.y]->name != "f") {
				//sucs.erase(std::remove(sucs.begin(), sucs.end(), x), sucs.end());

				to_remove.push_back(x);
			}
			node * papa = x->parent;
			//erase successors with same location as parents of a node
			while (papa != nullptr && papa->parent != nullptr) {
				if (papa->loc.x == x->loc.x && papa->loc.y == x->loc.y) {
					//sucs.erase(std::remove(sucs.begin(), sucs.end(), x), sucs.end());
					to_remove.push_back(x);
				}
				papa = papa->parent;
			}
		}


		for (node * x : to_remove) {
			sucs.erase(std::remove(sucs.begin(), sucs.end(), x), sucs.end());
		}

		/*cout << "SUCCESSORS GENERATED: ";
		for (node * x : sucs) {
		cout << x->loc.x << "|" << x->loc.y << "||" << x->h << " ";
		}*/

		//cout << endl;

		//revert to old values

		//reset temp to head
		temp = snek->next;
		//iterate to the end of the tail
		while (temp->next != nullptr) {
			temp = temp->next;
		}
		count = 0;
		//reset the locations on the board visited to their original values
		while (count < g && temp->previous != nullptr) {
			board[temp->loc.x][temp->loc.y]->name = hold;
			temp = temp->previous;
			count++;
		}

		return sucs;
	}

	node* find(vector<node*> list, node * to_find) {
		node * returner = nullptr;
		for (node * z : list) {
			if (z->loc.x == to_find->loc.x && z->loc.y == to_find->loc.y) {
				returner = z;
			}
		}
		return returner;
	}

	vector<std::string> getLegalMoves() {
		vector<std::string> possible_moves{ "N","E","S","W" };
		std::string old_direction = snek->direction;
		if (old_direction == "N") {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "S"), possible_moves.end());
		}
		if (old_direction == "E") {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "W"), possible_moves.end());
		}
		if (old_direction == "S") {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "N"), possible_moves.end());
		}
		if (old_direction == "W") {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "E"), possible_moves.end());
		}
		if (snek->loc.y + 1 >= board[0].size() || (board[snek->loc.x][snek->loc.y + 1]->name != "e" && board[snek->loc.x][snek->loc.y + 1]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "S"), possible_moves.end());
		}
		if (snek->loc.y - 1 < 0 || (board[snek->loc.x][snek->loc.y - 1]->name != "e" && board[snek->loc.x][snek->loc.y - 1]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "N"), possible_moves.end());
		}
		if (snek->loc.x + 1 >= board[0].size() || (board[snek->loc.x + 1][snek->loc.y]->name != "e" && board[snek->loc.x + 1][snek->loc.y]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "E"), possible_moves.end());
		}
		if (snek->loc.x - 1 < 0 || (board[snek->loc.x - 1][snek->loc.y]->name != "e" && board[snek->loc.x - 1][snek->loc.y]->name != "f")) {
			possible_moves.erase(std::remove(possible_moves.begin(), possible_moves.end(), "W"), possible_moves.end());
		}
		return possible_moves;
	}

	int west = 0;
	int restart = 1;
	snakeHead * snek;
	sf::Clock clock;
	vector< vector<ent*> > board;

private:
	//updateSnakePosition() increments the snake, creates new food, and updates the position of the snake and the food on the board.
	int updateSnakePosition() {
		moves = moves + 1;
		total_moves = total_moves + 1;
		if (snek->direction == "E") {
			if (snek->loc.x + 1 >= board.size()) {
				return -1;
			}


			if (board[snek->loc.x + 1][snek->loc.y]->name == "e") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				ent * tempent = new ent(prev.x, prev.y);
				board[prev.x][prev.y] = tempent;
				return 1;
			}
			if (board[snek->loc.x + 1][snek->loc.y]->name == "f") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				snakeTail * t = new snakeTail(prev.x, prev.y);
				temp->next = t;
				t->previous = temp;
				board[prev.x][prev.y] = t;
				createFood();
				return 1;
			}
			return -1;
		}
		if (snek->direction == "N") {
			if (snek->loc.y - 1 < 0) {
				return -1;
			}


			if (board[snek->loc.x][snek->loc.y - 1]->name == "e") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				ent * tempent = new ent(prev.x, prev.y);
				board[prev.x][prev.y] = tempent;
				return 1;
			}
			if (board[snek->loc.x][snek->loc.y - 1]->name == "f") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				snakeTail * t = new snakeTail(prev.x, prev.y);
				temp->next = t;
				t->previous = temp;
				board[prev.x][prev.y] = t;
				createFood();
				return 1;
			}
			return -1;
		}
		if (snek->direction == "S") {
			if (snek->loc.y + 1 >= board[0].size()) {
				return -1;
			}


			if (board[snek->loc.x][snek->loc.y + 1]->name == "e") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				ent * tempent = new ent(prev.x, prev.y);
				board[prev.x][prev.y] = tempent;
				return 1;
			}
			if (board[snek->loc.x][snek->loc.y + 1]->name == "f") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				snakeTail * t = new snakeTail(prev.x, prev.y);
				temp->next = t;
				t->previous = temp;
				board[prev.x][prev.y] = t;
				createFood();
				return 1;
			}
			return -1;
		}
		if (snek->direction == "W") {
			if (snek->loc.x - 1 < 0) {
				return -1;
			}


			if (board[snek->loc.x - 1][snek->loc.y]->name == "e") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				ent * tempent = new ent(prev.x, prev.y);
				board[prev.x][prev.y] = tempent;
				return 1;
			}
			if (board[snek->loc.x - 1][snek->loc.y]->name == "f") {
				//ALIVE
				location prevprev = snek->loc;
				location prev = snek->loc;

				snek->update();
				board[snek->loc.x][snek->loc.y] = snek;

				snakeTail * temp = snek->next;
				prev = temp->loc;

				temp->loc = prevprev;
				temp->sync();
				board[temp->loc.x][temp->loc.y] = temp;


				while (temp->next != nullptr) {
					temp = temp->next;
					prevprev = prev;
					prev = temp->loc;
					temp->loc = prevprev;
					temp->sync();
					board[temp->loc.x][temp->loc.y] = temp;
				}
				snakeTail * t = new snakeTail(prev.x, prev.y);
				temp->next = t;
				t->previous = temp;
				board[prev.x][prev.y] = t;
				createFood();
				return 1;
			}
			return -1;
		}

		cout << "INVALID GAMEBOARD UPDATE DIRECTION" << endl;
		cout << "Dir: " << snek->direction << endl;
		return -1;
	}
	//createFood() randomly generates food on the board.
	void createFood() {
		eaten = eaten + 1;
		total_eaten = total_eaten + 1;

		int x = board.size();
		int y = board[0].size();
		for (int count = 0; count < 20; count++) {
			int t1 = (rand() % x);
			int t2 = (rand() % y);
			if (board[t1][t2]->name == "e") {
				food * f = new food(t1, t2);
				board[t1][t2] = f;
				apple = f;
				//cout << endl << "Created random generator food" << endl;
				return;
			}
		}
		vector<ent*> replacements;
		for (int px = 0; px < board.size(); px++) {
			for (int py = 0; py < board[px].size(); py++) {
				if (board[px][py]->name == "e") {
					replacements.push_back(board[px][py]);
				}
			}
		}
		if (replacements.size() == 0) {
			//cout << endl << "YOU WIN!!!!!!" << endl;
			return;
		}
		int t1 = (rand() % replacements.size());
		int x1 = replacements[t1]->loc.x;
		int y1 = replacements[t1]->loc.y;
		food * f = new food(x1, y1);
		board[x1][y1] = f;
		//cout << endl << "Created strat placed food" << endl;
		return;
	}
	food * apple;
	motorNet * inet;
};

//renderingThread is used to create the render window which is used to display the game board.
void renderingThread(sf::RenderWindow* window, gameBoard * board)
{

	while (window->isOpen())
	{
		window->clear();
		mutex.lock();
		board->draw(window);
		mutex.unlock();
		window->display();
	}
}

int main()
{
	srand(time(NULL));
	unsigned int steps = 0;
	int time = 200;
	bool done = false;

	sf::RenderWindow window1(sf::VideoMode(750, 500, 32), "Setup", sf::Style::Default);

	sf::Font font;

	font.loadFromFile("arial.ttf");
	// Create a message
	sf::Text text("Please enter a number on your keyboard \n 0. Player Input \n 1. Random Move \n 2. Super Loop \n 3. Greedy \n 4. A* \n 5. Dynamic A* \n 6. Dynamic A* with foward checking", font);
	text.setCharacterSize(30);
	text.setStyle(sf::Text::Bold);
	sf::Text speed("Please enter a letter on your keyboard \n A. Slow \n B. Medium \n C. Fast \n D. Very Fast \n E. Max Speed!", font);
	// Draw the message
	window1.clear();
	window1.draw(text);
	window1.display();

	//select the algorithm
	while (window1.isOpen())
	{
		sf::Event event1;
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Num0))
		{
			alg = "player_input";
			window1.clear();
			window1.draw(speed);
			window1.display();
			while (done == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
				{
					time = 750;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::B))
				{
					time = 250;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::C))
				{
					time = 50;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
				{
					time = 20;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::E))
				{
					time = -1;
					done = true;
				}
			}
			window1.close();
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Num1))
		{
			alg = "random_move";
			window1.clear();
			window1.draw(speed);
			window1.display();
			while (done == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
				{
					time = 750;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::B))
				{
					time = 250;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::C))
				{
					time = 50;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
				{
					time = 20;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::E))
				{
					time = -1;
					done = true;
				}
			}
			window1.close();
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Num2))
		{
			alg = "super_loop";
			window1.clear();
			window1.draw(speed);
			window1.display();
			while (done == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
				{
					time = 750;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::B))
				{
					time = 250;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::C))
				{
					time = 50;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
				{
					time = 20;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::E))
				{
					time = -1;
					done = true;
				}
			}
			window1.close();
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Num3))
		{
			alg = "greedy_alg";
			window1.clear();
			window1.draw(speed);
			window1.display();
			while (done == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
				{
					time = 750;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::B))
				{
					time = 250;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::C))
				{
					time = 50;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
				{
					time = 20;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::E))
				{
					time = -1;
					done = true;
				}
			}
			window1.close();
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Num4))
		{
			alg = "a_star";
			window1.clear();
			window1.draw(speed);
			window1.display();
			while (done == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
				{
					time = 750;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::B))
				{
					time = 250;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::C))
				{
					time = 50;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
				{
					time = 20;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::E))
				{
					time = -1;
					done = true;
				}
			}
			window1.close();
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Num5)) {
			alg = "dynamic_star";
			window1.clear();
			window1.draw(speed);
			window1.display();
			while (done == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
				{
					time = 750;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::B))
				{
					time = 250;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::C))
				{
					time = 50;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
				{
					time = 20;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::E))
				{
					time = -1;
					done = true;
				}
			}
			window1.close();
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Num6))
		{
			alg = "dynamic_star_ff";
			window1.clear();
			window1.draw(speed);
			window1.display();
			while (done == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
				{
					time = 750;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::B))
				{
					time = 250;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::C))
				{
					time = 50;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
				{
					time = 20;
					done = true;
				}
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::E))
				{
					time = -1;
					done = true;
				}
			}
			window1.close();
		}

	}

	sf::RenderWindow window(sf::VideoMode(1000, 1000), "No Step On Snek!", sf::Style::Default);

	//Manually set the size of the game board
	gameBoard board = gameBoard(10, 10);
	//Case checking for board sizes which would not allow superLoop() to run
	if (board.board[0].size() % 2 != 0) {
		cout << "Please enter an even y value. Close the window and try again.";
		while (true) {

		}
	}
	std::string temp;
	temp = alg;

	board.debug();
	window.setActive(false);

	sf::Thread thread(std::bind(&renderingThread, &window, &board));
	//sf::Thread thread(&renderingThread, &window, &board);
	thread.launch();


	//this is where the window displays the game
	while (window.isOpen())
	{
		sf::Event event;
		while (window.pollEvent(event))
		{
			if (event.type == sf::Event::Closed) {
				std::cout << "StepsElapsed: " << steps << std::endl;
				//sf::sleep(sf::seconds(2));
				window.close();
			}
		}
		//debugging
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Space)) {
			//	alg = "player_input";
			bool dog = false;
			while (dog == false) {
				if (sf::Keyboard::isKeyPressed(sf::Keyboard::N)) {
					dog = true;
				}
			}
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Left))
		{
			board.key("W");
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Right))
		{
			board.key("E");
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Up))
		{
			board.key("N");
		}
		if (sf::Keyboard::isKeyPressed(sf::Keyboard::Down))
		{
			board.key("S");
		}

		//if (board.clock.getElapsedTime().asMilliseconds() > -1) {
		if (board.clock.getElapsedTime().asMilliseconds() > time) {
			board.clock.restart();
			if (game == "playing") {
				board.update();
			}

		}
		//board.update();
		steps++;
	}

	return 0;
}
