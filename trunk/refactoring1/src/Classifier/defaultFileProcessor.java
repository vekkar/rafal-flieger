package Classifier;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.concurrent.ArrayBlockingQueue;

public class defaultFileProcessor implements IFileProcessor
{
	File inputFile = null;
	List<weather> data = new ArrayList<weather>();
	private String localeDelim = ",";

	@Override
	public List<weather> readFile() throws Exception
	{
		StringTokenizer st = null;
		String line = null;
		BufferedReader reader = null;
		try
		{
			reader = new BufferedReader(new FileReader(inputFile));
			while ((line = reader.readLine()) != null)
			{
				st = new StringTokenizer(line, localeDelim);
				weather newItem = this.createWeather(st);
				newItem.doVerdict();
				data.add(newItem);
			}
		} finally
		{
			reader.close();
		}
		return data;
	}

	@Override
	public void setFile(File file)
	{
		this.inputFile = file;
	}

	@Override
	public List<weather> readFile(File file) throws Exception
	{
		this.setFile(file);
		this.readFile();
		return null;
	}

	private weather createWeather(StringTokenizer st) throws Exception
	{
		// assume items in record have propper sequence
		// attributes = { aura, temperature, humidity, wind }.
		List<String> attributes = new ArrayList<String>();
		while (st.hasMoreElements())
		{
			attributes.add(st.nextToken());
		}
		return new weather(attributes);
	}

}
