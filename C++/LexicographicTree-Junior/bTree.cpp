#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <string>
#include <fstream>
#include "bTree.h"
#include "linkedList.h"

using namespace std;

BTree::BTree(){
	root = NULL;
}

BTree::node* BTree::cLeaf(string word,int line){
	node* n = new node;
	n->word = word;
	n->myList.addN(line);
	n->left = NULL;
	n->right = NULL;
	return n;
}

//public functions
void BTree::addL(string word,int line){
	addLP(line,word, root);
}

void BTree::printT(ofstream& outFile){
	printTP(root, outFile);
}

//private functions
void BTree::addLP(int line,string word, node* Ptr){
	if(root == NULL){
		root = cLeaf(word,line);
	}

	else if(word < Ptr->word){
		if(Ptr->left != NULL){
			addLP(line,word, Ptr->left);
		}
		else{
			Ptr->left = cLeaf(word,line);
		}
	}

	else if(word > Ptr->word){
		if(Ptr->right != NULL){
			addLP(line,word, Ptr->right);
		}
		else{
			Ptr->right = cLeaf(word,line);
		}
	}

	else{
	    Ptr->myList.addN(line);
	}
}

void BTree::printTP(node* Ptr, ofstream& outFile){
	if(root != NULL){
		if(Ptr->left != NULL){
			printTP(Ptr->left, outFile);
		}

		cout<< setw(10) << Ptr->word<< "\t"; //print word to console
		outFile<< setw(10) << Ptr->word << "\t"; //print word to the file
        Ptr->myList.print(outFile);

		if(Ptr->right != NULL){
			printTP(Ptr->right, outFile);
		}
	}
	else{
		cout<< "Empty."<<endl;
	}
}
