@RestResource(urlMapping='/MDMKeyGeneration/*')
global with sharing class MDMKeyGeneration {
@HttpGet
    global static MDM__c getMDMKey() {
        RestRequest request = RestContext.request;
        // grab the AccountId from the end of the URL
        String AccountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.debug('AccountId '+AccountId);
        MDM__c result = [SELECT MasterRecordId__c, Record_Status__c FROM MDM__c WHERE External_Id__c = :AccountId];
        return result;
    }
}