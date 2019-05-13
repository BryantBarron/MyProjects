/*	Bryant Barron
 * 	Comp 482
 * 	Fall 2017
 * 	Project 1
 */
package comp482project1;

import java.util.Random;
import java.util.Arrays;
import Sorts;

public class SortTester {
	private static int[] array;
	private static int[] temp;
	// size of array
	private static int n = 0;
	// # of trials to be done 
	private static int nTrials = 20;
	
	private static double mergeSortAvg;
	private static double quickSortAvg;
	
	//create array of size n fill with random numbers between 1 and 1000000
	public static void createRandomArray() {
		array = new int[n];
		for(int i = 0; i < array.length; i++) {
			array[i] = (int)(Math.random()*1000000 + 1);
		}
	}
	public static int[] whoWins() {
		int a;
		int mergeCount = 0,quickCount = 0;
		for(int i = 1; i <= nTrials; i++) {
			mergeTest();
			quickTest();
			if(mergeSortAvg > quickSortAvg)
				mergeCount += 1;
			else if(quickSortAvg > mergeSortAvg)
				quickCount += 1;
			else if(quickSortAvg == mergeSortAvg) {
				mergeCount += 1;
				quickCount += 1;
			}else
				a = 0;
		}
		return new int[] {mergeCount, quickCount};
	}
	
	public static void mergeTest() {
		Sorts mergeSortArray = new Sorts();
		double [] runTime = new double[n];
		long start, end;
		for(int i = 0; i < n;i++) {
			copyArray();
			start = System.nanoTime();
			mergeSortArray.mergeSort(temp);
			end = System.nanoTime();
			runTime[i] = (end - start)/1000;
		}
		
		mergeSortAvg = averageTime(runTime);
	}
	
	public static void quickTest() {
		Sorts quickSortArray = new Sorts();
		double [] runTime = new double[n];
		long start, end;
		for(int i = 0; i < n;i++) {
			copyArray();
			start = System.nanoTime();
			quickSortArray.quickSort(temp);
			end = System.nanoTime();
			runTime[i] = (end - start)/1000;
		}
		
		quickSortAvg = averageTime(runTime);
	}
	
	public static double averageTime(double[] time) {
		double sum = 0;
		double average; 
		for(int i = 0; i <time.length;i++) {
			sum += time[i];
		}
		average = sum/(double)time.length;
		return average;
	}
	
	public static void copyArray() {
		temp = new int[n];
		System.arraycopy(array, 0, temp, 0, array.length);
	}

	public static void main(String[] args) {
	
		System.out.print("n\t\tnTrials\t\t# mergeSortWins\t\t# quickSort Wins\n");
		n = 10;
		createRandomArray();
		int trial1[] = whoWins();
		double avgTime1ms = mergeSortAvg;
		double avgTime1qs = quickSortAvg;
		System.out.print("10\t\t20\t\t" + trial1[0] + "\t\t\t" + trial1[1] + "\n");
		n = 100;
		createRandomArray();
		int trial2[] = whoWins();
		double avgTime2ms = mergeSortAvg;
		double avgTime2qs = quickSortAvg;
		System.out.print("100\t\t20\t\t" +trial2[0] + "\t\t\t" + trial2[1] + "\n");
		n = 1000;
		createRandomArray();
		int trial3[] = whoWins();
		double avgTime3ms = mergeSortAvg;
		double avgTime3qs = quickSortAvg;
		System.out.print("1000\t\t20\t\t" +trial3[0] + "\t\t\t" + trial3[1] + "\n");
		n = 10000;
		createRandomArray();
		int trial4[] = whoWins();
		double avgTime4ms = mergeSortAvg;
		double avgTime4qs = quickSortAvg;
		System.out.print("10000\t\t20\t\t" +trial4[0] + "\t\t\t" + trial4[1] + "\n");
		n = 100000;
		createRandomArray();
		int trial5[] = whoWins();
		double avgTime5ms = mergeSortAvg;
		double avgTime5qs = quickSortAvg;
		System.out.print("100000\t\t20\t\t" +trial5[0] + "\t\t\t" + trial5[1] + "\n");
		n = 1000000;
		createRandomArray();
		int trial6[] = whoWins();
		double avgTime6ms = mergeSortAvg;
		double avgTime6qs = quickSortAvg;
		System.out.print("100000\t\t20\t\t" +trial6[0] + "\t\t\t" + trial6[1] + "\n");
		n = 2000000;
		createRandomArray();
		int trial7[] = whoWins();
		double avgTime7ms = mergeSortAvg;
		double avgTime7qs = quickSortAvg;
		System.out.print("2000000\t\t20\t\t" +trial7[0] + "\t\t\t" + trial7[1] + "\n");
		
		System.out.print("n\t\tmergeSort:\t\tmergeSort:\t\tquickSort:\t\tquickSort\n");
		System.out.print(" \t\tmean runtime\t\tmean runtime /\t\tmean runtime\t\tmean runtime /\n");
		System.out.print(" \t\t(nanoses)\t\t(n*log2(n))\t\t(nanosecs)\t\t(n*log2(n))\n");
		System.out.print("10\t\t" + avgTime1ms + "\t\t\t\t\t\t" + avgTime1qs + "\t\t" + "\n");
		System.out.print("100\t\t" + avgTime2ms + "\t\t\t\t\t\t" + avgTime2qs + "\t\t" + "\n");
		System.out.print("1000\t\t" + avgTime3ms + "\t\t\t\t\t\t" + avgTime3qs + "\t\t" + "\n");
		System.out.print("10000\t\t" + avgTime4ms + "\t\t\t\t\t" + avgTime4qs + "\t\t" + "\n");
		System.out.print("100000\t\t" + avgTime5ms + "\t\t\t\t\t\t" + avgTime5qs + "\t\t" + "\n");
		System.out.print("1000000\t\t" + avgTime6ms + "\t\t\t\t\t\t" + avgTime6qs + "\t\t" + "\n");
		System.out.print("2000000\t\t" + avgTime7ms + "\t\t\t\t\t\t" + avgTime7qs + "\t\t" + "\n");
		
	} 
}



