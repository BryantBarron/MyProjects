/* 	Bryant Barron
 * 	September 25, 2017
 * 	Project #1
 * 	Comp482 Fall 2017
 */

public class Sorts {
	
	public static boolean isSorted(int[] array) {
		for(int i = 1; i < array.length; i++) {
			if(array[i-1] > array[i]) {
				return false;
			}
		}
		return true;
	}

	public static void merge(int[] array, int first, int middle, int last){
		int n1 = middle - first+ 1;
		int n2 = last - middle;
		
		int lower[] = new int [n1];
		int upper[] = new int [n2];
		
		for(int i = 0; i < n1; i++)
			lower[i] =array[first + i];
		for(int j = 0;j < n2; j++ )
			upper[j] = array[middle+1+j];
		
		int i = 0, j = 0;
		
		int z = first;
		while((i < n1) && (j < n2)) {
			if(lower[i] <= upper[j]) {
				array[z] = lower[i];
				i++;
			}else {
				array[z] = upper[j];
				j++;
			}
			z++;
		}
		
		while(i < n1) {
			array[z] = lower[i];
			i++;
			z++;
		}
		
		while(j < n2) {
			array[z] = upper[j];
			j++;
			z++;
		}
	}
	
	public static void mergeSort(int[] array, int i, int k){
		if(i < k) {
			int middle = (i+k)/2;
			mergeSort(array,i,middle);
			mergeSort(array,middle+1,k);
			merge(array,i,middle,k);
		}
	}
	
	public static void mergeSort(int[] array) {
		mergeSort(array, 0, array.length-1);
	}
	
	public static int partition(int[] array, int first, int last){
		int pivot = array[last];
		int l = first;
		int r = last -1;
		int temp;
		
		while(l <= r) {
			while((l <= r) && (array[l] <= pivot)) {
				l++;
			}
			while((r >= l) && (array[r] >= pivot)) {
				r--;
			}
			if(l < r) {
				temp = array[l];
				array[l] = array[r];
				array[r] = temp;
			}
		}
		temp = array[l];
		array[l] = array[last];
		array[last] = temp;
		return l;
	}
	
	public static void quickSort(int[] array, int first, int last){
		if(last > first) {
			int party = partition(array, first, last);
			quickSort(array, first, party -1);
			quickSort(array, party+1, last);
		}
	}
	
	public static void quickSort(int[] array) {
		quickSort(array, 0, array.length-1);
	}
	
	public static void main(String[] args) {
		Sorts mergeSortArray = new Sorts();
		Sorts quickSortArray = new Sorts();
		
		int[] requiredArray1 = {34,67,23,19,122,300,2,5,17,18,5,4,3,19,-40,23};
		int[] requiredArray2 = {34,67,23,19,122,300,2,5,17,18,5,4,3,19,-40,23};
		mergeSortArray.mergeSort(requiredArray1);
		quickSortArray.quickSort(requiredArray2);
		
		System.out.print("34 67 23 19 122 300 2 5 17 18 5 4 3 19 -40 23\n");
		
		if(isSorted(requiredArray1) == true) {
			System.out.print("This array is now sorted via mergeSort.\n");
			for(int i:requiredArray1){
				System.out.print(i);
				System.out.print(" ");
			}
		}
		System.out.print("\n\n34 67 23 19 122 300 2 5 17 18 5 4 3 19 -40 23\n");
		
		if(isSorted(requiredArray2) == true) {
			System.out.print("This array is now sorted via quickSort.\n");
			for(int i:requiredArray2){
				System.out.print(i);
				System.out.print(" ");
			}
		}
	}
}
