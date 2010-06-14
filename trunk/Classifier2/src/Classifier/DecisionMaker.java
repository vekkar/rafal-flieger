package Classifier;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DecisionMaker
{
	private Map<String, Integer> climate = new HashMap<String, Integer>();
	private Map<String, Integer> temp = new HashMap<String, Integer>();
	private Map<String, Integer> humadity = new HashMap<String, Integer>();
	private Map<String, Integer> wind = new HashMap<String, Integer>();

	private Map<String, List<Integer>> classInetegerValuses = new HashMap<String, List<Integer>>();

	private Map<String, Integer[]> bounds = new HashMap<String, Integer[]>();

	public DecisionMaker()
	{
		// to do load param from file
		super();
		climate.put("unknown", 0);
		climate.put("sunny", 1);
		climate.put("cloudy", 2);
		climate.put("rainy", 3);

		temp.put("unknown", 0);
		temp.put("warm", 1);
		temp.put("moderate", 2);
		temp.put("cold", 3);

		humadity.put("unknown", 0);
		humadity.put("big", 1);
		humadity.put("normal", 3);

		wind.put("unknown", 0);
		wind.put("weak", 1);
		wind.put("strong", 3);

	}

	public void learn(List<Weather> data)
	{
		for (Weather item : data)
		{
			String boundName = item.getWeaterClassDecison();
			int recValue = evaluateRecord(item);
			if (classInetegerValuses.containsKey(boundName))
			{
				classInetegerValuses.get(boundName).add(recValue);
			} else
			{
				classInetegerValuses.put(boundName, new ArrayList<Integer>());
				classInetegerValuses.get(boundName).add(recValue);
			}
		}

		for (String bound : classInetegerValuses.keySet())
		{
			int min = Collections.min(classInetegerValuses.get(bound));
			int max = Collections.max(classInetegerValuses.get(bound));

			bounds.put(bound, new Integer[]
			{ min, max });
		}
	}

	private int getBoundMin(String boundName)
	{
		return bounds.get(boundName)[0];
	}

	private int getBoundMax(String boundName)
	{
		return bounds.get(boundName)[1];
	}

	private int evaluateRecord(Weather record)
	{
		int sum = 0;

		sum += climate.get(record.getClimate());
		sum += temp.get(record.getTemperature());
		sum += humadity.get(record.getHumidity());
		sum += wind.get(record.getWind());

		return sum;
	}

	public List<Weather> assignClassToItems(List<Weather> items)
	{
		for (Weather item : items)
		{
			item.setWeaterClassDecison(getDecisionClass(item));
		}
		return new ArrayList<Weather>(items);
	}

	private List<String> getDecisionClass(Weather item)
	{
		List<String> classes = new ArrayList<String>();
		int recValue = evaluateRecord(item);
		for (String bound : bounds.keySet())
		{
			if (recValue >= getBoundMin(bound)
					&& recValue <= getBoundMax(bound))
			{
				classes.add(bound);
			}
		}
		return classes;
	}

}
