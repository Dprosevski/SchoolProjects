void merge(vector<int> &vec, int subl, int mid, int subr) { 
    int i, j, k; 
    int n1 = mid - subl + 1; 
    int n2 =  subr - mid; 
    vector<int> L, R;
  
    for (i = 0; i < n1; i++) {
        L[i] = vec[subl + i]; 
    }
    for (j = 0; j < n2; j++) {
        R[j] = vec[mid + 1+ j]; 
    }
  
    i = 0; 
    j = 0; 
    k = subl; 
    while (i < n1 && j < n2) { 
        if (L[i] <= R[j]) { 
            vec[k] = L[i]; 
            i++; 
        } 
        else { 
            vec[k] = R[j]; 
            j++; 
        } 
        k++; 
    } 
  
    while (i < n1) { 
        vec[k] = L[i]; 
        i++; 
        k++; 
    } 
  
    while (j < n2) { 
        vec[k] = R[j]; 
        j++; 
        k++; 
    } 
} 
  
void mergeSort(vector<int> &vec, int subl, int subr) { 
    if (subl < subr) {     
        int mid = subl+(subr-subl)/2; 
        mergeSort(vec, subl, mid); 
        mergeSort(vec, mid+1, subr); 
        merge(vec, subl, mid, subr); 
    } 
} 