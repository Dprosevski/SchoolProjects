void heapify(vector<int> vec, int n, int i) { 
    int greatest = i; 
    int left = 2*i + 1; 
    int right = 2*i + 2; 
    
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
  

void heapSort(vector<int> vec, int n) { 
    for (int i = n / 2 - 1; i >= 0; i--) {
        heapify(vec, n, i); 
    }
    for (int i=n-1; i>=0; i--) { 
        swap(vec[0], vec[i]); 
        heapify(vec, i, 0); 
    } 
}