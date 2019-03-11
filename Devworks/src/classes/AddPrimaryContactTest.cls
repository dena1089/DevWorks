@IsTest
private class AddPrimaryContactTest {
@testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account NY'+i, BillingState ='NY'
            ));
        }
        for (Integer j = 0; j < 50; j++) {
            accounts.add(new Account(name='Test Account CA'+j, BillingState ='CA'));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        String state = 'CA';
        Contact con = new Contact(FirstName='TCon1', LastName='TCon1', Title ='CAAccountT');
        insert con;
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(con, state);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest(); 
        System.debug('Count '+[select count() from contact where Title = 'CAAccountT']);
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(51, [select count() from contact where Title = 'CAAccountT']);
    }
}