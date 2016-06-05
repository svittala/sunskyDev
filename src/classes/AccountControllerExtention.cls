/** Extention of the Account Controller 
**  
**/
public class AccountControllerExtention {
private final Account accnt;

public AccountControllerExtention (Apexpages.standardController controller){
this.accnt = (Account) controller.getrecord();
}

public string getTitle() {
 return 'Account: ' +accnt.name + ' (' + accnt.id +'0';
}
}