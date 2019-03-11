public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer cnt, String clname)
    {
        List<Contact> con =[select firstname, lastname from contact where lastname=:clname limit :cnt];
        return con;
    }
}