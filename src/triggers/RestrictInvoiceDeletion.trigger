trigger RestrictInvoiceDeletion on Invoice_Statement__c (before delete) {
// with each of the invoice statement that have line items
// add an error to prevent from being deleted
   for (Invoice_Statement__c invoice : 
        [ SELECT id FROM Invoice_statement__C 
         WHERE id IN ( SELECT Invoice_statement__c FROM Line_Item__c ) AND 
         Id in :Trigger.old ]) {
             Trigger.oldmap.get (Invoice.Id).addError ('Cannot delete Invoice statement with line items');
                                           }
}