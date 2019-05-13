import java.io.*;
import java.util.*;

public class Graph{
	private Scanner fileScanner;
	private int numVertices, numEdges;
	private List<EdgeNode> adjList = new ArrayList<EdgeNode>();
	private List<EdgeNode> printList = new  ArrayList<EdgeNode>();

	public Graph(String inputFile){
		openFile(inputFile);
		readFile();
		closeFile();
	}

	private void openFile(String inputFile) {
		try {
			fileScanner = new Scanner(new File(inputFile));
		} catch(Exception e) {
			System.out.println("File not found.");
		}
	}

	private void readFile() {
		int v1, v2, w;
		numVertices = Integer.parseInt(fileScanner.nextLine());
		while(fileScanner.hasNext()) {
			v1 = fileScanner.nextInt();
			v2 = fileScanner.nextInt();
			w = fileScanner.nextInt();
		
			adjList.add(new EdgeNode(v1,v2,w));
		}
	
		bubbleSort(adjList);
		numEdges = adjList.size();
	}

	private void closeFile() {
		fileScanner.close();
	}


	public void printGraph() {
        System.out.println("Graph: nVertices = "+numVertices+"  nEdges = "+numEdges);
        System.out.println("Adjacency Lists");
        int i = 0;
        do{
        		int j = 0;
        		do {
        			if(adjList.get(j).startingVertex() == i){
                        printList.add(adjList.get(j));
                    }
        			j++;
        		}while(j < numEdges);
            System.out.println("v= "+i+"  "+printAdj(printList));
            printList.clear();
           i++;
        }while(i < numVertices);
    }

	private String printAdj(List<EdgeNode> nodeList) {
		String print = "";
		if(nodeList.isEmpty()) {
			return print = "[]";
		}
	
		print += "[ ";
		int x = 0;
		do {
			print += nodeList.get(x).toString();
			if(x != nodeList.size() -1) {
				print += ", ";
			}
			x++;
		}while( x < nodeList.size());

		print += " ]";
		return print;
	}

	private void bubbleSort(List<EdgeNode>adjList) {
		//bubblesort followed from geeksforgeeks
		int n = adjList.size();
		for(int i = 0; i < n - 1; i++)
			for(int j = 0; j < n - i - 1; j++)
				if(adjList.get(j).startingVertex() > 
					adjList.get(j+1).startingVertex()) {
					EdgeNode temp = adjList.get(j);
					adjList.set(j,  adjList.get(j+1));
					adjList.set(j+1, temp);
				}
	}

	public void printShortestPaths(SPPacket spp) {
		System.out.println(spp.toString());
	
	}

	public SPPacket bfsShortestPaths (int start) {
		
		int[] bfs = new int[numVertices];
		int[] node = new int[numVertices];
		int[] visited = new int[numVertices];
		int count, nodeCount, path;
		count = nodeCount = path = 0;
		int focusNode = start;
		
		Queue<Integer> nodeQueue = new LinkedList<>();
		visited[start] = 1;
		focusNode = start;

 
		for(int i = 0; i < numVertices; i++){
			node[i] = 777;
		}

		do{
			if(!nodeQueue.isEmpty()){
				focusNode = nodeQueue.peek();
				visited[focusNode] = 1;
				nodeQueue.remove();
			}
			int x = 0;
			do{
				if(adjList.get(x).startingVertex() == focusNode){
					if(visited[adjList.get(x).endingVertex()] != 1){
						nodeQueue.add(adjList.get(x).endingVertex());
						node[adjList.get(x).endingVertex()] = focusNode;
					}
				}
				x++;
			}while ( x < numEdges );

		}while(!nodeQueue.isEmpty());

		for(int i = 0; i < numVertices; i++){
			path = node[i];
			while(path != 777){
				path = node[path];
				count++;
			}
			bfs[i] = count;
			count = 0;
		}

		for(int i = 0; i < numVertices; i++){
			if(bfs[i] == 0 && i != start){
				bfs[i] = 777;
			}
		}

		SPPacket bfsSP = new SPPacket(start, bfs, node);
		return(bfsSP);
	}

	public SPPacket dijkstraShortestPaths (int start ) {
		int count = 0;
		int[] dijkstra= new int[numVertices];
		int[] node = new int[numVertices];
		int[] visited = new int[numVertices];
		int current = start;
		visited[start] = 1;
    
		PriorityQueue<EdgeNode> eQueue = new PriorityQueue<EdgeNode>();

		for(int i = 0; i < numVertices; i++){
			node[i] = 777;
		}

		for(int i = 0; i < numVertices; i++){
			if(i == start){
				dijkstra[i] = 0;
			} else{
				dijkstra[i] = 777;
			}
		}

		while(count != numVertices){
			int x = 0;
			do{
				if(adjList.get(x).startingVertex() == current){
					if(adjList.get(x).weight() + dijkstra[current] < 
							dijkstra[adjList.get(x).endingVertex()]){
						dijkstra[adjList.get(x).endingVertex()] = 
								adjList.get(x).weight() + dijkstra[current];
						node[adjList.get(x).endingVertex()] = current;
						eQueue.add(adjList.get(x));
					}
				}
				x++;
			}while (x < numEdges);

			if(eQueue.isEmpty()){
				break;
			}
        
			if(visited[eQueue.peek().endingVertex()] != 1){
				current = eQueue.peek().endingVertex();
				visited[eQueue.peek().endingVertex()] = 1;
				eQueue.remove(eQueue.peek());
			} else{
				eQueue.remove(eQueue.peek());
			}
			count++;
		}

		SPPacket dijkstraSP = new SPPacket(start, dijkstra, node);
		return(dijkstraSP);
	}

	public SPPacket bellmanFordShortestPaths(int start) {
		int counter = 0;
		int[] bf = new int[numVertices];
		int[] node = new int[numVertices];
    
		node[start] = 777;
		int i = 0;
		do	{
			if(i == start){
				bf[i] = 0;
			} else{
				bf[i] = 777;
			}
			i++;
		}while(i < numVertices);
    
		outerloop:
			for(int x = 0; x < numVertices - 1; x++){
				for(int y = 0; y < numVertices; y++){
					if(bf[y] != 777){
						for(int z = 0; z < numEdges; z++){
							if(adjList.get(z).endingVertex() != start){
								if(adjList.get(z).startingVertex() == y){
									if(adjList.get(z).weight() + bf[y] <
											bf[adjList.get(z).endingVertex()]){
										bf[adjList.get(z).endingVertex()] = 
												adjList.get(z).weight() + bf[y];
										node[adjList.get(z).endingVertex()] = y;
									}else{
										counter++;
										if(counter == numVertices){
											counter = 0;
											break outerloop;
										}
									}
								}
							}
						}
					}
				}
			}

		SPPacket bellmanFordSP = new SPPacket(start, bf, node);
		return(bellmanFordSP);
	}
	private int pathsVisited(int start) {
		int count, nodeCount, current, x, y, z;
		count = nodeCount = x = y = z = 0;
		current = start;
		int[] cost = new int[numVertices];
		int[] node = new int[numVertices];
		int[] path = new int[numVertices];
    		int[] visited = new int[numVertices];
    		PriorityQueue<EdgeNode> eQueue = new PriorityQueue<EdgeNode>();

    		visited[start] = 1;
    		node[start] = 777;

    		do{
    			path[x] = -1;
    			x++;
    		}while( x < numVertices);

    		path[0] = current;

    		do{
    			if(y == start){
    				cost[y] = 0;
    			}else{
    				cost[y] = 777;
    			}
    			y++;
    		}while( y < numVertices);
     
    		while(count != numVertices){
    			for(int i = 0; i < numEdges; i++){
    				if(adjList.get(i).startingVertex() == current){
    					if(adjList.get(i).weight() + cost[current] < 
    							cost[adjList.get(i).endingVertex()]){
    						cost[adjList.get(i).endingVertex()] = 
    								adjList.get(i).weight() + cost[current];
    							node[adjList.get(i).endingVertex()] = current;
    							eQueue.add(adjList.get(i));
    					}
    				}
    			}

    			if(eQueue.isEmpty()){
    				break;
    			}else if(visited[eQueue.peek().endingVertex()] != 1){
    				current = eQueue.peek().endingVertex();
    				nodeCount++;
    				path[nodeCount] = current;
    				visited[eQueue.peek().endingVertex()] = 1;
             	eQueue.remove(eQueue.peek());
    			}else{
    				eQueue.remove(eQueue.peek());
    			}
    			count++;
    		}

    		do{
    			if(path[z] == -1){
    				return 0;
    			}
    			z++;
    		}while(z < numVertices);
    		
    		return 1;
	}

	public boolean isStronglyConnected() {
		int[] test = new int[numVertices];
		int x = 0;
		do {
			if(pathsVisited(x) == 0) {
				return false;
			}
			test[x] = pathsVisited(x);
			x++;
		}while(x < numVertices);	
		return true;
	}

	public static void main(String[] args) {
		System.out.println("Test Case A: Dijkstra Shortest Paths");
		Graph g1 = new Graph("inputA.txt");
		g1.printGraph();
		int starta = 1;
		SPPacket sppa = g1.dijkstraShortestPaths(starta);
		System.out.println("Print shortest paths from start vertex  = " + starta);
		g1.printShortestPaths( sppa );
		if( g1.isStronglyConnected())
			System.out.println( "Graph is strongly connected");
		else
			System.out.println( "Graph is not strongly connected");
    ////////////////////////////////////////////////////////////////////
		System.out.println("Test Case B: Bellman Ford Shortest Paths");
		Graph g2 = new Graph("inputB.txt");
		g2.printGraph();
		int startb = 0;
		SPPacket sppb = g2.bellmanFordShortestPaths(startb);
		if( sppb != null){
			System.out.println("Print shortest paths from start vertex  = " + startb);
			g1.printShortestPaths( sppb );
		}else
			System.out.println("Graph has a negative cycle");	
    /////////////////////////////////////////////////////////////////
		System.out.println("Test Case C: BFS Ford Shortest Paths");
		Graph g3 = new Graph("inputC.txt");
		g3.printGraph();
		int startc = 5;
		SPPacket sppc = g3.bfsShortestPaths(startc);
		System.out.println("Print shortest paths from start vertex = " + startc);
g3.printShortestPaths(sppc);
	/////////////////////////////////////////////////////////////////
		System.out.println("Test Case D: Bellman Ford Shortest Paths");
		Graph g4 = new Graph("inputD.txt");
		g4.printGraph();
		int startd = 0;
		SPPacket sppd = g4.bfsShortestPaths(startd);
		System.out.println("Print shortest paths from start vertex  = " + startd);
		g4.printShortestPaths( sppd );
		if( g4.isStronglyConnected())
			System.out.println( "Graph is strongly connected");
		else
			System.out.println( "Graph is not strongly connected");       
	}
}

class EdgeNode implements Comparable<EdgeNode> {
	int vertex1;
	int vertex2;
	int weight;
	
	public EdgeNode(int v1, int v2, int w) {
		vertex1 = v1;
		vertex2 = v2;
		weight = w;
	}
	
	public String toString() {
		return "("+vertex1+","+vertex2+","+weight+")";
	}
	
	public int startingVertex() {
		return vertex1;
	}
	
	public int endingVertex() {
		return vertex2;
	}
	
	public int weight() {
		return weight;
	}
	
	public boolean matching(EdgeNode other) {
		return this.weight() == other.weight();
	}
	
	public int compareTo(EdgeNode other) {
		if(weight() > other.weight()) {
			return 1;
		}else if (this.matching(other)) {
			return 0;
		} else {
			return -1;
		}
	}
}
class SPPacket {
	int[] distance;    
	int[] parent; 
	int source; 

	public SPPacket( int start, int[] dist, int[] pp){
		source = start;
		distance = dist;
		parent = pp;
	}
	
	public int[] getDistance(){
		return distance;
	}

	public int[] getParent(){
		return parent;
	}

	public int getSource(){
		return source;
	}	

	public String toString(){
		ArrayList<Integer> temp = new ArrayList<Integer>();
    		String SPPacket;
    		SPPacket = "";
    		int path = 0;
    		int count = 0;
    
    		SPPacket += "Shortest Paths from vertex "+source+" to vertex\n";

    		for(int i = 0; i < distance.length; i++){
        		SPPacket += i+"= ";
        		List<Integer> cycle = new ArrayList<Integer>();
        		temp.add(i);
        		cycle.add(i);
        		path = parent[i];

        		while(path != 777 && path != i && count != 100){
        			temp.add(path);
            		cycle.add(i);
            		path = parent[path];
            		if(cycle.contains(path)){
            			return "***Negative Cycle Found***\n";
            		}
            		count++;
        		}

        		if(temp.size() <= 2 && distance[i] == 777 && i != source ){
            		temp.clear();
            		temp.add(i);
            		SPPacket += temp.toString();
            		SPPacket += "***Path Unreachable***\n";
            		temp.clear();
            		cycle.clear();
            		continue;
        		}

        		Collections.reverse(temp);
        		SPPacket += temp.toString();
        		SPPacket += "Path weight = "+distance[i]+".\n";
        		temp.clear();
        		cycle.clear();
    		}
    		return SPPacket;
	}
}

