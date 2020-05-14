/*Program name: Five Crowns
Author: Dimitrije Prosevski
Date last updated: 11/12/2017
Purpose: Lab programming */

#include <cmath>
#include <iostream>
#include <string>
#include <iomanip>
#include <ctime>
#include <time.h>
#include <cstdlib>
#include <stdio.h>
#include <sstream>
#define HANDSIZE 9
#define DECKSIZE 116
#define PLAYERH 7

using namespace std;


class Card
{
public:
	int face;
	int suit;
	int cvalue;
	int value;
    string all;
    string suit1;
    string face1;
    string cvalue1;

	void set_card(int, int, int);
	void handCards();
	void conditionCards();


	// toString toString toString toString toString toString toString
        string toString() {




		switch (suit)
		{
		case 0: suit1 = "Hearts";   break;
		case 1: suit1 = "Diamonds"; break;
		case 2: suit1 = "Clubs";    break;
		case 3: suit1 = "Spades";   break;
		case 4: suit1 = "Stars";    break;
		default: suit1 = "ERROR";
		}

		switch (face)
		{
		case 0: face1 = "Three";    break;
		case 1: face1 = "Four";     break;
		case 2: face1 = "Five";     break;
		case 3: face1 = "Six";      break;
		case 4: face1 = "Seven";    break;
		case 5: face1 = "Eight";    break;
		case 6: face1 = "Nine";     break;
		case 7: face1 = "Ten";      break;
		case 8: face1 = "Jack";     break;
		case 9: face1 = "Queen";    break;
		case 10: face1 = "King";    break;
		case 11: face1 = "Joker";   break;
		default: face1 = "ERROR";
		}

		switch (cvalue)
		{                       //int values
		case 0: cvalue1 =  "03";     value = 3;    break;
		case 1: cvalue1 =  "04";     value = 4;    break;
		case 2: cvalue1 =  "05";     value = 5;    break;
		case 3: cvalue1 =  "06";     value = 6;    break;
		case 4: cvalue1 =  "07";     value = 7;    break;
		case 5: cvalue1 =  "08";     value = 8;    break;
		case 6: cvalue1 =  "09";     value = 9;    break;
		case 7: cvalue1 =  "10";    value = 10;   break;
		case 8: cvalue1 =  "11";    value = 11;   break;
		case 9: cvalue1 =  "12";    value = 12;   break;
		case 10: cvalue1 =  "13";   value = 13;   break;
		case 11: cvalue1 =  "20";   value = 20;   break;
		default: cvalue1 = "ERROR";
		}

        if (face == 11)
        {
             all = cvalue1 + " =  " + face1;
        }
        else{
		all = cvalue1 + " =  " + face1 + " of " + suit1 ;
		}
		return all;
	}
};


class Deck
{
public:
	Card deck[DECKSIZE];
};


class PlayerHand
{
public:
    Card hand[HANDSIZE];
    int summ;
    int cardValue[HANDSIZE];
};

Deck decks;

void Card::set_card(int a, int b, int c) {
	face = a;
	suit = b;
	cvalue = c;
}



const string suits[5] = { "Hearts", "Diamonds", "Clubs", "Spades", "Stars" };

const string faces[12] = { "Three", "Four", "Five", "Six", "Seven","Eight", "Nine", "Ten", "Jack", "Queen", "King", "Joker" };

string deck[116];
string *handptr = deck; //deck pointer



//Deck Deck Deck Deck Deck Deck Deck Deck Deck Deck Deck Deck Deck
void Creating_deck() {

	int i = 0, j = 0, k = 0, m = 0;
	Card card;

	for (i = 0; i<11; i++)
	{
		for (j = 0; j<5; j++)
		{
			for (m = 0; m<2; m++) {
				card.set_card(i, j, i);
				deck[k] = card.toString();
				k = k + 1;
			}
		}
	}

	//adding jokers
	for (int i = 110; i < 116; ++i)
	{
		card.set_card(11, 5, 11);
		deck[k] = card.toString();
		k = k + 1;
	}
	//deck print
	for (int i = 0; i < 116; ++i)
	{
		cout << "|"<< i+1<<"| " << deck[i].substr(4) << endl;

	}
}

//shuffle function
void shuffle() {
    srand(time(NULL));
	int k = 0;
	int l=0;
	string swap;


	for (int j = 0; j < 116; ++j)
	{
        l = rand() % 115;
		swap = deck[j];
		k = l;
		deck[j] = deck[k];
		deck[k] = swap;
	}
}

//Function for printing hands, then sorting and printing again
void Card::handCards() {

	int k = 0;
	int player;
	int Playernum = 0;
    int ncard;

	//ask how many players
	cout << "\n\n";
	cout << "The deck is shuffled! Choose the number of players (from 2 to 7): ";
	cin >> Playernum;

	//condition from 2 to 7 players
	while (Playernum < 2 || Playernum > 7)
	{
		cout << "Please choose the valid input (from 2 to 7): ";
		cin >> Playernum;
	}



        cout <<"\n\n**************HANDS************" <<endl;
//DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING DEALING
	PlayerHand hand[7];
	Card decks;

//loop for number of players and cards
	for (player = 0; player < Playernum; player++)
	{
	    cout << "\n===============================" << endl;
		cout << "*********PLAYER " << player+1 << " HAND********* " << endl;

		for (ncard = 0; ncard<HANDSIZE; ncard++)			//loop for the 9 cards
		{
            hand[player].hand[ncard].all = *(handptr + k);
            k++;
            cout << "<"<< ncard+1<<">  " << hand[player].hand[ncard].all.substr(4)<<endl;
		}
		cout << "===============================" << endl;
	}

//DUPLICATES DUPLICATES DUPLICATES DUPLICATES DUPLICATES DUPLICATES DUPLICATES DUPLICATES DUPLICATES DUPLICATES DUPLICATES
/*Duplicate loops


for (int c = 0; c < Playernum; c++){
int	temp = hand[0].hand[0].cvalue;
      for (int ncard = 0; ncard < 9; ncard++)
        {
                if(temp == hand[c].hand[ncard].cvalue)
                {
                    cout <<hand[c].hand[ncard].all.substr(6)<< " are duplicates for player " <<c << "."<<endl;
                }
            temp = hand[c].hand[ncard].cvalue;
        }
    }
*/



//press enter to shuffle for more interactiveness
	cout << "\n\n\n\nPress ENTER to SORT hands." << endl;
    cin.ignore();
	cin.get();

//SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING SORTING
cout <<"\n\n\n\n**********SORTED HANDS*********" <<endl;

for (player = 0; player < Playernum; player++) //loop for the number of players/hands
	{
		for (int ncard = 0; ncard < 9; ncard++)			//loop for the 9 cards
		{
			for (int j = 0; j < 9; j++)
            {

            	if(hand[player].hand[ncard].all.compare( hand[player].hand[j].all)<0)
            	{
            		hand[player].hand[ncard].all.swap(hand[player].hand[j].all);
            	}
            }
        }
	}

//display sorted cards
	for (player = 0; player < Playernum; player++) //loop for the number of players/hands
	{
	    cout << "\n===============================" << endl;
		cout << "*********PLAYER " << player+1 << " HAND********* " << endl;
		for (int ncard = 0; ncard < 9; ncard++)	//loop for the 9 cards
		{
            cout << "<"<< ncard+1<<">  " << hand[player].hand[ncard].all.substr(4)<<endl;
		}
		cout << "===============================" << endl;
	}




//press enter to shuffle for more interactiveness
	cout << "\n\n\n\nPress ENTER to SUMM hands." << endl;
	cin.get();

//SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING SUMMING
cout <<"\n\n\n\n**********SUMMED HANDS*********" <<endl;

    for (player = 0; player < Playernum; player++) //loop for the number of players/hands
	{
	    int h=0; // counter

	    cout << "\n===============================" << endl;
		cout << "*********PLAYER " << player+1 << " HAND********* " << endl;

		for (int ncard = 0; ncard < 9; ncard++)	//loop for the 9 cards
		{
		    for (int j = 1; j < 9; j++)
            {
                //string to int conversion, values are getting plugged into cardValue[] array
                stringstream convert(hand[player].hand[ncard].all.substr(0,2));
                convert >> hand[player].cardValue[h];
            }
            cout <<"<"<< ncard+1<<">  "  <<hand[player].cardValue[h++]<<endl;
        }


//BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK BOOK
int x=0;
int y=0;

for (int player = 0; player < Playernum; ++player)
{
    for (int x = 0; x < 9; ++x)
    {
        for (int y = x +1; y <= 9; ++y)
        {

            if( hand[player].cardValue[x] == hand[player].cardValue[y]
             && hand[player].cardValue[y] == hand[player].cardValue[y+1])
            {
                    //for more than 3 equal cards
                    //4th card
                    if (hand[player].cardValue[y] == hand[player].cardValue[y+2]){
                    hand[player].cardValue[y+2] = 0;
                    }
                    //5th card
                    if (hand[player].cardValue[y] == hand[player].cardValue[y+3]){
                    hand[player].cardValue[y+3] = 0;
                    }
                    //6th card
                    if (hand[player].cardValue[y] == hand[player].cardValue[y+4]){
                    hand[player].cardValue[y+4] = 0;
                    }
                    //7th card
                    if (hand[player].cardValue[y] == hand[player].cardValue[y+5]){
                    hand[player].cardValue[y+5] = 0;
                    }
                    //8th card
                    if (hand[player].cardValue[y] == hand[player].cardValue[y+6]){
                    hand[player].cardValue[y+6] = 0;
                    }
                    //9th card
                    if (hand[player].cardValue[y] == hand[player].cardValue[y+7]){
                    hand[player].cardValue[y+7] = 0;
                    }

            hand[player].cardValue[x] = 0;    //1st card
            hand[player].cardValue[y] = 0;     //2nd card
            hand[player].cardValue[y+1] = 0;   //3rd card
            }
        }
    }
}

            //summation of all cards, summ and cardValue declared in PlayerHand class
            hand[player].summ =
             hand[player].cardValue[0]
            +hand[player].cardValue[1]
            +hand[player].cardValue[2]
            +hand[player].cardValue[3]
            +hand[player].cardValue[4]
            +hand[player].cardValue[5]
            +hand[player].cardValue[6]
            +hand[player].cardValue[7]
            +hand[player].cardValue[8];

        cout <<"    *" << hand[player].summ << "* = Total for player " << player +1<< "." <<endl; //total for the player

		cout << "===============================" << endl;
	}

//Proclaiming the winner
int i=0;
int winp=0;                    //player count
int smallestValue = hand[0].summ;   //summ temp

	for (i=0; i < Playernum; i++){

        if (hand[i].summ < smallestValue){
            smallestValue = hand[i].summ;
            winp=i;
        }
	}
	cout << "\n\n***************THE WINNER OF THE GAME IS PLAYER "  <<winp+1<< " with the score of "<<smallestValue<< "***************" <<endl;
}




//MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN
int main() {

	cout << "Deck contains 116 cards printed below:\n" << endl;

	Creating_deck();
	shuffle();

	//press enter to shuffle for more interactiveness
	cout << "\nPress ENTER to shuffle the deck." << endl;
	cin.get();

	cout << "\n\n*********SHUFFLED CARDS*********\n\n";


	for (int i = 0; i < 116; ++i)
	{
		cout << "|"<< i+1<<"| " << deck[i].substr(4) << endl;
	}

	//object hand
	Card Hand;
	Hand.handCards();



    cout <<"\n\n\n";
    system ("pause");
	return 0;


}

