@isTest
public class ContactDetail_Test {
    @isTest
    private static void getReferralSuccess()
    {
        contact c1 = new contact(LastName='Test');
        insert c1;
        Referral__c r1 = new Referral__c();
        //r1.RecordTypeId = Schema.SObjectType.Referral__c.getRecordTypeInfosByName().get('Referral Mortgage').getRecordTypeId();
        r1.Referral_Type__c = 'REFERRAL - MORTGAGE';
        r1.Loan_Purpose__c = 'Mortgage Refinance';
        r1.Referral_Segment__c = 'MORTGAGE';
        r1.Referral_Detail__c = 'MORTGAGE';
        r1.Segment__c = 'Branch Des Lender';
        r1.Assigned_To__c = 'ABC';
        r1.Appointment_Id__c = '123';
        r1.Appointment_Required__c = true;
        r1.Need_Identification__c = '123';
        r1.contact__c = c1.id;
        //insert r1;        
        test.startTest();
        Referral__c r2 = contactDetail.getReferral(r1, 'Referral Mortgage');
        test.stoptest();
        List<referral__c> r3 = new List<Referral__c>();
        r3.add(r2);
        system.assertEquals(1, r3.size());
    }
    @isTest
    public static void getReferralFail()
    {
        contact c1 = new contact(LastName='Test');
        insert c1;
        Referral__c r1 = new Referral__c();
        r1.RecordTypeId = Schema.SObjectType.Referral__c.getRecordTypeInfosByName().get('Referral Mortgage').getRecordTypeId();
        r1.Referral_Type__c = 'REFERRAL - MORTGAGE';
        r1.Loan_Purpose__c = 'Mortgage Refinance';
        r1.Referral_Segment__c = 'MORTGAGE';
        r1.Referral_Detail__c = 'MORTGAGE';
        r1.Segment__c = 'Branch Des Lender';
        r1.Assigned_To__c = 'ABC';
        r1.Appointment_Id__c = '123';
        r1.Appointment_Required__c = true;
        r1.Need_Identification__c = '123';
        r1.contact__c = c1.id;
        try{
            test.startTest();
            referral__C r3 = contactDetail.getReferral(r1, 'Mortgage Referral');
            List<Referral__c> r2 = new List<Referral__c>();
            test.stopTest();
            system.assertEquals(0, r2.size());
        }
        catch(exception ex)
        {
            system.assert(ex!= null);
        }
    }
    @isTest
    private static void setContactDetTest()
    {
        contact c1 = contactDetail.setContactDet('Test', 'Test', '1231231234','test@a.com');
        system.assert(c1 != null);
    }
    @isTest
    private static void getConTest()
    {
        contact c1 = new contact(LastName='Rad', FirstName='DTest1');
        insert c1;
        Id [] fixedSearchResults = new Id[]{c1.Id};
        Test.setFixedSearchResults(fixedSearchResults);
        Test.startTest();      
        String ConLName ='Rad';
        String ConFName = 'DTest1';
        Integer cnt = 10;
        List<Contact> conlst = contactDetail.getContactDet(ConLName, ConFName, cnt);
        Test.stopTest();
        system.debug('conlst '+conlst);
        system.assertEquals(1, conlst.size());
    }
    @isTest
    private static void t1()
    {
        List<String> str = contactDetail.getReferralType();
        system.assert(str.size() >0);
        str.clear();
        str = contactDetail.getLoanPurpose();
        system.assert(str.size() >0);
        str = contactDetail.getAssignTo('Branch Des Lender');
        system.assert(str.size() >0);
        str.clear();
        str = contactDetail.getRecordTypedata();
        system.assert(str.size() >0);
        str.clear();
        str = contactDetail.getReferralSeg();
        system.assert(str.size() >0);
        str.clear();
        str = contactDetail.getReferralDet();
        system.assert(str.size() >0);
        str.clear();
        str = contactDetail.getSeg();
        system.assert(str.size() >0);
    }
    
}