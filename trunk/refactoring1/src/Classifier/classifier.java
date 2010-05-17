package Classifier;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.List;
import java.util.StringTokenizer;

public class classifier
{
	// The weather is great when aura is sunny
	public static void main(String args[])
	{
		String inputFileName = "/input.txt";
		String outputFileName = "/output.txt";

		File inputFile = new File(inputFileName);
		File outputFile = new File(outputFileName);
		
		try
		{
			IFileProcessor processor= new defaultFileProcessor();
			List<weather> data= processor.readFile(inputFile);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
