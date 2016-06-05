@isTest 
public class TestStoreFrontController {       
		Public  static testmethod void TestController() {
       
       //Use the PageReference Apex class to instantiate a 'catalog' page
       PageReference pageRef = page.catalog; 
            
       //In this case, the Visualforce page named 'catalog' is the starting point of this test method. 
        Test.setCurrentPage(pageRef);
     
       //Instantiate and construct the controller class.   
       StoreFrontController controller = new StoreFrontController();

       //Example of calling an Action method. Same as calling any other Apex method. 
       //Normally this is executed by a user clicking a button or a link from the Visualforce
       //page, but in the test method, just test the action method the same as any 
       //other method by calling it directly. 

       //The .getURL will return the page url the Save() method returns.
      // String nextPage = controller.addToCart().getUrl();

       //Check that the save() method returns the proper URL.
       //System.assertEquals('/apex/failure?error=noParam', nextPage);

       //Add parameters to page URL
       //ApexPages.currentPage().getParameters().put('qp', 'yyyy');
     
       //Instantiate a new controller with all parameters in the page
       controller = new StoreFrontController(); 
       
            // insert a row of data
             invoice_statement__c inv = TestDataFactory.createOneInvoiceStatement(true);
             // check if a row of data is returned for the display
             List <StoreFrontController.DisplayMerchandise> l  = controller.getproducts();
       		 System.assert(l.size()> 0 );
      
        //Example of calling the 'setter' method for several properties. 
       //Normally these setter methods are initiated by a user interacting with the Visualforce page, 
       //but in a test method, just call the setter method directly. 

            l[0].setqtyToBuy(20);
            integer qty = l[0].getqtyToBuy();
            System.assertEquals(qty,20);
            system.Debug('Qty set as '+qty+' for' + l[0].name);
            PageReference nextPage = controller.addToCart();
            System.assertEquals(nextpage,null);
            string cartContents =controller.getCartContents();
            // it is '{empty}' first and then get replaced
            system.assertNotEquals(cartContents,'{empty}');
            
            
   }
}