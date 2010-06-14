package Classifier;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.print.DocFlavor.INPUT_STREAM;

public class Classifier
{
	public static void main(String args[])
	{

		String learningFileName = "";
		String inputFileName = "";
		String outputFileName = "";

		if (args.length != 3)
		{
			learningFileName = "learning.txt";
			inputFileName = "input.txt";
			outputFileName = "output.txt";
		} else
		{
			learningFileName = args[0];
			inputFileName = args[1];
			outputFileName = args[2];
		}

		File learningFile = new File(learningFileName);
		File inputFile = new File(inputFileName);
		File outputFile = new File(outputFileName);

		try
		{

			IFileProcessor processor = new StandardFileProcessor();
			List<Weather> learningRecords = processor.readFile(learningFile);
			List<Weather> inputRecords = processor.readFile(inputFile);

			DecisionMaker dm = new DecisionMaker();
			dm.learn(learningRecords);
			List<Weather> outputRecords = dm.assignClassToItems(inputRecords);

			processor.saveData(outputFile, outputRecords);

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
