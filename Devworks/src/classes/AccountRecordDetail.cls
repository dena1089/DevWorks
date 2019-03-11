public with sharing class AccountRecordDetail {
@AuraEnabled
    public static Account getAccountDetails(Id AccountId)
    {
        Account retval;
        List<Account> accntlist = new List<Account>([select AnnualRevenue, Customer_ID__c, NAME, PHONE, TYPE, Rating from Account where ID = :AccountId]);
        System.debug('Size '+accntlist.size());
        if(accntlist.size() > 0 )
        {
           retval = accntlist[0];
        }
        System.debug('retval '+retval);
        return retval;
    }
@AuraEnabled
    public static List<Contact> getContactDetails(Id AccountId)
    {
        List<Contact> conretval;
        List<Contact> conlist = new List<Contact>([select name, email, title, phone from contact where AccountId = :AccountId]);
        System.debug('Size '+conlist.size());
        if(conlist.size() > 0 )
        {
           conretval = conlist;
        }
        System.debug('conretval '+conretval);
        return conretval;
    }
@AuraEnabled
    public static List<Opportunity> getOptyDetails(Id AccountId)
    {
        List<Opportunity> Oppretval;
        List<Opportunity> Opplist = new List<Opportunity>([select name, stagename, closeDate, Amount from Opportunity where AccountId = :AccountId]);
        System.debug('Size '+Opplist.size());
        if(Opplist.size() > 0 )
        {
           Oppretval = Opplist;
        }
        System.debug('conretval '+Oppretval);
        return Oppretval;
    }
    @AuraEnabled
    public static List<Case> getCaseDetails(Id AccountId)
    {
        List<Case> Cretval;
        List<Case> Clist = new List<Case>([select CaseNumber, ContactId, subject, status, type, priority from case where AccountId = :AccountId]);
        System.debug('Size '+Clist.size());
        if(Clist.size() > 0 )
        {
           Cretval = Clist;
        }
        System.debug('conretval '+Cretval);
        return Cretval;
    }
    @AuraEnabled
    public static List<Event> getActionDetails(Id AccountId)
    {
        List<Event> Eretval;
        List<Event> Elist = new List<Event>([select WhoId, subject, type, EndDateTime from Event where AccountId = :AccountId]);
        System.debug('Size '+Elist.size());
        if(Elist.size() > 0 )
        {
           Eretval = Elist;
        }
        System.debug('Eretval '+Eretval);
        return Eretval;
    }
    @AuraEnabled
    public static List<Order> getOrderDetails(Id AccountId)
    {
        List<Order> Oretval;
        List<Order> Olist = new List<Order>([select OrderNumber, Name, TotalAmount, EndDate from Order where AccountId = :AccountId]);
        System.debug('Size '+Olist.size());
        if(Olist.size() > 0 )
        {
           Oretval = Olist;
        }
        System.debug('Oretval '+Oretval);
        return Oretval;
    }
    @AuraEnabled
    public static List<Note> getNoteDetails(Id AccountId)
    {
        List<Note> Nretval;
        List<Note> Nlist = new List<Note>([select Title, body, createddate, IsPrivate from Note where ParentId = :AccountId]);
        System.debug('Size '+Nlist.size());
        if(Nlist.size() > 0 )
        {
           Nretval = Nlist;
        }
        System.debug('Nretval '+Nretval);
        return Nretval;
    }
    @AuraEnabled
    public static List<Attachment> getAttDetails(Id AccountId)
    {
        List<Attachment> Aretval;
        List<Attachment> Alist = new List<Attachment>([select Name, BODY, CONTENTTYPE, CREATEDDATE from Attachment where ParentId  = :AccountId]);
        System.debug('Size '+Alist.size());
        if(Alist.size() > 0 )
        {
           Aretval = Alist;
        }
        System.debug('Aretval '+Aretval);
        return Aretval;
    }
}