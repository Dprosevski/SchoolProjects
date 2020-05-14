/*Program name: Sort Algorithms
Author: Dimitrije Prosevski
Date last updated: 04/11/2019
Purpose: Third project 362*/

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

	if (vSize == 100) { //print only if size = 100
		for (int i = 0; i < vSize; i++) {
			cout << someVec[i] << "\t";
		}
		cout << "\n\n";
	}
}

vector<int> initializeVec(vector<int> vec, int arr, int lim) {
	int pos = 0;
	int i = 1;
	vector<int> tempVec;
	//push 1 to 20000 to a vector
	for (i = 1; i <= lim; i++) {
		vec.push_back(i);
	}
	//iter swap random positions
	for (i = 0; i < lim; i++) {
		pos = rand() % (int)vec.size();
		iter_swap(vec.begin() + i, vec.begin() + pos);
	}
	//take only the first arr values and store into temp vec that gets returned
	for (i = 0; i < arr; i++) {
		tempVec.push_back(vec[i]);
	}
	return tempVec;
}

void insertionSort(vector<int> &vec, int n) {
	int i, j, temp;
	for (i = 1; i < n; i++) {
		temp = vec[i];
		j = i - 1;
		//shift the positins to the right
		while (j >= 0 && vec[j] > temp) {
			vec[j + 1] = vec[j--];
		}
		vec[++j] = temp;
	}
}

int partition(vector<int> &vec, int front, int end) {
	int temp = vec[front]; //pivot first element
	int i = 0, tempSwap = 0;
	i = front;
	//loop and swap if current value <= pivot
	for (int j = front + 1; j < end; j++) {
		if (vec[j] <= temp) {
			i++;
			//swap
			tempSwap = vec[j];
			vec[j] = vec[i];
			vec[i] = tempSwap;
		}
	}
	//swap
	tempSwap = vec[i];
	vec[i] = vec[front];
	vec[front] = tempSwap;
	return i;
}

void quickSort(vector<int> &vec, int front, int end) {
	if (front < end) {
		int part = partition(vec, front, end); //partition call
		quickSort(vec, front, part); //recursive call for before partition
		quickSort(vec, part + 1, end);  //recursive call for after the partition
	}
}

void heapify(vector<int> &vec, int j, int i) {
	//using vector to imitate the tree
	int tempSwap = 0, parent = i;
	int left = (2 * i) + 1; //left child
	int right = (2 * i) + 2; //right child
	//left child > root
	if ((left < j) && (vec[left] > vec[parent])) {
		parent = left;
	}
	//right child > root
	if ((right < j) && (vec[right] > vec[parent])) {
		parent = right;
	}
	//if not root swap parent and heapify recursively
	if (parent != i) {
		tempSwap = vec[i];
		vec[i] = vec[parent];
		vec[parent] = tempSwap;
		heapify(vec, j, parent);
	}
}

void heapSort(vector<int> &vec, int j) {
	int tempSwap = 0;
	//building the heap
	for (int i = j / 2 - 1; i >= 0; i--) {
		heapify(vec, j, i);
	}
	//swaping current root with end and max heapify
	for (int i = j - 1; i >= 0; i--) {
		tempSwap = vec[0];
		vec[0] = vec[i];
		vec[i] = tempSwap;
		heapify(vec, i, 0);
	}
}

void merge(vector<int> &vec, int subl, int mid, int subr) {
	vector<int> leftVec, rightVec; //left and right vectors
	int temp1 = mid - subl + 1;
	int temp2 = subr - mid;
	//pushing the data to the vectors
	for (int i = 0; i < temp1; i++) {
		leftVec.push_back(vec[subl + i]);
	}
	for (int j = 0; j < temp2; j++) {
		rightVec.push_back(vec[mid + 1 + j]);
	}

	int i = 0, j = 0, k = subl;
	while (i < temp1 && j < temp2) {
		if (leftVec[i] <= rightVec[j]) {
			vec[k++] = leftVec[i++];
		}
		else {
			vec[k++] = rightVec[j++];
		}
	}
	//get the rest of the elements
	while (i < temp1) {
		vec[k++] = leftVec[i++];
	}
	while (j < temp2) {
		vec[k++] = rightVec[j++];
	}
}

void mergeSort(vector<int> &vec, int subl, int subr) {
	if (subl < subr) {
		int mid = subl + (subr - subl) / 2; //get midpoint
		mergeSort(vec, subl, mid); //sort fist half recursively
		mergeSort(vec, mid + 1, subr); //sort second half recursively
		merge(vec, subl, mid, subr); //merging
	}
}

int main() {
	srand(time(NULL));
	vector<int> randAll; //vector to hold rand values
	const int repeats = 7;
	int nArray[repeats] = {100, 500, 1000, 2000, 5000, 8000, 10000};//n size of random numbers to generate
	int limit = 20000; //max number is 20,0000
	int count = 0, temp = 0;

	//initialize t1 as initial time, t2 as final time, and t as their difference
	auto t1 = high_resolution_clock::now();
	auto t2 = high_resolution_clock::now();
	auto t = duration_cast<microseconds>(t2 - t1);

	//looping 7 times to get different n
	for (int n = 0; n < repeats; n++) {
		if (nArray[n] == 100){
			cout << "Printing the output only if n = 100 to check the correctness of the algorithm. " <<
			"\nNOTE: First block of numbers is before sorting, second block is after sorting" << endl;
        }

		//insertion sort
		cout << "\nn = " << nArray[n] << endl <<  string(80, '=') << "\nInsertion sort\n";
		randAll = initializeVec(randAll, nArray[n], limit); //initializing the vector of n size and 20,000 as max number
		printVec(randAll); //printing if n = 100
		t1 = high_resolution_clock::now(); //get current initial time
		insertionSort(randAll, nArray[n]); //call insertion sort function on unsorted input
		t2 = high_resolution_clock::now(); //get current final time
		t = duration_cast<microseconds>(t2 - t1); //get the time it took to run the function in micro seconds
		printVec(randAll); // print now sorted vector
		cout << "It takes " << t.count() << " microseconds to execute the insertion sort function on unsorted input." << endl;
		t1 = high_resolution_clock::now(); //get current initial time
		insertionSort(randAll, nArray[n]); //call insertion sort function on sorted input
		t2 = high_resolution_clock::now(); //get current final time
		t = duration_cast<microseconds>(t2 - t1); //get the time it took to run the function in micro seconds
		cout << "It takes " << t.count() << " microseconds to execute the insertion sort function on sorted input." << endl;
		randAll.clear(); //clear the vector to move on to the next sort function

		//-----------------same process is repeated for the rest of the sorting functions-----------------
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

		cout << string(5, '\n'); //5 new lines after each n value
	} //n loop

	system("pause");
	return 0;
}
