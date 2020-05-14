#include <iostream>
#include <iomanip>
#include <string>
#include <cstdlib>
#include <sstream>
#include <vector>
#include <ctime>
#include <time.h>

using namespace std;

void printVec(vector<int> someVec) {
	for (int i = 0; i < (int)someVec.size(); i++) {
		cout << someVec[i] << "\t";
	}
	cout << "\n\n";
}

vector<int> initializeVec(vector<int> vec, int arr, int n) {//10, 20000
	int pos = 0;
	int i = 1;
	vector<int> tempVec;

	for (i = 1; i <= n; i++) {
		vec.push_back(i);
	}

	for (i = 0; i < n; i++) {
		pos = rand() % (int)vec.size();
		iter_swap(vec.begin() + i, vec.begin() + pos);
	}

	for (i = 0; i < arr; i++) {
		tempVec.push_back(vec[i]);
	}
	return tempVec;
}

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
	tempSwap = vec[i + 1];
	vec[i + 1] = vec[end];
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


void heapify(vector<int>& vec, int n, int i) {
	int greatest = i;
	int left = 2 * i + 1;
	int right = 2 * i + 2;

	if (left < n && vec[left] > vec[greatest]) {
		greatest = left;
	}


	if (right < n && vec[right] > vec[greatest]) {
		greatest = right;
	}

	if (greatest != i) {
		swap(vec[i], vec[greatest]);
		heapify(vec, n, greatest);
	}
}


void heapSort(vector<int>& vec, int n) {
	for (int i = n / 2 - 1; i >= 0; i--) {
		heapify(vec, n, i);
	}
	for (int i = n - 1; i >= 0; i--) {
		swap(vec[0], vec[i]);
		heapify(vec, i, 0);
	}
}


int main() {
	vector<int> randAll;
	int nArray[3] = { 10, 50, 100 };/*100,500,1000,2000,5000,8000,10000*/
	int limit = 20000;
	int count = 0, temp = 0;

	for (int n = 0; n < 3; n++) {
		cout << "n = " << nArray[n] << endl;
		//sort by insertion sort
		cout << "Insertion sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		insertionSort(randAll, nArray[n]);
		printVec(randAll);
		randAll.clear();

		//sort by quick sort
		cout << string(3, '\n') << "Quick sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		quickSort(randAll, 0, (nArray[n] - 1));
		printVec(randAll);
		randAll.clear();

		//sort by heap sort
		cout << string(3, '\n') << "Heap sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		heapSort(randAll, nArray[n]);
		printVec(randAll);
		randAll.clear();
		

		cout<< string(5, '\n');
	} //n loop

	system("pause");
	return 0;
}