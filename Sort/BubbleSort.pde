/**
 * void bubbleSort(int[] arr) {
 *     for (int i = 1; i < arr.length; i++) {
 *         for (int j = 0; j < arr.length - i; j++) {
 *             if (arr[j] > arr[j + 1]) {
 *                 swap(arr, j, j + 1);
 *             }
 *         }
 *     }
 * }
 */
class BubbleSort extends AbsSort {
    private int i = 1;
    private int j = 0;
 
    @Override
    public void next() {
        if (i == n || j == n) return;
        
        if (arr[j + 1] < arr[j]) {
            swap(j + 1, j);
        }
        
        if (++j == n - i) {
             j = 0;   
             i++;
        }
    }
    
    @Override
    protected void fillColor(int index) {
        if (index == j) {
            fill(NORD11);   
        } else if (index == j + 1) {
            fill(NORD13);
        } else {
            fill(NORD8);
        }
    }
    
    @Override
    public String toString() {
        return "1. Bubble Sort O(n^2)";
    }
}
