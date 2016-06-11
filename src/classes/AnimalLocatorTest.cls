@isTest
public class AnimalLocatorTest {
    
 @isTest static  void testGetCallout() {
        // Create the mock response based on a static resource
        AnimalLocatorMock mock = new AnimalLocatorMock();
        Test.setMock(HttpCalloutMock.class, mock);
        string result = Animallocator.getAnimalNamebyID(2) ; 
        System.assertEquals('bear', result,
          'The array should only contain bear.');          
    }   

    
}