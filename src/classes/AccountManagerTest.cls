@IsTest
private class AccountManagerTest {
  @isTest static void testGetAccounts() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://sunsky-dev-ed.my.salesforce.com/services/apexrest/sunsky/Accounts/'
            + recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name,'Could not find record');
    }
    
     // Helper method
    @istest
    static Id createTestRecord() {
        // Create test record
        Account AccountTest = new Account(Name='Test record');
        insert AccountTest;
        // now insert some contacts
        list<Contact> contacts = new list<contact>();
     //   for ( integer i = 1; i< 10; i++){
            contact c = new contact(lastname='last ', accountid= AccountTest.id);
       //     contacts.add ( c);
        //}
        insert c;
        
        return AccountTest.id;
    } 
}