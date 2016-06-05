trigger AccountAddressTrigger on Account (before insert, before update) {
/* this is for trailhead learning and improvement
For this challenge, you need to create a trigger that, before insert or update, checks for a checkbox, and 
if the checkbox field is true, sets the Shipping Postal Code (whose API name is ShippingPostalCode) to be the same as the Billing Postal Code (BillingPostalCode).
The Account object will need a new custom checkbox that should have the Field Label
'Match Billing Address' and Field Name of 'Match_Billing_Address'.
The resulting API Name should be 'Match_Billing_Address__c'.
With 'AccountAddressTrigger' active, if an Account has a Billing Postal Code and 'Match_Billing_Address__c' is true, the record should have the Shipping Postal Code set to match on insert or update.
*/
    for ( account a : trigger.new){
        if (a.Match_Billing_Address__c && a.BillingPostalCode != ''){
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}