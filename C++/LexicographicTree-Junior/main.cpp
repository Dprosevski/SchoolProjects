#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <cstdlib>
#include <sstream>
#include "bTree.h"
#include "linkedList.h"

using namespace std;

int main() {
    BTree myTree[2];
    //loop both files
    for(int loop = 0; loop < 2; loop++){

    ifstream inFile;
    string fileName;
    string line;
    string word;
    int lineCount = 0;
    char temp1;
    char temp2;
    int tempInt1;
    int tempInt2;
    int limit = 10;

    if (loop == 0){
        myTree[loop];
        fileName = "test1.txt"; //to run the first file
    }
    if (loop == 1){
        myTree[loop];
        fileName = "test2.txt"; //to run the second file
    }

    inFile.open(fileName);
    if (inFile.is_open()) {
        cout<<"Text " << loop+1 << ":\n\n"; //print the text
        while(getline(inFile, line)){ //separate by new lines
            stringstream ss(line);
            cout << "Line " << lineCount+1 << ": " <<line <<endl;

            while(getline(ss, word, ' ')){          //separate lines by words
                                                    //get the first char of the word if its ASCII is within range of signs or numbers make it break
                temp1 = word[0];                    //get the first char of the word
                tempInt1 = int(temp1);              //convert it to ASCII
                if(tempInt1 > 32 && tempInt1 < 64){ //all the hard-coded digits are from ASCII table
                    break;                          //if ASCII char is number or a sign ignore the word
                }
                //get the last char of the word if its ASCII is within range of signs or numbers make it break
                temp2 = word[word.length()-1];
                tempInt2 = int(temp2);
                if(tempInt2 > 32 && tempInt2 < 48 || tempInt2 > 57 && tempInt2 < 64){
                    word = word.substr(0,word.length()-1);
                }
                word = word.substr(0, limit); //store words into array and limit to 10
                myTree[loop].addL(word,lineCount+1); //add the word and the number of the line
            }
            lineCount++;
        }
    }
    ofstream outFile;
    outFile.open("output.txt", std::ios_base::app); //append the text to the output file

    cout<<"\n\n";
    outFile<<"\n\n";
    myTree[loop].printT(outFile); //print the tree and link list for each file

    cout << string(5, '\n'); //space 5 new lines for clarity
    outFile.close(); //close output file
    inFile.close(); //close input file
    } //end of program loop

    system("pause");
    return 0;
}
