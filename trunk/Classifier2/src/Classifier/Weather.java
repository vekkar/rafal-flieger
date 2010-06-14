package Classifier;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;

public class Weather
{
	private String CLIMATE = "CLIMATE";
	private String TEMPERATURE = "TEMPERATURE";
	private String HUMIDITY = "HUMIDITY";
	private String WIND = "WIND";
	private String DECISION = "DECISION";

	private Map<String, String> data = new HashMap<String, String>();

	private List<String> weaterClassDecisons = new ArrayList<String>();

	public Weather()
	{
		// TODO Auto-generated constructor stub
	}

	public void setWeaterClassDecison(String val)
	{
		weaterClassDecisons.add(val);
	}

	public void setWeaterClassDecison(List<String> vals)
	{
		for (String val : vals)
		{
			weaterClassDecisons.add(val);
		}
	}

	/**
	 * @return class decision., or concatenated decisons if more assigned
	 */
	public String getWeaterClassDecison()
	{
		String val = "";
		if (weaterClassDecisons.size() > 1)
		{
			for (String str : weaterClassDecisons)
			{
				val += str + ",";
			}
		} else
		{
			val= weaterClassDecisons.get(0);
		}
		return val;
	}

	public void setClimate(String aura)
	{
		this.data.put(CLIMATE, aura);
	}

	public String getClimate()
	{
		return data.get(CLIMATE);
	}

	public void setTemperature(String temperature)
	{
		this.data.put(TEMPERATURE, temperature);
	}

	public String getTemperature()
	{
		return data.get(TEMPERATURE);
	}

	public void setHumidity(String humidity)
	{
		this.data.put(HUMIDITY, humidity);
	}

	public String getHumidity()
	{
		return data.get(HUMIDITY);
	}

	public void setWind(String wind)
	{
		this.data.put(WIND, wind);
	}

	public String getWind()
	{
		return data.get(WIND);
	}

	public void setProperty(String key, String val)
	{
		if (key.equals(DECISION))
		{
			this.setWeaterClassDecison(val);
		} else
			data.put(key, val);
	}

	public String getProperty(String key)
	{
		if (key.equals(DECISION))
		{
			return this.getWeaterClassDecison();
		} else
			return data.get(key);
	}
}
