#ifndef BTREE_H
#define BTREE_H
#include <cstdlib>
#include <iostream>
#include <string>
#include <fstream>
#include "linkedList.h"

using namespace std;

class BTree{
    private:
        struct node{ //structure
            string word;
            LinkedList myList; //connect to link list
            node* left;
            node* right;
        };

        node* root;
        void addLP(int,string word, node* Ptr);
        void printTP(node* Ptr, ofstream&);

    public:
        BTree(); //constructor
        node * cLeaf(string word,int); //create leaf and pass the word as key and line number for the LL
        void addL(string word,int); //add leaf function
        void printT(ofstream&); //print tree function

};
#endif
