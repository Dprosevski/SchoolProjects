#include <iostream>
#include <iomanip>
#include <string>
#include <cstdlib>
#include <sstream>
#include <vector>
#include <ctime>
#include <time.h>

using namespace std;

void insertionSort(vector<int>& vec, int n) {
	int i, j, val;
	for (i = 1; i < n; i++) {
		val = vec[i];
		j = i - 1;

		while (j >= 0 && vec[j] > val) {
			vec[j + 1] = vec[j];
			j = j - 1;
		}
		vec[j + 1] = val;
	}
}

int partition(vector<int>& vec, int front, int end) {
	int temp = vec[end];
	int tempSwap = 0;
	int i = (front - 1);

	for (int j = front; j < end; j++) {
		if (vec[j] <= temp) {
			i++;
			tempSwap = vec[j];
			vec[j] = vec[i];
			vec[i] = tempSwap;
		}
	}
	tempSwap = vec[front];
	vec[front] = vec[end];
	vec[end] = tempSwap;
	return (i + 1);
}

void quickSort(vector<int>& vec, int front, int end) {
	if (front < end) {
		int part = partition(vec, front, end);

		quickSort(vec, front, part - 1);
		quickSort(vec, part + 1, end);
	}
}



void printVec(vector<int> someVec) {
	for (int i = 0; i < (int)someVec.size(); i++) {
		cout << someVec[i] << "\t";
	}
	cout << "\n\n";
}

int main() {
	vector<int> randAll;
	vector<int> result;
	int nArray[2] = {10} ;/*100,500,1000,2000,5000,8000,10000*/
	int pos = 0;

	for (int n = 0; n < 1; n++) {
		for (int i = 1; i <= nArray[n]; i++) {
			randAll.push_back(i);
		}

		for (int i = 0; i < (int)randAll.size(); i++) {
			pos = rand() % (int)randAll.size();
			iter_swap(randAll.begin() + i, randAll.begin() + pos);
		}


		//sort by insertion and store into result
		printVec(randAll);
		insertionSort(randAll, nArray[n]);
		printVec(randAll);
		randAll.clear();

		for (int i = 1; i <= nArray[n]; i++) {
			randAll.push_back(i);
		}
		cout << string(3, '\n');
		//sort by quick sort
		printVec(randAll);
		quickSort(randAll, 0, 9);
		printVec(randAll);
		result.clear();

		randAll.clear();
		cout<< string(5, '\n');
	} //n loop

	system("pause");
	return 0;
}