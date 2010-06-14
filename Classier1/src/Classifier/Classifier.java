package Classifier;

import java.io.File;

public class Classifier
{
	// The weather is great when aura is sunny
	public static void main(String args[])
	{
		String inputFileName = "";
		String outputFileName = "";
		if (args.length != 2)
		{
			inputFileName = "input.txt";
			outputFileName = "output.txt";
		} else
		{
			inputFileName = args[0];
			outputFileName = args[1];
		}

		File inputFile = new File(inputFileName);
		File outputFile = new File(outputFileName);

		try
		{
			IFileProcessor processor = new DefaultFileProcessor(inputFile);
			processor.readFile();
			System.out.println("readind done");
			processor.saveData(outputFile);
			System.out.println("saving done");

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
