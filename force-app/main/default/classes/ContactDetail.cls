public inherited sharing class ContactDetail {
    @AuraEnabled
    public static Referral__c getReferral(Referral__c refData, String RecType)
    {
        Id recTypeId = Schema.SObjectType.Referral__c.getRecordTypeInfosByName().get(RecType).getRecordTypeId();
        referral__c refRec = (Referral__c) refData;
        system.debug('Referral Type '+refRec);
        refRec.RecordTypeId = recTypeId;
        system.debug('Referral Type '+refRec.Referral_Type__c);
        system.debug('Calling methods with Args ====>'+recTypeId+' refData '+refData);
        insert refRec;
        return refRec;
    }
    @AuraEnabled
    public static contact setContactDet(String ConLName, String ConFName, String sPhone, String sEmail)
    {
        contact c = new contact(FirstName=ConFName, LastName=ConLName, Phone=sPhone, Email=sEmail);
        insert c;
        return c;
    }    
    @AuraEnabled
    public static List<Contact> getContactDet(String ConLName, String ConFName, Integer cnt)
    {
        ConLName = ConLName + '*';
        ConFName = ConFName + '*';
        String str='';
        if(!String.isEmpty(ConLName) )
            str = str + '("' + ConLName + '")';
        if(!String.isEmpty(ConFName) )
            str = str + ' OR ("' + ConFName + '")';
        system.debug('str '+str);
        List<Contact> conlst = new List<Contact>();
        Set<Contact> conset = new Set<Contact>();
        if(str.length() >0 )
        {
            List<List<sObject>> lstobj = [FIND :str IN ALL FIELDS RETURNING CONTACT(ID, FIRSTNAME, LASTNAME, PHONE, Email)];
            system.debug('lstobj '+lstobj+ 'Size '+lstobj.size());
            if(lstobj.size() >0)
            {
                system.debug('Details '+(List<Contact>) lstobj[0]);
                conset.addAll((List<Contact>) lstobj[0]);
                system.debug('conset '+conset);
                conlst.addAll(conset);
                system.debug('conlst '+conlst);
            }
            else
            {
                system.debug('No Records Found');
            }
        }
        else
        {
            system.debug('Not a valid Search String');
        }
        return conlst;
    }
    @AuraEnabled
    public static List<String> getReferralType(){
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Referral__c.Referral_type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        pickListValuesList.add('--Choose One--');
        return pickListValuesList;
    }
    @AuraEnabled
    public static List<String> getLoanPurpose(){
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Referral__c.Loan_Purpose__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        pickListValuesList.add('--Choose One--');
        return pickListValuesList;
    }
    @AuraEnabled
    public static List<String> getReferralSeg(){
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Referral__c.Referral_Segment__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        pickListValuesList.add('--Choose One--');
        return pickListValuesList;
    }
    @AuraEnabled
    public static List<String> getReferralDet(){
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Referral__c.Referral_Detail__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        pickListValuesList.add('--Choose One--');
        return pickListValuesList;
    }
    @AuraEnabled
    public static List<String> getSeg(){
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Referral__c.Segment__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        pickListValuesList.add('--Choose One--');
        return pickListValuesList;
    }
    @AuraEnabled
    public static List<String> getRecordTypedata(){
        Map<String,Schema.RecordTypeInfo> rtlst = Schema.SObjectType.Referral__c.getRecordTypeInfosByName();
        List<String> strlst = new List<String>();
        for(String s1 : rtlst.keySet())
        {
            if(s1 != 'Master')
                strlst.add(s1);
        }
        strlst.add('--Choose One--');
        return strlst;
    }
    @AuraEnabled
    public static List<String> getAssignTo(String sType){
        List<String> alst = new List<String>();
        List<Assignee__mdt> lst = [select QualifiedApiName, MasterLabel, type__c from Assignee__mdt where type__c=:sType];
        for(Assignee__mdt a1: lst)
        {
            alst.add(a1.QualifiedApiName);
        }
        alst.add('--Choose One--');
        return alst;
    }
}