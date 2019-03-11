trigger AccountValidation on MDM__c (after insert) {
	String MasterRecordId = '';
    String RecordStatus = '';
    List<MDM__c> mdmdata = [Select External_Id__c, RecordType__c from mdm__c where id=:Trigger.New];
    system.debug('mdmdatasize' + mdmdata.size()+ ' ExternalId getting entered '+mdmdata[0].External_Id__c );
    if(mdmdata[0].RecordType__c == 'Account')
    {
        Account Acc = [Select ID, Name, Account_Unique_Id__c from Account where id=:mdmdata[0].External_Id__c];
        system.debug('Do we have that account in Account table '+Acc.Name + ' Account unique Id '+Acc.Account_Unique_Id__c);
        if(Acc.Name <> '')
        {
            Account[] Acc1 = [Select ID, Name, Account_Unique_Id__c from Account where name =: Acc.Name and Account_Unique_Id__c =: Acc.Account_Unique_Id__c and ID <> :Acc.Id LIMIT 1];
            if(Acc1.size() > 0)
                system.debug('Do we have that account in Account table '+Acc1[0].Name + ' Account unique Id '+Acc1[0].Account_Unique_Id__c);
            if(Acc1.size() > 0)
            {
                mdm__c m1 = [select id, external_id__c from mdm__c where Record_Status__c <> 'Void' and external_id__c =:Acc1[0].Id];
                system.debug('m1 data '+m1.Id+' external_id '+m1.External_Id__c);
                if(m1.external_id__c <> '' )
                {
                RecordStatus = 'Duplicate';
                MasterRecordId = Acc1[0].Id;
                }
                else
            	{
                	RecordStatus = 'Original';
                	MasterRecordId = Acc.Id;
            	}
            }
            else
            {
                RecordStatus = 'Original';
                MasterRecordId = Acc.Id;
            }
            System.debug('RecordStatus '+RecordStatus);           
        }
        else
            {
                RecordStatus = 'Void';
                MasterRecordId = Acc.Id;
            }
        mdm__c m2 = [select id from mdm__c where id =: mdmdata[0].Id];
        m2.MasterRecordId__c = MasterRecordId;
        m2.Record_Status__c = RecordStatus;
        update m2;
    }
}