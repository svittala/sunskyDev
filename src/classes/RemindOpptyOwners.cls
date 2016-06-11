global class RemindOpptyOwners implements Schedulable {
/*
 * Testing the Schedulabe class -
 * see it has to be a global class..
 * has an execute function.. 
*/
    global void execute(SchedulableContext ctx) {
        List<Opportunity> opptys = [SELECT Id, Name, OwnerId, CloseDate
            FROM Opportunity
            WHERE IsClosed = False AND
            CloseDate < Last_n_days:20 ];
        // Create a task for each opportunity in the list
           remindOwners(opptys);
    }
    
    private void remindOwners ( list<Opportunity> oppty){
        list <task> tasklist = new list<task>();
        for ( Opportunity opptRec: oppty ){
            task t = new task (WhatId = opptRec.id,WhoId = opptRec.OwnerId,
                               	subject=opptRec.name,status = 'Not Started',
                                 description = 'New Task for Open Opportunities');
            tasklist.add(t);
	       }        
        insert tasklist;
    }
}