package aood.ex5;

/**
 * Represents movie rentals.
 */
public class Rental {
	private Movie movie;
	private int daysRented;
	
	public Rental(Movie movie, int daysRented) {
		this.movie = movie;
		this.daysRented = daysRented;
	}
	
	public Movie getMovie() {
		return movie;
	}
	
	public int getDaysRented() {		
		return daysRented;
	}
	
	public boolean ifExtraPointForRental()
	{
		if ((((Integer) this.getMovie().getPriceCode()).intValue() == Movie.NEW_RELEASE)
				&& (this.getDaysRented() > 1))
		{
			return true;
		} else
		{
			return false;
		}
		
	}

}
