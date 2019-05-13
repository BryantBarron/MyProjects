//Bryant Barron
//Comp 482
//Project 2
//0-1 Knapsack Problem
//package comp482project2;
import java.util.*;
import java.io.*;

public class Knapsack {
	int items;
	int capacity;
	int[] weights;
	int[] benefits;
	double[][] list;
	
	public Knapsack(int W, int[] w, int[] b) {
		this.weights = w;
		this.benefits = b;
		this.capacity = W;
		this.items = w.length;
		this.list = new double[this.items +1][5];
	}
	
	private void generateItemSet(int items, int[]w, int[]b) {
		this.list[0][0] = 0.0;
		this.list[0][1] = -1.0;
		this.list[0][2] = -1.0;
		this.list[0][3] = 0.0;
		this.list[0][4] = 0.0;
		
		for(int i = 1; i < this.items; i++) {
			this.list[i][0] = (double)i;
			this.list[i][1] = (double)w[i];
			this.list[i][2] = (double)b[i];
			this.list[i][3] = (double)(b[i]/(double)w[i]);
			this.list[i][4] = 0.0;
		}
	}
	
	public static int[] generateSubset(int k, int n){
	    int[] subset = new int[n + 1];
	    int max = (int) Math.pow(2, n);
	    int remainder = 0;
	    
	    while(k != 0 && n > 1){
	      remainder = k % 2;
	      subset[n] = remainder;
	      k /= 2;
	      n--;
	    }

	    if(k == 1){
	      subset[n] = 1;
	      n--;
	    }
	    return subset;
	  }
	
	public void BruteForceSolution() {
		Knapsack knp = new Knapsack(this.capacity, this.weights, this.benefits);
		knp.generateItemSet(knp.items, knp.weights, knp.benefits);
		ArrayList<int[]> array = new ArrayList<int[]>();
		ArrayList<int[]> optimal = new ArrayList<int[]>();
		int weight = 0;
		int benefit = 0;
		int max = (int)Math.pow(2, knp.items)-1;
		int[] binary = new int[knp.items];
		
		for(int i = 1; i <= max; i++) {
			binary = knp.generateSubset(i, knp.items);
			weight = 0;
			benefit = 0;
			int[] solution= new int[knp.items + 3];
			int x = 0;
			while(x <= knp.items) {
				for(int y = 0; y <= knp.items; y++) {
					knp.list[y][4] = binary[y];
			}
				if(knp.list[x][4] == 1) {
					weight += knp.list[x][1];
					benefit += knp.list[x][2];
				}
				x++;
			}
			
			if(weight <= knp.capacity) {
				int z = 0;
				while( z < knp.items +1) {
					solution[z] = binary[z] == 1? z: 0;
					z++;
				}
				solution[knp.items + 1] = weight;
				solution[knp.items + 2] = benefit;
				
				array.add(solution);
			}
		}
		
		optimal.add(array.get(0));
		int i = 1; 
		while( i < array.size()) {
			if(optimal.get(0)[knp.items + 2] < array.get(i)[knp.items + 2]) {
				optimal.clear();
				optimal.add(array.get(i));
				i++;
			}else if(optimal.get(0)[knp.items + 2] == array.get(i)[knp.items + 2]) {
				optimal.add(array.get(i));
				i++;
			}
			i++;
		}
		
		int x = 0;
		do{
			ArrayList<Integer> optimalSolution = new ArrayList<Integer>();
			for(int j = 0; j < knp.items; j++) {
				if(optimal.get(x)[j] != 0) {
					optimalSolution.add(optimal.get(x)[j]);
				}
			}
			System.out.println("Optimal Set = " + optimalSolution);
			System.out.println("Weight sum = " + optimal.get(x)[knp.items + 1]);
			System.out.println("Benefit sum = " + optimal.get(x)[knp.items + 2]);
			x++;
		}while( x < optimal.size()); 
	}
	
	public void DynamicProgrammingSolution(boolean printBMatrix) {
		Knapsack knp = new Knapsack(this.capacity, this.weights, this.benefits);
		ArrayList<Integer> array = new ArrayList<Integer>();
		knp.generateItemSet(knp.items, knp.weights, knp.benefits);
		int weights = 0;
		int benefits = 0;
		
		int[][] table = new int[knp.items + 1][knp.capacity + 4];
		int i = 0;
		while( i < 3 ) {
			table[0][i] = -1;
			i++;
		}
		for(int x = 0; x < knp.capacity + 4; x++) {
			table[0][x] = x - 3;
		}
		
		for(int x = 1; x < knp.items + 1; x++) {
			int count = 0;
			while( count < knp.capacity + 4) {
				switch(count) {
					case 0: 
						table[x][0] = (int)knp.list[x-1][0];
						break;
					case 1:
						table[x][1] = (int)knp.list[x-1][1];
						break;
					case 2:
						table[x][2] = (int)knp.list[x-1][2];
						break;
					default:
						table[x][count] = 0;
				}
				count++;
			}
		}
		
		for(int z = 2; z < knp.items + 1; z++) {
			for(int j = 4; j < knp.capacity + 4; j++) {
				if(table[z][1] > table[0][j]) {
					table[z][j] = table[z-1][j];
				} else { 
					if(table[z][1] != -1) {
						table[z][j] = Math.max(table[z-1][j], table[z-1][j-table[z][1]] + table[z][2]); 
					} else {
						table[z][j] = Math.max(table[z-1][j], table[z-1][j] + table[z][2]);
					}
				}
			}
		}
		
		if(printBMatrix == true) {
			System.out.println("Printing out the table");
			System.out.println("X is the weight from 0 to Capacity, Y is number of items 0 to n");
			
			for(int a = 0; a < knp.items + 1; a++) {
				for(int b = 0; b < knp.capacity + 4; b++) {
					System.out.print(table[a][b]);
					System.out.print(", ");
				}
				System.out.println("\n");
			}
		}
		
		benefits = (int)table[knp.items][knp.capacity + 3];
		
		int totalWeight = knp.capacity + 3;
		while( totalWeight > 2) {
			if(benefits != table[knp.items][totalWeight]) {
				weights = table[0][totalWeight+1];
				break;
			}
			totalWeight--;
		}
		
		int current = knp.capacity +3;
		outerloop:
		    for(int a = knp.items; a > 1; a--){
		      if(table[a][current] > table[a - 1][current]){
		        array.add(table[a][0]);
		        current -= table[a][1];
		      } else if(table[a][current] == 0){
		        break outerloop;
		      }
		    }
		    System.out.println("Optimal Set = "+array);
		    System.out.println("Weight sum = "+ (int)weights);
		    System.out.println("Benefit sum = "+(int)benefits);
	}
	
	 private static void greedySortList(double[][] arr) {
		 int row = arr.length;
		 int col = arr[0].length;
		 int total = row * col;
		 boolean swaps = false;
		 for(int i = 0; !swaps; i++) {
			 swaps = true;
			 
			 for(int x = 1; x < total - 1; x++) {
				 int currRow = (x-1) / col;
				 int currOff = (x-1) % col;
				 int nextRow = x / col;
				 int nextOff = x % col;
				 
				 if(arr[currRow][currOff] > arr[nextRow][nextOff]) {
					 double temp = arr[nextRow][nextOff];
					 arr[nextRow][nextOff] = arr[currRow][currOff];
					 arr[currRow][currOff] = temp;
					 swaps = false;
				 }
			 }
		 }
	 }
	
	public void GreedyApproximateSolution() {
		Knapsack knp = new Knapsack(this.capacity, this.weights, this.benefits);
		knp.generateItemSet(knp.items, knp.weights, knp.benefits);
		
		ArrayList<Integer> array = new ArrayList<Integer>();
		double weight = 0;
		double benefit = 0;
		
		greedySortList(knp.list);
		
		for(int x = knp.items; x > 0; x--) {
			if(weight + knp.list[x][1] <= knp.capacity && knp.list[x][3] != 0) {
				array.add((int)knp.list[x][0]);
				weight += knp.list[x][1];
				benefit += knp.list[x][2];
			}
		}
	    System.out.println("Optimal Set = " + array);
	    System.out.println("Weight sum = " + (int)weight);
	    System.out.println("Benefit sum = "+ (int)benefit);
	}
}
