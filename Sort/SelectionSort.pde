/**
 * void selectionSort(int[] arr) {
 *     for (int i = 0; i < arr.length; i++) {
 *         for (int j = i + 1; j < arr.length; j++) {
 *             if (arr[j] < arr[i]) {
 *                 swap(arr, j, i);
 *             }
 *         }
 *     }
 * }
 */
class SelectionSort extends AbsSort {
    private int i = 0;
    private int j = 1;
    
    @Override
    public void next() {
        if (i == n || j == n) return;
        
        if (arr[j] < arr[i]) {
            swap(i, j);
        }
        
        if (++j == n) {
            j = ++i + 1;
        }
    }
    
    @Override
    protected void fillColor(int index) {
        if (index == i) {
            fill(NORD11);   
        } else if (index == j) {
            fill(NORD13);
        } else {
            fill(NORD8);
        }
    }
        
    @Override
    public String toString() {
        return "2. Selection Sort O(n^2)";
    }
}
