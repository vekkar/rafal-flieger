package Classifier;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
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

		BufferedReader reader = null;
		BufferedWriter writer = null;
		
		StringBuilder contents = new StringBuilder();

		try
		{
			//what if file does not exist?
			reader = new BufferedReader(new FileReader(inputFile));
			writer = new BufferedWriter(new FileWriter(outputFile));
			try
			{
				
			} finally
			{
				reader.close();
				writer.close();
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
