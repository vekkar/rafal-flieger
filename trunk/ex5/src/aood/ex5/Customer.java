package aood.ex5;

import java.util.List;
import java.util.Vector;

/**
 * Represents customer.
 */
public class Customer
{
	private String name;
	private List rentals = new Vector();

	/**
	 * Creates Customer object.
	 * 
	 * @param name
	 *            customer name
	 */
	public Customer(String name)
	{
		this.name = name;
	}

	/**
	 * Adds rental to customer's rentals.
	 */
	public void addRental(Rental rental)
	{
		rentals.add(rental);
	}

	/**
	 * @return customer's statement string which contains amount owed by
	 *         customer and number of frequent renter points
	 */
	@SuppressWarnings("unchecked")
	public String statement()
	{
		String result = "Rental Record for " + getName() + "\n";

		for (Rental rental : (Vector<Rental>) rentals)
		{
			double sum = calculateRentalSum(rental);
			result += "\t" + rental.getMovie().getTitle() + "\t"
					+ String.valueOf(sum) + "\n";
		}

		result += "Amount owed is " + String.valueOf(getSumForRentals()) + "\n";
		result += "You earned " + String.valueOf(calculateFreqPoints())
				+ " frequent renter points";
		return result;
	}

	/**
	 * gets sum for all client's rentals
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private double getSumForRentals()
	{
		double sumForAllRentals = 0.0;
		for (Rental rental : (Vector<Rental>) rentals)
		{
			sumForAllRentals += calculateRentalSum(rental);
		}
		return sumForAllRentals;
	}

	/**
	 * calculates clients requent recent points
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private int calculateFreqPoints()
	{
		int frequentRenterPoints = 0;
		for (Rental rental : (Vector<Rental>) rentals)
		{
			frequentRenterPoints++;
			if (rental.ifExtraPointForRental())
				frequentRenterPoints++;
		}
		return frequentRenterPoints;
	}

	/**
	 * calculates rental sum, with indicated algorithm
	 * 
	 * @param rental
	 * @return
	 */
	private double calculateRentalSum(Rental rental)
	{
		double sum;
		sum = 0;
		int priceCode = ((Integer) rental.getMovie().getPriceCode()).intValue();
		switch (priceCode)
		{
		case Movie.REGULAR:
			sum = 2;
			if (rental.getDaysRented() > 2)
				sum = 2 + (rental.getDaysRented() - 2) * 1.5;
			break;
		default:
			sum = rental.getDaysRented() * 3;
			break;
		}
		return sum;
	}
	
	/**
	 * @return customer's statement HTML string which contains amount owed by
	 *         customer and number of frequent renter points
	 */
	public String htmlStatement()
	{
		String result= "<html><head><title>Rental Record for " + getName()+"</title>";
		result+="<body><table>";
		
			result+="<thead><tr><td>Title</td><td>Amount</td></tr></thead><tbody>";
			
			StringBuilder sb = new StringBuilder();
			for (Rental rental : (Vector<Rental>) rentals)
			{
				String name = rental.getMovie().getTitle();
				String sum = String.valueOf(calculateRentalSum(rental));
				sb.append("<tr><td>" + name + "</td><td>" +sum + "</td></tr>");
			}
			result+= sb.toString();
			result+="</tbody>";
			result+="<amount_owed>" + String.valueOf(getSumForRentals())
					+ "</amount_owed>";
			result+="<freq_points>" + String.valueOf(calculateFreqPoints())
					+ "</freq_points>";
		
		result+="</table></body></html>";

		return result;
	}

	/**
	 * @return customer's name
	 */
	private String getName()
	{
		return name;
	}
}
