#pragma once
#include <vector>
using namespace std;

class Node {
private:
	Node * next; //next node
	int goalState[3][3] = { //goal state
		{ 1, 2, 3 }, 
		{ 4, 5, 6 }, 
		{ 7, 8, 0 }
	};
	int board[3][3]; //board of the node
	int zero[2]; //zero's x and y position
	int cost; //cost to get to the node
	int depth; //level or depth of the node
	
public :
	Node* parent; //parent pointer
	Node successor(); //successor of the parent as the best choice
	vector<Node> children; //all the possible children of the parent
	//set and get methods
	void modifyZeros(int x, int y); //modifies zeros of the node
	void setZeroPos(); //find/set zeros
	void setBoard(int myBoard[][3]);
	int* getBoard();
	void setCost();
	int getCost();
	void setDepth(int depthLvl);
	int getDepth();

	void copyNode(int incr, char pos); //copy/clones the node from parent to child
	void expandNode(); //creates children of the current node
	bool statesEqual(); //compares states of the nodes
	void printBoard(); //print board of the node
};