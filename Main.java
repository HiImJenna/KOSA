public class Main {
	public static void main(String[] args) {
        
    }

    void selectionSort(int[] arr) {
        int indexMin;
        int temp;
        for (int i = 0; i < arr.length - 1; i++) { //위치 선택
            indexMin = i;
            for (int j = i + 1; j < arr.length; j++) {
                if(arr[j] < arr[indexMin]) {
                    indexMin = j;
                }
            }

            temp = arr[indexMin];
            arr[indexMin] = arr[i];
        }

    }
}