package Classifier;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;

public class StandardFileProcessor implements IFileProcessor
{
	private String propertyDelim = ",";
	private String valueDelim = "=";

	@Override
	public List<Weather> readFile(File inputFile) throws Exception
	{
		StringTokenizer st = null;
		String line = null;
		List<Weather> data = new ArrayList<Weather>();
		BufferedReader reader = null;
		try
		{
			reader = new BufferedReader(new FileReader(inputFile));
			while ((line = reader.readLine()) != null)
			{
				st = new StringTokenizer(line, propertyDelim);
				Weather item = readWeatherFromTokens(st);
				data.add(item);
			}
		} finally
		{
			reader.close();
		}

		return data;
	}

	private Weather readWeatherFromTokens(StringTokenizer st)
	{
		Weather weather = new Weather();
		while (st.hasMoreTokens())
		{
			String[] propertyDesc = st.nextToken().split(valueDelim);
			weather.setProperty(propertyDesc[0].toUpperCase(), propertyDesc[1]);
		}
		return weather;
	}

	@Override
	public boolean saveData(File file, List data) throws Exception
	{
		Writer out = null;
		try
		{
			if (!file.canWrite())
			{
				return false;
			}
			
			out = new BufferedWriter(new FileWriter(file));
			for (Weather item : (List<Weather>) data)
			{
				out.write(item.getWeaterClassDecison() + "\n");
			}
			
			return true;
		} finally
		{
			out.close();
		}
	}

}
