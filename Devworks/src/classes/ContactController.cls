public with sharing class ContactController {

    @AuraEnabled
    public static Contact getContact(Id contactId) {
        return [
            SELECT Id, Name, Email, Phone 
            FROM Contact
            WHERE Id =:contactId
        ][0];
    }

    @AuraEnabled
    public static Contact saveContact(Contact con) {
        update con;
        return con;
    }
}