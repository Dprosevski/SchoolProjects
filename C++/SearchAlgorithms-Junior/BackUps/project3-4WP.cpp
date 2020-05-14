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

vector<int> initializeVec(vector<int> vec, int arr, int n) {
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
			j--;
		}
		vec[j + 1] = val;
	}
}

int partition(vector<int> &vec, int front, int end) {
	int temp = vec[front];
	int i = 0, tempSwap = 0;
	i = front;

	for (int j = front + 1; j < end; j++) {
		if (vec[j] <= temp) {
			i++;
			tempSwap = vec[j];
			vec[j] = vec[i];
			vec[i] = tempSwap;
		}
	}
	tempSwap = vec[i];
	vec[i] = vec[front];
	vec[front] = tempSwap;
	return i;
}

void quickSort(vector<int> &vec, int front, int end) {
	if (front < end) {
		int part = partition(vec, front, end);
		quickSort(vec, front, part);
		quickSort(vec, part + 1, end);
	}
}

void heapify(vector<int> &vec, int n, int i) {
	int tempSwap = 0, greatest = i;
	int left = (2 * i) + 1;
	int right = (2 * i) + 2; 

	if ((left < n) && (vec[left] > vec[greatest])) {
		greatest = left;
	}

	if ((right < n) && (vec[right] > vec[greatest])) {
		greatest = right;
	}

	if (greatest != i) {
		tempSwap = vec[i];
		vec[i] = vec[greatest];
		vec[greatest] = tempSwap;
		heapify(vec, n, greatest);
	}
}

void heapSort(vector<int> &vec, int n) {
	int tempSwap = 0;
	for (int i = n / 2 - 1; i >= 0; i--) {
		heapify(vec, n, i);
	}
	for (int i = n - 1; i >= 0; i--) {
		tempSwap = vec[0];
		vec[0] = vec[i];
		vec[i] = tempSwap;
		heapify(vec, i, 0);
	}
}

void merge(vector<int> &vec, int subl, int mid, int subr) {
	vector<int> leftVec, rightVec; 
	int i, j, k;
	int temp1 = mid - subl + 1;
	int temp2 = subr - mid;
	
	for (i = 0; i < temp1; i++) {
		leftVec.push_back(vec[subl + i]);
	}
	for (j = 0; j < temp2; j++) {
		rightVec.push_back(vec[mid + 1 + j]);
	}

	i = 0;
	j = 0;
	k = subl;
	while (i < temp1 && j < temp2) {
		if (leftVec[i] <= rightVec[j]) {
			vec[k++] = leftVec[i++];
		}
		else {
			vec[k++] = rightVec[j++];
		}
	}

	while (i < temp1) {
		vec[k++] = leftVec[i++];
	}

	while (j < temp2) {
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
	const int repeats = 2;
	int nArray[repeats] = { 100, 500 };   /*{100, 500, 1000, 2000, 5000, 8000, 10000};*/
	int limit = 20000;
	int count = 0, temp = 0;
	auto t1 = high_resolution_clock::now();
	auto t2 = high_resolution_clock::now();
	auto t = duration_cast<microseconds>(t2 - t1);

	for (int n = 0; n < repeats; n++) {
		if (nArray[n] == 100)
			cout << "Printing the output only if n = 100 to check the correctness of the algorithm. " <<
			"\nFirst block of numbers is before sorting, second block is after sorting" << endl;

		//insertion sort
		cout << "\nn = " << nArray[n] << endl <<  string(90, '=') << "\nInsertion sort\n";
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
		cout << "\n\nQuick sort\n";
		randAll = initializeVec(randAll, nArray[n], limit);
		printVec(randAll);
		t1 = high_resolution_clock::now();
		quickSort(randAll, 0, nArray[n]);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		printVec(randAll);
		cout << "It takes " << t.count() << " microseconds to execute the quick sort function on unsorted input." << endl;
		t1 = high_resolution_clock::now();
		quickSort(randAll, 0, nArray[n]);
		t2 = high_resolution_clock::now();
		t = duration_cast<microseconds>(t2 - t1);
		cout << "It takes " << t.count() << " microseconds to execute the quick sort function on sorted input." << endl;
		randAll.clear();

		//heap sort
		cout << "\n\nHeap sort\n";
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
		cout << "\n\nMerge sort\n";
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

		cout << string(5, '\n');
	} //n loop

	system("pause");
	return 0;
}