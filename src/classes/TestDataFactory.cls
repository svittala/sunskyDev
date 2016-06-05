@isTest
public class TestDataFactory {

    public  static Invoice_Statement__C createOneInvoiceStatement ( boolean withLineItem) {
     // create one invoice statement record
       Invoice_Statement__C testInvoice = createInvoiceStatement();
        if (withLineItem ) {
        // create merchant line item
           Merchandise__c m = createMerchandiseItem(' Orange juice');
        // add aline item and associate it with the invoice statement
           AddLineItem(testInvoice,m);
        }
        return testInvoice;
    }
// Helper methods
    private static Merchandise__c createmerchandiseItem ( string merchName) {
    Merchandise__c m = new Merchandise__c(
        Name = merchName,
        Description__c = 'Fresh Juice',
        price__c = 2,
        Total_Inventory__C = 1000);
        insert m;
        return m;
        }
        
        private static Invoice_statement__c createInvoiceStatement () {
        invoice_Statement__c inv = new Invoice_Statement__c ( Description__c = 'Test Invoice');
        insert inv;
        return inv;
        }
        
        private static Line_Item__c AddLineItem (Invoice_statement__c inv, Merchandise__c m) {
        Line_Item__c lineItem = new Line_Item__C (
            					Invoice_Statement__c = inv.Id,
            					Merchandise__C = m.id,
            					Unit_Price__c = m.price__C,
            					Units_Sold__c = (double) (10*Math.random()+1));
            insert lineItem;
            return lineItem;
        }
}