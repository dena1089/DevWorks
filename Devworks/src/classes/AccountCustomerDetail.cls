public with sharing class AccountCustomerDetail {
	@AuraEnabled
    public static String getOriginId(Id AccountId)
    {
        String retval = '';
        List<Account> accntlist = new List<Account>([select Customer_ID__c from Account where ID = :AccountId]);
        System.debug('Size '+accntlist.size());
        if(accntlist.size() > 0 )
        {
            retval = accntlist[0].customer_id__c;
        }
        System.debug('retval '+retval);
        return retval;
    }
    @AuraEnabled
    public static mdm__c GetMDMKey(String RecordId)
    {
        mdm__c Resp = MDMKeyGen.GetMDMKey(RecordId);
        return Resp;
    }
}