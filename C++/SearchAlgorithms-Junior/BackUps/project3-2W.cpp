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
	int i = 0, tempSwap = 0;
	i = front - 1;

	for (int j = front; j < end; j++) {
		if (vec[j] <= temp) {
			i++;
			tempSwap = vec[j];
			vec[j] = vec[i];
			vec[i] = tempSwap;
		}
	}
	tempSwap = vec[i+1];
	vec[i+1] = vec[end];
	vec[end] = tempSwap;
	return i + 1;
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

vector<int> initializeVec(vector<int> vec, int arr, int n) {
	int pos = 0;
	int i = 1;
		for (i = 1; i <= arr; i++) {
			vec.push_back(i);
		}

		for (i = 0; i < (int)vec.size(); i++) {
			pos = rand() % (int)vec.size();
			iter_swap(vec.begin() + i, vec.begin() + pos);
		}
		return vec;
}

int main() {
	vector<int> randAll;
	vector<int> result;
	int nArray[2] = {10} ;/*100,500,1000,2000,5000,8000,10000*/
	
	for (int n = 0; n < 1; n++) {
		//sort by insertion and store into result
		randAll = initializeVec(randAll, nArray[n], n);
		printVec(randAll);
		insertionSort(randAll, nArray[n]);
		printVec(randAll);
		randAll.clear();

		//sort by quick sort
		cout << string(3, '\n');
		randAll = initializeVec(randAll, nArray[n], n);
		printVec(randAll);
		quickSort(randAll, 0, nArray[n]-1);
		printVec(randAll);

		randAll.clear();
		cout<< string(5, '\n');
	} //n loop

	system("pause");
	return 0;
}