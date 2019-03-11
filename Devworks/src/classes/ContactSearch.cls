public class ContactSearch {

    public static List<Contact> searchForContacts(String ConLastname, String ConPostalCode)
    {           
            Contact[] lstcon = [SELECT ID, NAME FROM Contact WHERE LastName = :ConLastname AND MailingPostalCode = :ConPostalCode];
            if(lstcon.Size() > 0)
                return lstcon;
            else
                return null;
    }
}