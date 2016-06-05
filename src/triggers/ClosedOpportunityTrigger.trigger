trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
/* Trail Head Challenge - add a task to any opportunity 
 * inserted or updated with the stage of 'Closed Won'.
 * The task's subject must be 'Follow Up Test Task'.
 * To associate the task with the opportunity, fill the 'WhatId' field with the opportunity ID.
 * This challenge specifically tests 200 records in one operation.
 * 
 */
    List<task> tlist = new List<task>();
    for (opportunity opp: trigger.new){
        if (opp.StageName == 'Closed Won'){
            tlist.add ( new Task(whatId = opp.id,Subject = 'Follow up Test Task'));
        } 
    }
    if (tlist.size()> 0){
        insert tlist;
    }
	
}