package Classifier;

import java.io.File;
import java.util.List;

public interface IFileProcessor
{
	public void setFile(File file);
	public List<weather> readFile();
	public List<weather> readFile(File file);
}
