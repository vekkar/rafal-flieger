package Classifier;

import java.io.File;
import java.util.List;

public interface IFileProcessor
{
	public void setFile(File file);
	public List<Weather> readFile() throws Exception;
	public List<Weather> readFile(File file) throws Exception;
	public void saveData(File file) throws Exception;
}
