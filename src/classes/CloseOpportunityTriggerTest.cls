@istest
public class CloseOpportunityTriggerTest {

    
        static testmethod void PositiveTest() {
        createTestRecords(300);
        for (Opportunity o:
             [ select id from Opportunity where stagename ='Closed Won']){ 
                 list<task> tlist = [select whatid,subject from task where whatid= :o.id 
                               and subject ='Follow up Test Task'];
            		System.assertEquals(tlist.size(),1);         
                 }
       		}
       static testmethod void NegativeTest() {
        createTestRecords(1);
        for (Opportunity o:
             [ select id from Opportunity where stagename ='Closed Won']){ 
                 list<task> tlist = [select whatid,subject from task where whatid= :o.id 
                               and subject ='Follow up Test Task add extra'];
            		System.assertNotEquals(tlist.size(),1);         
                 }
       		}
   
    /*  test class to create test data*/
    private static void createTestRecords(Integer numOppts) {
      
            List<Opportunity> OpptList = new List<Opportunity>();
        
            Account a = new Account(Name='TestAccount');
            insert a;
            for (Integer i=0;i<numOppts;i++){
                opptList.add (new Opportunity(Name = 'Test Opportunity' + i, 
                                            accountid=a.id,
                                            CloseDate=System.today().addMonths(1),
                                            StageName='Closed Won'));
            	}
        if (opptList.size() > 0){
            insert opptList;
        }
    }
        
        
}