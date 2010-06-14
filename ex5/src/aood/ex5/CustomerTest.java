package aood.ex5;

import junit.framework.TestCase;

public class CustomerTest extends TestCase {
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
		testStatement(2.0, 1, "\t" + TITLE_1 + "\t2.0\n");
	}
	
	public void testStatementOneRegularRentalThreeDaysRented() {	    
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.REGULAR), 3));
		testStatement(3.5, 1, "\t" + TITLE_1 + "\t3.5\n");
	}
	
	public void testStatementOneNewReleaseRentalOneDayRented() {
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.NEW_RELEASE), 1));
		testStatement(3.0, 1, "\t" + TITLE_1 + "\t3.0\n");
	}
	
	public void testStatementOneNewReleaseRentalTwoDaysRented() {
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.NEW_RELEASE), 2));
		testStatement(6.0, 2, "\t" + TITLE_1 + "\t6.0\n");
	}
	
	public void testStatementTwoRegularAndTwoNewRelease() {
		customer.addRental(new Rental(new Movie(TITLE_1, Movie.REGULAR), 0));
		customer.addRental(new Rental(new Movie(TITLE_2, Movie.REGULAR), 4));
		customer.addRental(new Rental(new Movie(TITLE_3, Movie.NEW_RELEASE), 0));
		customer.addRental(new Rental(new Movie(TITLE_4, Movie.NEW_RELEASE), 3));
		testStatement(16.0, 5, "\t" + TITLE_1 + "\t2.0\n\t" + TITLE_2 + "\t5.0\n\t"
			+ TITLE_3 + "\t0.0\n\t" + TITLE_4 + "\t9.0\n");		
	}
	
	private void testStatement(double amount, int frequent) {
		testStatement(amount, frequent, null);
	}
	private void testStatement(double amount, int frequent, String titles) {		
		assertEquals(("Rental Record for " + NAME + "\n"
			+ ((titles == null) ? "" : titles)
		    	+ "Amount owed is " + amount + "\n"
			    	+ "You earned " + frequent + " frequent renter points"), customer.statement());
	}
}
