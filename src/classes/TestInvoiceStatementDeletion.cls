@isTest
public class TestInvoiceStatementDeletion {
    // test to see if invoice with line items does not get deleted
    static testmethod void TestDeleteInvoiceWithLineitem() {
         Test.starttest();
         invoice_statement__c inv = TestDataFactory.createOneInvoiceStatement(true);
         Database.DeleteResult result = Database.Delete(inv,false);
        Test.stoptest();
        // verify the deletion with a line item failed.
        system.ASSERT (!result.isSuccess());
	}
    // test to see if invoice without line items does get deleted
    static testmethod void TestDeleteInvoiceWithoutLineitem() {
           Test.starttest();
         invoice_statement__c inv = TestDataFactory.createOneInvoiceStatement(false);
        Database.DeleteResult result = Database.Delete(inv,false);
        Test.stoptest();
        // verify the deletion with a line item succeeded.
        system.ASSERT (result.isSuccess());
	}
   // test bulk deletion one with and one without lineitems and see what happens
    static testmethod void TestBulkDeleteInvoice() {
         Test.starttest();
 
        List <invoice_statement__c> invList = new List <invoice_statement__C>();
        invlist.add (TestDataFactory.createOneInvoiceStatement(true));
        invlist.add (TestDataFactory.createOneInvoiceStatement(false));
        Database.DeleteResult[] results = Database.Delete(invList,false);
        Test.stoptest();
        // verify the deletion without line failed and with line item succeeded.
        system.ASSERT (!results[0].isSuccess());
		system.ASSERT (results[1].isSuccess());

	}
  
     
}