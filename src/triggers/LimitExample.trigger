Trigger LimitExample on Invoice_Statement__c ( before insert, before update) {
    List < Line_Item__c> updateList = new List < Line_Item__c>();

    For ( List <Invoice_Statement__c> invoiceListWithLineItems  : 
         [SELECT Id, Description__c, ( SELECT Id,  Units_Sold__c From Line_Items__r)FROM Invoice_Statement__c WHERE Id IN :Trigger.newMap.KeySet() ]) 
    {
        For ( Invoice_Statement__c inv : invoiceListWithLineItems ) {
            // iterate over the result set.. 
            For (Line_Item__c li : inv.Line_Items__r) {
                if (li.Units_sold__c != null) 
                {li.Units_Sold__c =li.Units_Sold__c+ 10; 
                 updateList.add( li);
                }
            }
        }
    }    
    // do the final update
    Update updateList; 
}