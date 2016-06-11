public class UpdateParentAccount implements Queueable{
 /*
  * This is the example of the using Queueable interface..
  * see the use of execute to do the actual job..
  */
 private list<Account> accounts;
 private Id parentid;
    
    // now create a counstructor class
    public UpdateParentAccount( list<Account>records, Id parent){
        this.accounts = records;
        this.parentid = parent;
    }
    public void execute(QueueableContext context){
          for (Account account : accounts) {
         account.parentId = parentid;
         // perform other processing or callout
        }
       update accounts;
    }
}