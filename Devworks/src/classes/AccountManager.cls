@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
@HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the AccountId from the end of the URL
        String AccountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        System.debug('AccountId '+AccountId);
        Account result =  [SELECT Id,Name,(SELECT ID, NAME FROM CONTACTS) FROM Account WHERE Id = :AccountId];
        return result;
    }
}