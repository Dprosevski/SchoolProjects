#ifndef LINKEDLIST_H
#define LINKEDLIST_H
#include <fstream>

using namespace std;

class LinkedList{
public:
    struct node{
        int data;
        node* next;
    };

    typedef struct node* nPtr;
    nPtr h;
    nPtr c;
    nPtr t;

    LinkedList();
    void addN(int aData);
    void print(ofstream& outFile);
};
#endif
