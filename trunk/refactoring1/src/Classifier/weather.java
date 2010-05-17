package Classifier;

import java.util.List;

public class weather
{
	private String aura;
	private String temperature;
	private String humidity;
	private String wind;
	
	private String verdict;
	
	int NUMBER_OF_RECORDS = 4;

	public weather(List<String> attributes) throws Exception
	{
		if (attributes.size() == NUMBER_OF_RECORDS )
		{
			this.aura = attributes.get(0);
			this.temperature = attributes.get(1);
			this.humidity = attributes.get(2);
			this.setWind(attributes.get(3));
		}
		else
		{
			throw new Exception("illegal number of atributes in record");
		}
	}
	
	public void doVerdict()
	{
		if (aura.equals("sunny"))
		{
			verdict="great";
		}else
		{
			verdict="ugly";
		}
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

	public void setWind(String wind)
	{
		this.wind = wind;
	}

	public String getWind()
	{
		return wind;
	}
}
