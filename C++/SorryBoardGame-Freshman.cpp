#include <time.h>
#include <cstdlib>  
#include <cmath>
#include <stdafx.h>
#include <iostream>
#include <string>
#include <iomanip>
using namespace std;

//First rolling
int first_roll()
{
	srand(time(NULL));
	int  seed;
	int M = 1, N = 6;
	int randval1 = rand() % (N - M + 1) + M;
	int randval2 = rand() % (N - M + 1) + M;
	cout << "\n First Roll : " << randval1 << " and " << randval2 << endl;
	cout << " Player has to roll a double to enter the board. " << endl;
	cout << "------------------------------------------------";

	if (randval1 == randval2)
	{
		return 1;
	}
	else
	{
		return 0;
	}

}
//Rolling die function
int roll()
{

	srand(time(NULL));
	int  seed;
	int M = 1, N = 6;
	int randval1 = rand() % (N - M + 1) + M;
	int randval2 = rand() % (N - M + 1) + M;

	int randValSum = randval1 + randval2;
	cout << "\nDice have rolled " << randval1 << " and " << randval2 << ". TOTAL ROLL IS " << randValSum << endl;
	cout << "------------------------------------------------------- \n";


	switch (randValSum)
	{
	case 4:
		randValSum = -1; break;

	case 7:
		randValSum = 50; break;

	case 11:
		randValSum = -50; break;

	case 12:
		randValSum = 12; break;
	}
	return randValSum;
}
//STRUCTURES
struct Players
{
	int p_num;
	int position;
	int start;
};

void reset(int numberofplayer, struct Players a[])
{

	for (int j = 0; j < numberofplayer; j++) {
		a[j].start = 1;
		a[j].position = 0;
	}
}


// *********MAIN**********
int main()
{
	string pos_array[50];

	struct Players plr[4] =
	{
		plr[1] = { 1, 0 , 1 },
		plr[2] = { 2, 0 , 1 },
		plr[3] = { 3, 0 , 1 },
		plr[4] = { 4, 0 , 1 }
	};

	int np;

	cout << "**********WELCOME***********" << endl;
	cout << "***********SORRY************" << endl;
	cout << "Enter the number of players: " << endl;
	cin >> np;
	cout << "You have created a game for " << np << " players. " << endl;
	while (np > 4) {
		cout << "Game can be played with min 2 and max 4 players! Try again: " << endl;
		cin >> np;
		cin.ignore();
	}


	//assign numbers to the players
	for (int i = 0; i < np; i++) {
		plr[i].p_num = i + 1;
	}


	while (int game = 1) {


		// each player's turn
		for (int i = 0; i < np; i++) {
			cout << "\n\n\n\n---------------------------" << endl;
			cout << "PLAYER " << plr[i].p_num << " TURN TO ROLL" << endl;

			cout << "Press Enter to roll dice: " << endl;

			cin.get();

			//TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE TABLE 
			{
				cout << (char)201;
				//top lines
				for (int i = 0; i < 50; i++)
				{
					cout << (char)205 << (char)203;

				}

				cout << (char)205 << (char)187 << endl;

				//vertical lines in between

				for (int i = 0; i < 50; i++)
				{
					cout << (char)186 << " ";


					if (plr[0].position == i) {
						cout << (char)186 << "1";
					}
					else if (plr[1].position == i) {
						cout << (char)186 << "2";
					}
					else if (plr[2].position == i) {
						cout << (char)186 << "3";
					}
					if (plr[3].position == i) {
						cout << (char)186 << "4";
					}
				}
				//bottom left corner
				cout << " " << endl;
				cout << (char)200;

				//bottom lines
				for (int i = 0; i < 50; i++)
				{
					cout << (char)205 << (char)202;
				}
				cout << (char)205;
				cout << (char)188 << endl;

			}

			//if first roll
			if (plr[i].start == 1) {

				int firstroll = first_roll();

				if (firstroll == 1) {
					int newroll = roll();
					plr[i].start = 0;

					if (newroll == 4) {
						plr[i].position = 1;
					}
					else if (newroll == 50) {
						//switch with leader
					}
					else if (newroll == -50) {
						plr[i].position = 1;
					}
					else if (newroll == 12) {
						plr[i].position = 1;
					}
					else {
						plr[i].position = plr[i].position + newroll;
					}
				}
				else if (firstroll == 0) {
					plr[i].position = 1;
				}

			}

			//regular roll
			else if (plr[i].start == 0) {

				int newroll = roll();

				if (newroll == 4) {
					plr[i].position -= 1;
				}
				else if (newroll == 7) {
					//switch with leader
				}
				else if (newroll == -11) {
					//switch with looser
				}
				else if (newroll == 12) {
					plr[i].position = 0;

				}

				if (plr[i].position + newroll > 50) {
					cout << "Player " << plr[i].p_num << " has to roll an exact number.";
				}
				else if (plr[i].position + newroll == 50) {
					cout << "Congratulations, Player " << plr[i].p_num << " has won the game!!! " << endl;
					game = 0;
					cout << "Would you like to play again?  (press 1 for yes / press 0 for no) ";
					cin >> game;
					reset(np, plr);
				}
				else {
					plr[i].position = plr[i].position + newroll;
				}
			}


			//Players with same position
			{
				if (i == 0 && plr[i].position == plr[i + 1].position) {
					plr[i + 1].position = 1;
				}
				else if (i == 0 && plr[i].position == plr[i + 2].position) {
					plr[i + 2].position = 1;
				}
				else if (i == 0 && plr[i].position == plr[i + 3].position) {
					plr[i + 3].position = 1;
				}

				else	if (i == 1 && plr[i].position == plr[i + 1].position) {
					plr[i + 1].position = 1;
				}
				else if (i == 1 && plr[i].position == plr[i + 2].position) {
					plr[i + 2].position = 1;
				}
				else if (i == 1 && plr[i].position == plr[i - 1].position) {
					plr[i - 1].position = 1;
				}

				else	if (i == 2 && plr[i].position == plr[i - 1].position) {
					plr[i - 1].position = 1;
				}
				else if (i == 2 && plr[i].position == plr[i - 2].position) {
					plr[i - 2].position = 1;
				}
				else if (i == 2 && plr[i].position == plr[i + 1].position) {
					plr[i + 1].position = 1;
				}

				else	if (i == 3 && plr[i].position == plr[i - 1].position) {
					plr[i - 1].position = 1;
				}
				else if (i == 3 && plr[i].position == plr[i - 2].position) {
					plr[i - 2].position = 1;
				}
				else if (i == 3 && plr[i].position == plr[i - 3].position) {
					plr[i - 3].position = 1;
				}

				else {
					pos_array[plr[i].position] = plr[i].p_num;
				}

			}


			cout << "\n Player " << plr[i].p_num << " >>> position  " << plr[i].position << endl;
		}

	}

	system("pause");
	return 0;
}





