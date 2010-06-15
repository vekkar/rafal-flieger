package aood.ex5;

import junit.framework.TestCase;

public class CustomerTestHtml extends TestCase
{
	public static final String NAME = "Syfon";
	public static final String TITLE_1 = "Title 1";
	public static final String TITLE_2 = "Title 2";
	public static final String TITLE_3 = "Title 3";
	public static final String TITLE_4 = "Title 4";
	
	private Customer customer;	
	
	protected void setUp() throws Exception {
		super.setUp();
		customer = new Customer(NAME);
	}

	protected void tearDown() throws Exception {
		super.tearDown();
		customer = null;
	}
	
	public void testStatementZeroRentals() {
		testStatement(0.0, 0);		
	}

	public void testStatementOneRegularRentalOneDayRented() {	    
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.REGULAR), 1));
		testStatement(2.0, 1, "<tr><td>" + TITLE_1 +"</td><td>"+ "2.0" +"</td></tr>");
		//testStatement(2.0, 1, "\t" + TITLE_1 + "\t2.0\n");
	}
	
	public void testStatementOneRegularRentalThreeDaysRented() {	    
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.REGULAR), 3));
		testStatement(3.5, 1, "<tr><td>" + TITLE_1 +"</td><td>"+ "3.5" +"</td></tr>");
	}
	
	public void testStatementOneNewReleaseRentalOneDayRented() {
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.NEW_RELEASE), 1));
		testStatement(3.0, 1, "<tr><td>" + TITLE_1 +"</td><td>"+ "3.0" +"</td></tr>");
	}
	
	public void testStatementOneNewReleaseRentalTwoDaysRented() {
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.NEW_RELEASE), 2));
	}
	
	public void testStatementTwoRegularAndTwoNewRelease() {
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.REGULAR), 0));
		customer.addRental(new Rental(new Movie(TITLE_2, Movie.REGULAR), 4));
		customer.addRental(new Rental(new Movie(TITLE_3, Movie.NEW_RELEASE), 0));
		customer.addRental(new Rental(new Movie(TITLE_4, Movie.NEW_RELEASE), 3));
		testStatement(16.0, 5,  "<tr><td>" + TITLE_1 +"</td><td>"+ "2.0" +"</td></tr>"
								+"<tr><td>" + TITLE_2 +"</td><td>"+ "5.0" +"</td></tr>"
								+"<tr><td>" + TITLE_3 +"</td><td>"+ "0.0" +"</td></tr>"
								+"<tr><td>" + TITLE_4 +"</td><td>"+ "9.0" +"</td></tr>");
					
	}
	
	private void testStatement(double amount, int frequent) {
		testStatement(amount, frequent, null);
	}
	private void testStatement(double amount, int frequent, String titles) {
		
		String testString="<html><head><title>Rental Record for " + NAME + "</title></head><body><table><thead><tr><td>Title</td><td>Amount</td></tr></thead><tbody>"
									+ ((titles == null) ? "" : titles)
									+"</tbody>"
						    	+ "<amount_owed>" + amount + "</amount_owed>"
							    + "<freq_points>" + frequent + "</freq_points>"
					    	+ "</table></body></html>";
		assertEquals(testString, customer.htmlStatement());
	}
}
