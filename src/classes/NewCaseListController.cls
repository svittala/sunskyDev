/**
* Class Name: NewCaseListController
* Author: SunSky Technologies
* Date: 07/05/2015
* Requirement/Project Name: &lt;Learning VF&gt;
* Requirement/Project Description: &lt;This is one of the trailhead exercises&gt;
*/
public with sharing class NewCaseListController {
    private string STATUSFILTER ='New';
    public List<case> getNewCases(){
        List<case> results = Database.Query (
            'Select id,casenumber from case '+
            'where status=\'' + STATUSFILTER + '\' limit 5'
            );
        return results; 
    }
}