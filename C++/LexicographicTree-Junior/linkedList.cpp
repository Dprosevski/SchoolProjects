#include "linkedList.h"
#include <cstdlib>
#include <iostream>
#include <fstream>
#include "bTree.h"

using namespace std;

LinkedList::LinkedList(){
    h = NULL; //head
    c = NULL; //current
    t = NULL; //tail
}

void LinkedList::addN(int aData){
    nPtr n = new node;
    n->next = NULL;
    n->data = aData;

    if(h != NULL){
        c = h;
        while(c->next !=NULL){
            c = c->next;
        }
        c->next = n;
    }
    else{
        h = n;
    }
}

void LinkedList::print(ofstream& outFile){
    c = h;
    while(c != NULL){
        cout<< c->data << "\t"; //output console
        outFile<< c->data << "\t"; //output file
        c = c->next;
    }
    cout<<endl;
    outFile<<endl;
}
