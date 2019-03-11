@isTest
public class TestRestrictContactByName {
	@isTest static void ContactValidation()
    {
        contact con = new contact(LastName='INVALIDNAME');
        insert con;
        contact con1 = [SELECT LASTNAME FROM CONTACT LIMIT 1];
        con1.LastName = 'INVALIDNAME';
        update con;
    }
}