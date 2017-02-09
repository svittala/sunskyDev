@restResource(urlMapping='/Accounts/*/contacts')
/* it has to be a global with sharing */
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
         RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountID = request.requestURI.substringBetween('Accounts/','/contacts');
        system.debug(' before calling sql' + accountID);
        Account result =  [SELECT id, name, (select name from contacts)
                           from account WHERE Id = :accountID];
        system.debug(result);
        return result;
        
    }
  }