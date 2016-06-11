/* In the test class, insert 50 Account records for BillingState "NY"
 *  and 50 Account records for BillingState "CA".
 *  Create an instance of the AddPrimaryContact class,
 *  enqueue the job and assert that a Contact record was inserted for
 *  each of the 50 Accounts with the BillingState of "CA".
*/
@istest
public class AddPrimaryContactTest {

@testsetup
    static void testSetup(){
        list<Account> accounts = new List<account>();
        for (integer i= 0; i<50; i++)
        {
                accounts.add(new Account(
                name='Test Account'+i,BillingState='NY' 
            ));
         }
       for (integer i= 50; i<100; i++)
        {
                accounts.add(new Account(
                name='Test Account'+i,BillingState='CA' 
            ));
         }
		insert accounts;
    }    
    static testmethod void testQuabale(){
/*   Create an instance of the AddPrimaryContact class,
 *  enqueue the job and assert that a Contact record was inserted for
 *  each of the 50 Accounts with the BillingState of "CA".
*/
        Account taccount = new Account (name ='Test Account');
        Contact tcontact = new Contact (firstname ='Contactfirst',lastname='Contact Last', Accountid=taccount.Id);
	
        AddPrimaryContact apc= new AddPrimaryContact(tcontact,'CA');      
        Test.startTest();       
        System.enqueueJob(aPc);
        Test.stopTest();       
     // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, 
            [select count() from contact where account.billingstate ='CA']);
    }
   
}