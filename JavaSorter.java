import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

public class JavaSorter {
	private List<Integer> nums = new LinkedList<Integer>();
	private List<Integer> numsCopy;
	private List<Long> times = new LinkedList<Long>();

	public static void main(String[] args) {
		JavaSorter s = new JavaSorter();
		String inputPath = args[0];
		String outputPath = args[1];
		int numIts = Integer.parseInt(args[2]);

		s.readInFile(inputPath);

		for (int i = 0; i < numIts; i++) {
			// read
			s.resetNumsCopy();
			// sort
			(s.times).add(s.sortTimer());
		}

		// print results to file
		s.createOutFile(outputPath, numIts);

	}

	private void resetNumsCopy() {
		numsCopy = new LinkedList<Integer>();
		numsCopy.addAll(nums);

	}

	public long sortTimer() {
		long begin = System.nanoTime();

		//Collections.sort(numsCopy);
		
		//Mergesort
		MergeSorter ms = new MergeSorter();
		ms.sort(numsCopy);

		long result = System.nanoTime() - begin;
		printList(numsCopy);

		return result;
	}

	private void printList(List<Integer> list) {
		for(int i : list){
			System.out.println(i);
		}

	}

	public void createOutFile(String outFile, int numIts) {

		try {
			PrintWriter writer = new PrintWriter(outFile, "UTF-8");
			writer.println("löpnummer, tid");
			for (int i = 0; i < numIts; i++) {
				writer.println(i + 1 + ", " + times.get(i));
			}
			writer.flush();
			writer.close();
		} catch (IOException e) {
			System.out.println("couldn't write to file");
		}
	}

	public void readInFile(String inFile) {

		try (BufferedReader br = new BufferedReader(new FileReader(inFile))) {
			String line;
			while ((line = br.readLine()) != null) {
				nums.add(Integer.parseInt(line));
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.exit(0);
		}
	}

	
	public class MergeSorter {

		private int[] array;
		private int[] tempMergArr;
		private int length;

		public void sort(List<Integer> list) {

			int[] arr = new int[list.size()];
			for(int i = 0; i < list.size(); i++) {
				arr[i] = list.get(i);
			}

			this.array = arr;
			this.length = arr.length;
			this.tempMergArr = new int[length];
			doMergeSort(0, length - 1);

			list.clear();
			for(int i : this.array) {
				list.add(i);
			}
		}

		private void doMergeSort(int lowerIndex, int higherIndex) {

			if (lowerIndex < higherIndex) {
				int middle = lowerIndex + (higherIndex - lowerIndex) / 2;
				// Below step sorts the left side of the array
				doMergeSort(lowerIndex, middle);
				// Below step sorts the right side of the array
				doMergeSort(middle + 1, higherIndex);
				// Now merge both sides
				mergeParts(lowerIndex, middle, higherIndex);
			}
		}

		private void mergeParts(int lowerIndex, int middle, int higherIndex) {

			for (int i = lowerIndex; i <= higherIndex; i++) {
				tempMergArr[i] = array[i];
			}
			int i = lowerIndex;
			int j = middle + 1;
			int k = lowerIndex;
			while (i <= middle && j <= higherIndex) {
				if (tempMergArr[i] <= tempMergArr[j]) {
					array[k] = tempMergArr[i];
					i++;
				} else {
					array[k] = tempMergArr[j];
					j++;
				}
				k++;
			}
			while (i <= middle) {
				array[k] = tempMergArr[i];
				k++;
				i++;
			}

		}
	}
}
