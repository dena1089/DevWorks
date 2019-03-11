@IsTest
private class AccountProcessorTest {
    @IsTest 
    Private static void countTestContacts()
    {
        Account a = new Account();
        a.Name = 'DR3 Account';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='DR3';
        cont.LastName ='Raid';
        cont.AccountId = a.Id;
        Insert cont;
        
        system.debug('AccountId '+a.ID );
            Set<Id> AccntIds = new Set<Id>();
            AccntIds.add(a.Id);
        System.debug('AccntIds '+AccntIds);
        Test.startTest();
            AccountProcessor.countContacts(AccntIds);
        Test.stopTest();
            Integer ConCount = [select count() from contact where AccountId = :AccntIds];
            Account Acc = [Select Id, Number_of_Contacts__c from Account where Id = :a.Id];
            Integer AccCount = Integer.valueOf(Acc.Number_of_Contacts__c);
        	System.debug('ConCount '+ConCount+' AccCount '+AccCount);
            system.assertEquals(ConCount, AccCount, 'Count is not matching');
    }
}