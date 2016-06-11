/*
Create an Apex class called 'AddPrimaryContact' 
that implements the Queueable interface.

Create a constructor for the class that accepts as its 
first argument a Contact sObject and 
a second argument as a string for the State abbreviation.
The execute method must query for 
a maximum of 200 Accounts with the BillingState 
specified by the State abbreviation passed
into the constructor and insert the Contact sObject record
associated to each Account. Look at the sObject clone() method.
*/
public class AddPrimaryContact implements Queueable {
	private Contact myContact;
    private string StateAbbrev;
    
    public AddPrimaryContact( Contact acontact, string astateAbbrev){
    	this.myContact = acontact;
        this.StateAbbrev = astateAbbrev;
    }
    public void execute(QueueableContext context){
        List<Contact> newContacts = new List<Contact>();
	    List<Account> accountlist = [select id from account where 
                                      billingstate = :stateAbbrev limit 200];
        for (Account a : accountlist){
        Contact newContact = myContact.clone(true,false,false,false);
        newContact.AccountId = a.id;
        newContacts.add (newContact);
        }
        insert newContacts;
    }
}