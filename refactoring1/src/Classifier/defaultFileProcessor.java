package Classifier;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.concurrent.ArrayBlockingQueue;

public class defaultFileProcessor implements IFileProcessor {
	File inputFile = null;
	List<weather> data = new ArrayList<weather>();
	private String localeDelim = ",";

	@Override
	public List<weather> readFile() {
		StringTokenizer st = null;
		String line = null;
		try {
			BufferedReader reader = new BufferedReader(
					new FileReader(inputFile));
			while ((line = reader.readLine()) != null) {
				st = new StringTokenizer(line, localeDelim);
				weather item = new weather();

			}
		} catch (Exception e) {

		}
		return null;
	}

	@Override
	public void setFile(File file) {
		this.inputFile = file;
	}

	@Override
	public List<weather> readFile(File file) {
		this.setFile(file);

		return null;
	}

	private weather createWeather(StringTokenizer st) {
		weather item = new weather();
		while(st.hasMoreElements())
		{
			item
		}
		return null;
	}

}
