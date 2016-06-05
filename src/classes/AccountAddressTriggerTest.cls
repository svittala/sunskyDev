@istest
public class AccountAddressTriggerTest {
    static testmethod void PositiveTest() {
        createTestRecords(1,True);
        for (Account a:
             [ select id,
              Match_Billing_Address__c ,
              BillingPostalCode, 
              ShippingPostalCode from Account]){ 
       		System.assertEquals(a.BillingPostalCode,a.ShippingPostalCode);
       	}
    }
    static testmethod void NegativeTest() {
        createTestRecords(1,False);
        for (Account a:
             [ select id,
              Match_Billing_Address__c ,
              BillingPostalCode, 
              ShippingPostalCode from Account]){ 
       		 System.assertNotEquals(a.BillingPostalCode,a.ShippingPostalCode);
       	}
    }
  
    /*  test class to create test data*/
    private static void createTestRecords(Integer numAccts, boolean Match) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            a.Match_Billing_Address__c = Match;
            a.BillingPostalCode = '201'+ i;
            if (!Match){
                a.ShippingPostalCode ='401'+i;
            }
            accts.add(a);
        }
        insert accts;
        }
}