@isTest
public class AccountProcessorTest {
    static testmethod void positiveTestCases(){
	   createTestRecords(3,7); 
       List<Account> accts = [select id from Account];
       List<id> idList = new List<id>();
      for ( Account a: accts) {
      		idList.add( a.id);
       }
    test.startTest();
       //AccountProcessor ap= new sunsky.AccountProcessor();
       AccountProcessor.countContacts(idList);
    test.stopTest();
       for (Account a:[select id,number_of_contacts__c from Account]){ 
       		System.assertEquals(a.number_of_contacts__C,7);
       	}
}

static testmethod void LargeSetTest(){
	   createTestRecords(389,7); 
       List<Account> accts = [select id from Account];
       List<id> idList = new List<id>();
      for ( Account a: accts) {
      		idList.add( a.id);
       }
    test.startTest();
       //AccountProcessor ap= new sunsky.AccountProcessor();
       AccountProcessor.countContacts(idList);
    test.stopTest();
       for (Account a:[select id,number_of_contacts__c from Account]){ 
       		System.assertEquals(a.number_of_contacts__C,7);
       	}
}
static testmethod void positiveTestCasesBulk(){
	   createTestRecords(3,7); 
       List<Account> accts = [select id from Account];
       List<id> idList = new List<id>();
      for ( Account a: accts) {
      		idList.add( a.id);
       }
    test.startTest();
       //AccountProcessor ap= new sunsky.AccountProcessor();
       AccountProcessor.countContactsBulk(idList);
    test.stopTest();
       for (Account a:[select id,number_of_contacts__c from Account]){ 
       		System.assertEquals(a.number_of_contacts__C,7);
       	}
}
static testmethod void LargeSetTestBulk(){
	   createTestRecords(389,7); 
       List<Account> accts = [select id from Account];
       List<id> idList = new List<id>();
      for ( Account a: accts) {
      		idList.add( a.id);
       }
    test.startTest();
       //AccountProcessor ap= new sunsky.AccountProcessor();
       AccountProcessor.countContactsBulk(idList);
    test.stopTest();
       for (Account a:[select id,number_of_contacts__c from Account]){ 
       		System.assertEquals(a.number_of_contacts__C,7);
       	}
}
	/*  test class to create test data*/
    private static void createTestRecords(Integer numAccts, Integer numContactsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Contact> cons = new List<Contact>();
       
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];            
            // For each account just inserted, add contacts
            for (Integer k=numContactsPerAcct*j;k<numContactsPerAcct*(j+1);k++) {
                cons.add(new Contact(firstname='Test'+k,
                                     lastname='Test'+k,
                                     AccountId=acct.Id));
                  system.debug('Created ' + k);
            }
        }
        // Insert all contacts for all accounts
        insert cons;

     }
}