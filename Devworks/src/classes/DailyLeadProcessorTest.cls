@isTest
private class DailyLeadProcessorTest{
@testSetup 
    static void setup() {
       List<Lead> leadlst = new List<Lead>();
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            leadlst.add(new Lead(FirstName ='FLead '+i,LastName='Lead '+i,company='Lead '+i));
        }
        insert leadlst;
    }
    static testmethod void test() {      
        Test.startTest();
        DailyLeadProcessor uca = new DailyLeadProcessor();
        String sch = '13 59 20 * 11 ? 2018';
		String jobID = System.schedule('Lead Test', sch, uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}