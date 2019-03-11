public class AccountProcessor {
    @future(callout=true)
	public static void countContacts(Set<Id> AccountIds)
    {
        Integer i = 0;
        List<Account> Acclst = [select Id, number_of_contacts__c, (select id from contacts) from account where id IN :AccountIds];
        /*for(Account Acc : Acclst)
        {
            List<contact> lstcon = Acc.contacts;
            System.debug('Size of Contacts '+lstcon.size());
            Acc.number_of_contacts__c  = lstcon.size();
            i++;
            if(i == 200)
            {
                update Acclst;
                i = 0;
            }
        }*/
        for(Account Acc : Acclst)
                {
                    List<contact> lstcon = Acc.contacts;
                    System.debug('Size of Contacts '+lstcon.size());
                    Acc.number_of_contacts__c  = lstcon.size();
                }
        update Acclst;
        
        System.debug('Execution Completed');
    }
}