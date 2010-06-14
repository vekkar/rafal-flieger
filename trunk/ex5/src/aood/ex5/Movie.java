package aood.ex5;

/**
 * Represents movie.
 */
public class Movie {
	public static final int NEW_RELEASE = 0;
	public static final int REGULAR = 1;
	
	private String title;
	private int priceCode;
	
	public Movie(String title, int priceCode) {
		this.priceCode = priceCode;
		this.title = title;
	}

	public Object getPriceCode() {		
		return new Integer(priceCode);
	}

	public String getTitle() {		
		return title;
	}

}
