trigger MDMDataInsert on Account (after insert, after update) {
    try
    {
    for(Account a: Trigger.New)
    {
       List<mdm__c> mdm1 = [select id from mdm__c where external_id__c =:a.ID];
       if(mdm1.size() == 0)
       {
           mdm__c mdata = new mdm__c() ;//external_id__c =:Trigger.New ; record_type__c ='Account'; System_Name__c ='GEN');
           mdata.RecordType__c = 'Account';
           mdata.System_Name__c ='GEN';
           mdata.External_Id__c = a.Id;
           insert mdata;
       }
    }
    }
    catch(Exception e)
    {
        System.debug('e '+e.getMessage());
    }
}