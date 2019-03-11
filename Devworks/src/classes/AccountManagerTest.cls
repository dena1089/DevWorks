@IsTest
private class AccountManagerTest {
	@isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://den108901-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account tstAcnt = AccountManager.getAccount();
        // Verify results
        System.assert(tstAcnt != null);
        System.assertEquals('TestAccountNov112019_01', tstAcnt.Name);
    }
    // Helper method
        static Id createTestRecord() {
        // Create test record
        Account TestAcc = new Account(
          Name='TestAccountNov112019_01');
        insert TestAcc;
        Contact TestCon= new Contact(
        LastName='Test', 
        AccountId = TestAcc.id);
        return TestAcc.Id;
    }      
}