public class myController {
private final Account account;
    public myController(){
    account = [select Id,Name,site,billingstreet,billingstate,billingcity,billingaddress from Account 
                where Id =:ApexPages.currentPage().getParameters().get('id')];
    }
    public Account getAccount(){
    return account;
    }
    public PageReference Save(){
    update Account;
    return null;
    }
}