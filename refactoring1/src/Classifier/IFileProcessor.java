package Classifier;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

public interface IFileProcessor
{
	public void setFile(File file);
	public List<weather> readFile() throws Exception;
	public List<weather> readFile(File file) throws Exception;
}
