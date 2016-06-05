@RestResource (urlmapping='/Merchandise/*')
global with sharing class MerchandiseManager {

@httpGet
global static Merchandise__c getMerchandizeByID(){
	Restrequest req = RestContext.request;
	String merchid = req.requestURI.substring ( req.requestURI.lastIndexOf ('/')+ 1);
	Merchandise__c result = [ SELECT Name, Description__c,Price__c, Total_Inventory__c FROM Merchandise__c WHERE Id = :merchId];
	return result;
}

@httpPost
global static String createMerchandise (string name, string description, decimal price, double inventory){
	Merchandise__c m = new Merchandise__c ( Name = name, Description__c = description, Price__c = price, Total_Inventory__c = inventory);
	insert m;
	return m.Id;
}
}