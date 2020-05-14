#include <iostream>
#include <iomanip>
#include <string>
#include <cstdlib>
#include <sstream>
#include <vector>
#include <ctime>
#include <time.h>
#include <chrono> 

using namespace std;
using namespace chrono;

void printVec(vector<int> someVec) {
	int vSize = (int)someVec.size();

	if (vSize <= 100) {
		for (int i = 0; i < vSize; i++) {
			cout << someVec[i] << "\t";
		}
		cout << "\n\n";
	}
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

void insertionSort(vector<int> &vec, int n) {
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

int partition(vector<int> &vec, int front, int end) {
	int temp = vec[end];
	int i = 0, tempSwap = 0;
	i = front - 1;

	for (int j = front; j < end-1; j++) {
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

void quickSort(vector<int> &vec, int front, int end) {
	if (front < end) {
		int part = partition(vec, front, end);

		quickSort(vec, front, part - 1);
		quickSort(vec, part + 1, end);
	}
}


void heapify(vector<int> &vec, int n, int i) {
	int greatest = i;
	int left = (2*i) + 1;
	int right = (2*i) + 2;

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

void heapSort(vector<int> &vec, int n) {
	for (int i = n / 2 - 1; i >= 0; i--) {
		heapify(vec, n, i);
	}
	for (int i = n - 1; i >= 0; i--) {
		swap(vec[0], vec[i]);
		heapify(vec, i, 0);
	}
}



void merge(vector<int> &vec, int subl, int mid, int subr) {
	int i, j, k;
	int n1 = mid - subl + 1;
	int n2 = subr - mid;
	vector<int> leftVec, rightVec;

	for (i = 0; i < n1; i++) {
		leftVec.push_back(vec[subl + i]);
	}
	for (j = 0; j < n2; j++) {
		rightVec.push_back(vec[mid + 1 + j]);
	}

	i = 0;
	j = 0;
	k = subl;
	while (i < n1 && j < n2) {
		if (leftVec[i] <= rightVec[j]) {
			vec[k++] = leftVec[i++];
		}
		else {
			vec[k++] = rightVec[j++];
		}
	}

	while (i < n1) {
		vec[k++] = leftVec[i++];
	}

	while (j < n2) {
		vec[k++] = rightVec[j++];
	}
}

void mergeSort(vector<int> &vec, int subl, int subr) {
	if (subl < subr) {
		int mid = subl + (subr - subl) / 2;
		mergeSort(vec, subl, mid);
		mergeSort(vec, mid + 1, subr);
		merge(vec, subl, mid, subr);
	}
}

int main() {
	vector<int> randAll;
	const int repeats = 1;
	int nArray[repeats] = { 100 };   /*{100, 500, 1000, 2000, 5000, 8000, 10000};*/
	int limit = 20000;
	int count = 0, temp = 0;
	auto t1 = high_resolution_clock::now();
	auto t2 = high_resolution_clock::now();
	auto t = duration_cast<microseconds>(t2 - t1);

	for (int n = 0; n < repeats; n++) {
		cout << "Printing the output only if n = 100 for clarity purposes. \nn = " << nArray[n] << endl;

		//insertion sort
		cout << "Insertion sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		t1 = high_resolution_clock::now();
		insertionSort(randAll, nArray[n]);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		printVec(randAll);
		cout << "It takes " << t.count() << " microseconds to execute the insertion sort function on unsorted input." << endl;
		t1 = high_resolution_clock::now();
		insertionSort(randAll, nArray[n]);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		cout << "It takes " << t.count() << " microseconds to execute the insertion sort function on sorted input." << endl;
		randAll.clear();

		//quick sort
		cout << string(3, '\n') << "Quick sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		t1 = high_resolution_clock::now();
		quickSort(randAll, 0, nArray[n]-1);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		printVec(randAll);
		cout << "It takes " << t.count() << " microseconds to execute the quick sort function on unsorted input." << endl;
		t1 = high_resolution_clock::now();
		quickSort(randAll, 0, nArray[n]-1);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		cout << "It takes " << t.count() << " microseconds to execute the quick sort function on sorted input." << endl;
		randAll.clear();

		//heap sort
		cout << string(3, '\n') << "Heap sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		t1 = high_resolution_clock::now();
		heapSort(randAll, nArray[n]);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		printVec(randAll);
		cout << "It takes " << t.count() << " microseconds to execute the heap sort function on unsorted input." << endl;
		t1 = high_resolution_clock::now();
		heapSort(randAll, nArray[n]);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		cout << "It takes " << t.count() << " microseconds to execute the heap sort function on sorted input." << endl;
		randAll.clear();
		
		//merge sort
		cout << string(3, '\n') << "Merge sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		t1 = high_resolution_clock::now();
		mergeSort(randAll, 0, nArray[n] - 1);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		printVec(randAll);
		cout << "It takes " << t.count() << " microseconds to execute the merge sort function on unsorted input." << endl;
		t1 = high_resolution_clock::now();
		mergeSort(randAll, 0, nArray[n] - 1);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		cout << "It takes " << t.count() << " microseconds to execute the merge sort function on sorted input." << endl;
		randAll.clear();

		cout<< string(5, '\n');
	} //n loop

	system("pause");
	return 0;
}