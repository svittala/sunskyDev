@istest
private class LeadProcessorTest {
    /*
     *  Another Good example of Apex Batch Testing...
     */
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Lead '+i, 
                Company = 'Sales ' + i, LeadSource='New York Meet'));
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where leadsource = 'Dreamforce']);
    }
    
}