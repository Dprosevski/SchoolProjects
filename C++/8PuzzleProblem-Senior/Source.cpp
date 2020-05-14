#include <iostream>
#include <vector>
#include "Node.h"
using namespace std;

int main(void) {
	int initial[3][3];//initial state
	/*{
		{1,2,3},
		{4,5,6},
		{0,7,8}
	};*/
	cout << "Enter your puzzle" << endl;
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			cout << "Enter element: [" << i << "][" << j << "]: ";
			cin >> initial[i][j];
		}
		cout << "\n";
	}
	/************************************************************************************************************************************/
	bool runAstar = true; //MODIFY THIS VARIABLE TO CHANGE SEARCH || MODIFY THIS VARIABLE TO CHANGE SEARCH ||
	/************************************************************************************************************************************/
	int done = 0, count = -1, lowestCost = 0, temp = 0; //temp vars
	vector<Node*> storeNodes;
	Node* ptrTemp;
	ptrTemp = new Node;
	ptrTemp->setBoard(initial);
	ptrTemp->setZeroPos();
	ptrTemp->setDepth(0);

	//BFS BFS BFS BFS BFS BFS BFS BFS BFS BFS BFS BFS BFS BFS BFS BFS
	if (runAstar == false) {
		cout << "Running BFS:\n\n";
		ptrTemp->expandNode();
		for (int i = 0; i < ptrTemp->children.size(); i++) {
			storeNodes.push_back(&ptrTemp->children[i]);
		}
		while (done != 1) {
			for (int i = temp; i < storeNodes.size(); i++) {
				if (storeNodes[i]->statesEqual() == true) {

					ptrTemp = storeNodes[i];
					done = 1;

				}
				temp = i + 1;
				if (done != 1) {
					storeNodes[i]->expandNode();
					for (int j = 0; j < storeNodes[i]->children.size(); j++) {
						storeNodes.push_back(&storeNodes[i]->children[j]);
					}
				}
			}
		}
		storeNodes.clear();
		while (ptrTemp != NULL) {
			storeNodes.push_back(ptrTemp);
			ptrTemp = ptrTemp->parent;
		}
		for (int i = storeNodes.size() - 1; i >= 0; i--) {
			storeNodes[i]->printBoard();
		}
	}

	//Astar Astar Astar Astar Astar Astar Astar Astar Astar Astar Astar 
	else {
		cout << "Running a A* Hamming:\n\n";
		while (done != 1) {

			if (ptrTemp->statesEqual() == true) {
				for (int j = 0; j < storeNodes.size(); j++) {
					if (ptrTemp->getCost() < storeNodes[j]->getCost()) {
						done = 1;
						count = j;
					}
					else {
						done = -1;
						count = -1;
						break;
					}
				}
			}

			if (count == -1) {
				ptrTemp->expandNode();
				for (int i = 0; i < ptrTemp->children.size(); i++) {
					storeNodes.push_back(&ptrTemp->children[i]);
				}
				for (int i = 0; i < storeNodes.size(); i++) {
					if (storeNodes[i]->getCost() < storeNodes[lowestCost]->getCost()) {
						lowestCost = i;
					}
				}
				ptrTemp = storeNodes[lowestCost];
				storeNodes.erase(storeNodes.begin() + lowestCost);
				lowestCost = 0;
			}
		}

		storeNodes.clear();
		while (ptrTemp != NULL) {
			storeNodes.push_back(ptrTemp);
			ptrTemp = ptrTemp->parent;
		}
		for (int i = storeNodes.size() - 1; i >= 0; i--) {
			storeNodes[i]->printBoard();
		}
	}
	return 0;
}