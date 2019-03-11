@isTest
private class LeadProcessorTest {
@isTest
    private static void LeadUpd() {
        List<Lead> Leadlst = new List<Lead>();
        for (Integer i=0;i<10;i++) {
            Leadlst.add(new Lead(lastname='Lead '+i, 
                Company='Company Lead '+i));
        }
        insert Leadlst;
        System.debug('Leadlst '+Leadlst);
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}