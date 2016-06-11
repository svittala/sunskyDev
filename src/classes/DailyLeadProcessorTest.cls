@istest
public class DailyLeadProcessorTest {
@testsetup 
  static void setup() {
        List<lead> leads = new List<lead>();
         for (Integer i=0; i<200; i++) {
            lead l = new lead (FirstName = 'Lead ' + i,
                               LastName ='Lname '+ i, 
                               company='Company',
                               leadsource = '' );
            leads.add(l);
         }
        insert leads;
	}
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
      // Create some out of date Opportunity records
         Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new DailyLeadProcessor());       
         List<Lead> l1 = [SELECT Id
						FROM lead	
            			WHERE leadsource=''];
         System.assertEquals(200,
            l1.size(), 'Leads not updated yet');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that schedule were created
        List<Lead> l2 = [SELECT Id
						FROM lead	
            			WHERE leadsource=''];
         System.assertEquals(0,
            l2.size(), 'Leads updated');
    }
 }