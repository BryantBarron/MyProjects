import java.util.*;


class KnapsackDriver {


	public static void main( String[] args){  
		
		long startTime = System.nanoTime();
		// Test Case MAIN
		int n_main = 6;
		int[] weights_main = {-1,2,4,3,4,4,1};
		int W_main = 10;
		int[] values_main = {-1,1,2,3,3,3,6};
		// Main Test Case
		System.out.println("\nBrute Force Solution Test Main Case");  
		long startTimeBF_main = System.nanoTime();
		Knapsack kp_main = new Knapsack(W_main, weights_main, values_main);        
		kp_main.BruteForceSolution();      
		long estimatedRunTimeBF_main = System.nanoTime() - startTimeBF_main;
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeBF_main);
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeBF_main / 1E6));
		
		System.out.println("\nDynamic Programming Solution Test Case MAIN");    
		long startTimeDP_main = System.nanoTime();
		Knapsack kp_main2 = new Knapsack(W_main,weights_main, values_main);      
		kp_main2.DynamicProgrammingSolution(false);  
		long estimatedRunTimeDP_main= System.nanoTime() - startTimeDP_main;
		System.out.println("Estimated RunTime of DynamicProgramming 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeDP_main);
		System.out.println("Estimated RunTime of DynamicProgramming 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeDP_main / 1E6));
		
		System.out.println("\nGreedy Approximate Solution Test Case MAIN");    
		long startTimeGAS_main = System.nanoTime();
		Knapsack kp_main3 = new Knapsack(W_main, weights_main, values_main);       
		kp_main3.GreedyApproximateSolution();   
		long estimatedRunTimeGAS_main= System.nanoTime() - startTimeGAS_main;
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeGAS_main);
		System.out.println("Estimated RunTime of Greedy ALgorithm 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeGAS_main / 1E6));
		
		//given test case
		int n = 7;      
		int[] weights = {-1, 60, 50, 60, 50, 70, 70, 45};       
		int W = 100;      
		int[] benefits = {-1, 180, 95, 40, 95, 40, 40, 105};  
		//given test case 2
		int n2 = 18;      
		int[] weights2 = {-1,25,4,2,5,6, 2,7,8,2,1, 1,3,5,8,9,  6,3,2};      
		int W2 = 39;      
		int[] benefits2 = {-1,75,7,4,3,2,  6,8,7,9,6,  5,4,8,10,8,  1,2,2}; 
		//given test case 3
		int n3 = 20;      
		int[] weights3 = {-1, 10,14,35,12,16, 20,13,7,2,4, 3,10,5,6,17,7,9,3,4,3};       
		int W3 = 29;      
		int[] benefits3 = {-1, 2,13,41,1,12, 5,31,2,41,16,2,12,1,13,4, 51,6,12,1,9}; 
		//give test case4 
		int n4 = 7;      
		int[] weights4 = {-1, 2,5,3,2,5,3,7 };      
	 	int W4 = 10;      
	 	int[] benefits4 = {-1, 5,10,5,20,15,5,10};
	 	
		//personal test case1
		int n5 = 18;
		int[] weights5 = {-1,25,4,3,2,5,6,2,7,7,2,1,1,3,10,16,2,35,3};
		int W5 = 45;
		int[] benefits5 = {-1,100,7,6,5,4,3,2,1,16,13,11,9,25,1,1,2,3,7};
		//personal test case2
		int n6 = 5;
		int[] weights6 = { -1,1,2,3,4,5 };
		int W6 = 8;
		int[] benefits6 = { -1,5,4,3,2,1};
		 
		// BruteForce Programming Test Cases
		// Test Case #1
		System.out.println("\nBrute Force Solution Test 1");  
		long startTimeBF = System.nanoTime();
		Knapsack kp1 = new Knapsack(W, weights, benefits);        
		kp1.BruteForceSolution();      
		long estimatedRunTimeBF = System.nanoTime() - startTimeBF;
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeBF);
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeBF / 1E6));
		//Test Case#2
		System.out.println("\nBrute Force Solution Test 2");  
		long startTimeBF2 = System.nanoTime();
		Knapsack kp12 = new Knapsack(W2, weights2, benefits2);        
		kp12.BruteForceSolution();      
		long estimatedRunTimeBF2 = System.nanoTime() - startTimeBF2;
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeBF2);
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeBF2 / 1E6));
		//Test Case#3
		System.out.println("\nBrute Force Solution Test 3");  
		long startTimeBF3 = System.nanoTime();
		Knapsack kp13 = new Knapsack(W3, weights3, benefits3);        
		kp13.BruteForceSolution();      
		long estimatedRunTimeBF3 = System.nanoTime() - startTimeBF3;
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeBF3);
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeBF3 / 1E6));
		//TestCase#4
		System.out.println("\nBrute Force Solution Test 4");  
		long startTimeBF4 = System.nanoTime();
		Knapsack kp14 = new Knapsack(W4, weights4, benefits4);        
		kp13.BruteForceSolution();      
		long estimatedRunTimeBF4 = System.nanoTime() - startTimeBF4;
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeBF4);
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeBF4 / 1E6));
		//TestCase#5
		System.out.println("\nBrute Force Solution Test 5");  
		long startTimeBF5 = System.nanoTime();
		Knapsack kp15 = new Knapsack(W5, weights5, benefits5);        
		kp13.BruteForceSolution();      
		long estimatedRunTimeBF5 = System.nanoTime() - startTimeBF5;
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeBF5);
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeBF5 / 1E6));
		//TestCase#6
		System.out.println("\nBrute Force Solution Test 6");  
		long startTimeBF6 = System.nanoTime();
		Knapsack kp16 = new Knapsack(W6, weights6, benefits6);        
		kp13.BruteForceSolution();      
		long estimatedRunTimeBF6 = System.nanoTime() - startTimeBF6;
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeBF6);
		System.out.println("Estimated RunTime of BruteForce 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeBF6 / 1E6));
		
		//Dynamic Programming Test Cases
		//Test Case#1
		System.out.println("\nDynamic Programming Solution Test 1");    
		long startTimeDP = System.nanoTime();
		Knapsack kp2 = new Knapsack(W,weights, benefits);      
		kp2.DynamicProgrammingSolution(false);  
		long estimatedRunTimeDP= System.nanoTime() - startTimeDP;
		System.out.println("Estimated RunTime of DynamicProgramming 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeDP);
		System.out.println("Estimated RunTime of DynamicProgramming 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeDP / 1E6));
		//Test Case#2
		System.out.println("\nDynamic Programming Solution Test 2");  
		long startTimeDP32 = System.nanoTime();
		Knapsack kp22 = new Knapsack(W2, weights2, benefits2);        
		kp22.DynamicProgrammingSolution(false);       
		long estimatedRunTimeDP22 = System.nanoTime() - startTimeDP32;
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeDP22);
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeDP22 / 1E6));
		//Test Case#3 with Solution True
		System.out.println("\nDynamic Programming Solution Test 3");  
		long startTimeDP23 = System.nanoTime();
		Knapsack kp23 = new Knapsack(W3, weights3, benefits3);    
		kp23.DynamicProgrammingSolution(false);    
		long estimatedRunTimeDP23 = System.nanoTime() - startTimeDP23;
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeDP23);
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeDP23 / 1E6));
		//TestCase#4
		System.out.println("\nDynamic Programming Solution Test 4");  
		long startTimeDP24 = System.nanoTime();
		Knapsack kp24 = new Knapsack(W4, weights4, benefits4);    
		kp24.DynamicProgrammingSolution(true);    
		long estimatedRunTimeDP24 = System.nanoTime() - startTimeDP24;
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeDP24);
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeDP24 / 1E6));
		//TestCase#5
		System.out.println("\nDynamic Programming Solution Test 5");  
		long startTimeDP25 = System.nanoTime();
		Knapsack kp25 = new Knapsack(W5, weights5, benefits5);    
		kp25.DynamicProgrammingSolution(false);    
		long estimatedRunTimeDP25 = System.nanoTime() - startTimeDP25;
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeDP25);
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeDP25 / 1E6));
		//TestCase#6
		System.out.println("\nDynamic Programming Solution Test 6");  
		long startTimeDP26 = System.nanoTime();
		Knapsack kp26 = new Knapsack(W6, weights6, benefits6);    
		kp26.DynamicProgrammingSolution(true);    
		long estimatedRunTimeDP26= System.nanoTime() - startTimeDP26;
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeDP26);
		System.out.println("Estimated RunTime of Dynamic Programming 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeDP26 / 1E6));
		
		//Greedy Test Cases
		//TestCase#1
		System.out.println("\nGreedy Approximate Solution Test 1");    
		long startTimeGAS = System.nanoTime();
		Knapsack kp3 = new Knapsack(W, weights, benefits);       
		kp3.GreedyApproximateSolution();   
		long estimatedRunTimeGAS= System.nanoTime() - startTimeGAS;
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeGAS);
		System.out.println("Estimated RunTime of Greedy ALgorithm 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeGAS / 1E6));
		//TestCase#2
		System.out.println("\nGreedy Approximate Solution Test 2");  
		long startTimeGAS32 = System.nanoTime();
		Knapsack kp32 = new Knapsack(W2, weights2, benefits2);        
		kp32.GreedyApproximateSolution();       
		long estimatedRunTimeGAS32 = System.nanoTime() - startTimeGAS32;
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeGAS32);
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeGAS32 / 1E6));
		//TestCase#3
		System.out.println("\nGreedy Approximate Solution Test 3");  
		long startTimeGAS33 = System.nanoTime();
		Knapsack kp33 = new Knapsack(W3, weights3, benefits3);        
		kp33.GreedyApproximateSolution();       
		long estimatedRunTimeGAS33 = System.nanoTime() - startTimeGAS33;
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeGAS33);
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeGAS33 / 1E6));
		//TestCase#4
		System.out.println("\nGreedy Approximate Solution Test 4");  
		long startTimeGAS34 = System.nanoTime();
		Knapsack kp34 = new Knapsack(W4, weights4, benefits4);        
		kp34.GreedyApproximateSolution();       
		long estimatedRunTimeGAS34 = System.nanoTime() - startTimeGAS34;
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeGAS34);
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeGAS34 / 1E6));
		//TestCase#5
		System.out.println("\nGreedy Approximate Solution Test 5");  
		long startTimeGAS35 = System.nanoTime();
		Knapsack kp35 = new Knapsack(W5, weights5, benefits5);        
		kp35.GreedyApproximateSolution();       
		long estimatedRunTimeGAS35 = System.nanoTime() - startTimeGAS35;
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeGAS35);
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeGAS35 / 1E6));
		//TestCase#6
		System.out.println("\nGreedy Approximate Solution Test 6");  
		long startTimeGAS36 = System.nanoTime();
		Knapsack kp36 = new Knapsack(W6, weights6, benefits6);        
		kp36.GreedyApproximateSolution();       
		long estimatedRunTimeGAS36 = System.nanoTime() - startTimeGAS36;
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in nanoseconds: " + 
				estimatedRunTimeGAS36);
		System.out.println("Estimated RunTime of Greedy Algorithm 0-1 Knapsack in milliseconds: " +
				(estimatedRunTimeGAS36 / 1E6));
		
		long runTime = (long) ((System.nanoTime() - startTime) / 1E9);
		System.out.println("Amount of time in seconds to run all tests: " + runTime + ".");
		
		
	}
}
