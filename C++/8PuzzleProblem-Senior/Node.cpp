#include "Node.h"
#include <vector>
#include <iostream>
using namespace std;

//modify zeros
void Node::modifyZeros(int x, int y) {
	this->board[this->zero[0]][this->zero[1]] = this->board[x][y];
	this->zero[0] = x;
	this->zero[1] = y;
	this->board[x][y] = 0;
}

//seto zeroPos
void Node::setZeroPos() {
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			if (this->board[i][j] == 0) {
				this->zero[0] = i;
				this->zero[1] = j;
				break;
			}
		}
	}
}

//set Board
void Node::setBoard(int myBoard[][3]) {
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			this->board[i][j] = myBoard[i][j];
		}
	}
}

//get Board
int* Node::getBoard() {
	return *this->board;
}

//set Cost
void Node::setCost() {
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			if (this->board[i][j] != goalState[i][j] && this->board[i][j] != 0) {
				this->cost++;
			}
		}
	}
	this->cost = this->cost + this->depth;
}

//get Cost
int Node::getCost(){
	return this->cost;
}

//set Depth
void Node::setDepth(int depthLvl) {
	this->depth = depthLvl;
}

//get Depth
int Node::getDepth(){
	return this->depth;
}

//Copy the parent node, incr var is the value to add or subtract, pos variable is x or y position
void Node::copyNode(int incr, char pos) {
	this->next->setDepth(this->depth + 1);
	this->next->setBoard(this->board);
	this->next->parent = this;
	this->next->setZeroPos();
	if (pos == 'x') //if pos is x
		this->next->modifyZeros(this->zero[0] + incr, this->zero[1]);
	else //if pos is y
		this->next->modifyZeros(this->zero[0], this->zero[1] + incr);
	this->next->setCost();
}


void Node::expandNode() {
	if (this->zero[1] - 1 >= 0) {
		this->next = new Node; //new next node
		this->copyNode(-1, 'y'); //call cloning
		this->children.push_back(*this->next); //push to children vector
		delete this->next; //deletes next
	}
	if (this->zero[1] + 1 < 3) {
		this->next = new Node;
		this->copyNode(1, 'y');
		this->children.push_back(*this->next);
		delete this->next;
	}
	if (this->zero[0] - 1 >= 0) {
		this->next = new Node;
		this->copyNode(-1, 'x');
		this->children.push_back(*this->next);
		delete this->next;
	}
	if (this->zero[0] + 1 < 3) {
		this->next = new Node;
		this->copyNode(1, 'x');
		this->children.push_back(*this->next);
		delete this->next;
	}
}

//min value of the cost chosen as successor
Node Node::successor() {
	int minVal = 0;
	for (int i = 0; i < this->children.size(); i++) {
		if (children[i].getCost() <= children[minVal].getCost()) {
			minVal = i;
		}
	}
	return children[minVal];
}

//check to see if states are equal, return false if difference spotted
bool Node::statesEqual() {
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			if (this->board[i][j] != this->goalState[i][j]) {
				return false;
			}
		}
	}
	return true;
}

//print the board of the node
void Node::printBoard() {
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			if(this->board[i][j] != 0)
			cout << this->board[i][j] << " ";
			else {
				cout << "- ";//print dash if zero
			}
		}
		cout << endl;
	}
	cout << "\n\n\n";
}