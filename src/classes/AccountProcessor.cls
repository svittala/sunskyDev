public with sharing class AccountProcessor {
	@future 
	public static void countContacts( List<Id> recordIds){
	/*	accepts a list of Accoint IDs - ( the simple approach needs to be replaced for bulkificatio)
	list <Account> accounts = [Select Id,Number_of_Contacts__c from Account where Id in :recordIds];
    */
    try{
    for (list <Account> accounts:[Select Id,Number_of_Contacts__c from Account where Id in :recordIds]){    
	for ( Account a :accounts) {
			AggregateResult[] groupedResults  =[select count(contact.id) cnt from contact where Account.id = :a.id];
			Object contactcnt = groupedResults[0].get('cnt');
			a.Number_of_Contacts__c = Integer.valueof(contactcnt);
		}
	update accounts;
    }
   }
        catch (exception e){
            System.debug('An exception error: '+e.getMessage());
        }
}
    public static void countContactsBulk( List<Id> recordIds){
        /* this version is a good patttern to use AggregateResult Function and Map object to reduce the calls to the database */
       list<account> accountRecord = [Select Id,Number_of_Contacts__c from Account where Id in :recordIds];
        AggregateResult[] groupedResults  =[select account.id, count(contact.id) cnt from contact where Account.id in :recordIDs group by account.id];
	// now create a map
        Map <id, AggregateResult> groupedResultsMap = new Map< id, AggregateResult> (groupedResults);
       for (account arec: accountRecord) {
           AggregateResult agval =  groupedResultsMap.get(arec.id);
           system.debug( agval);
           Object contactcnt = agval.get('cnt');
           arec.Number_of_Contacts__c = integer.valueof(contactCnt) ;
           system.debug( 'Count set as' + arec.Number_of_Contacts__c);
            }	 
       upsert accountRecord;
       }
}