package Classifier;

import java.io.File;
import java.util.List;

public interface IFileProcessor
{
	public List<Weather> readFile(File file) throws Exception;
	public boolean saveData(File file, List data) throws Exception;
	
}
