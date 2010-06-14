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

public class DefaultFileProcessor implements IFileProcessor
{
	File inputFile = null;
	private String localeDelim = ",";

	private List<Weather> localWeatherData = new ArrayList<Weather>();

	public DefaultFileProcessor(File file)
	{
		this.inputFile = file;
	}

	@Override
	public List<Weather> readFile() throws Exception
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
				st = new StringTokenizer(line, localeDelim);
				Weather item = createWeather(st);
				item.doVerdict();
				data.add(item);
			}
		} finally
		{
			reader.close();
		}

		localWeatherData = data;
		return data;
	}

	@Override
	public void setFile(File file)
	{
		this.inputFile = file;
	}

	@Override
	public List<Weather> readFile(File file) throws Exception
	{
		this.setFile(file);
		List<Weather> data = readFile();
		localWeatherData = data;
		return data;
	}

	private Weather createWeather(StringTokenizer st) throws Exception
	{
		List<String> tokens = new ArrayList<String>();
		while (st.hasMoreElements())
		{
			tokens.add(st.nextToken());
		}
		return new Weather(tokens);
	}

	@Override
	public void saveData(File file) throws Exception
	{
		Writer out = null;
		try
		{
			if (file.canWrite())
			{
				out = new BufferedWriter(new FileWriter(file));
				
				Collections.sort(localWeatherData);
				for (Weather item : localWeatherData)
				{
					StringBuilder sb = new StringBuilder();
					
					sb.append(item.getAura() + localeDelim);
					sb.append(item.getHumidity() + localeDelim);
					sb.append(item.getTemperature() + localeDelim);
					sb.append(item.getWind() + localeDelim);
					sb.append(item.getVerdict());
					sb.append(System.getProperty("line.separator"));

					out.write(sb.toString());
				}
			}
		} finally
		{
			out.close();
		}

	}

}
