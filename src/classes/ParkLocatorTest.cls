@istest
public class ParkLocatorTest {
    /*
     * Create a test class named ParkLocatorTest 
     * that uses a mock class called ParkServiceMock 
     * to mock the callout response.
     */
    @isTest 
    public static void testCallout() {              
   // This causes a fake response to be generated
    Test.setMock(WebServiceMock.class, new ParkServiceMock());
     string countryName = 'japan';
     string[] parklist = ParkLocator.Country('Japan');
     // Verify that a fake result is returned
      System.assertEquals(2, parklist.size(),'size does not equal 2'); 
    }
}