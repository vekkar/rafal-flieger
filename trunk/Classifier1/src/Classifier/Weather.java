package Classifier;

import java.util.List;

public class Weather implements Comparable<Weather>
{
	private String aura;
	private String temperature;
	private String humidity;
	private String wind;

	private String verdict;

	int NUMBER_OF_RECORD = 4;

	public Weather(List<String> data) throws Exception
	{
		if (data.size() == NUMBER_OF_RECORD)
		{
			this.aura = data.get(0);
			this.temperature = data.get(1);
			this.humidity = data.get(2);
			this.wind=data.get(3);
		} else
		{
			throw new Exception("illigal number of params.");
		}
	}

	public void doVerdict()
	{
		if (aura.equals("sunny"))
		{
			verdict = "great";
		} else
		{
			verdict = "ugly";
		}
	}

	public String getVerdict()
	{
		return verdict;
	}

	public void setAura(String aura)
	{
		this.aura = aura;
	}

	public String getAura()
	{
		return aura;
	}

	public void setTemperature(String temperature)
	{
		this.temperature = temperature;
	}

	public String getTemperature()
	{
		return temperature;
	}

	public void setHumidity(String humidity)
	{
		this.humidity = humidity;
	}

	public String getHumidity()
	{
		return humidity;
	}

	@Override
	public int compareTo(Weather o)
	{
		//aura.compareTo(o.getAura());
		return aura.compareTo(o.getAura());
	}

	public void setWind(String wind)
	{
		this.wind = wind;
	}

	public String getWind()
	{
		return wind;
	}
}
