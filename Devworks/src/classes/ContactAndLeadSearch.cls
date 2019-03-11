public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String Name)
    {
        List<List< SObject>> srchstr = [FIND :Name IN NAME FIELDS RETURNING Contact(FirstName,LastName,Department), Lead(Name)];
		if(srchstr.Size()>0)
        {
            System.debug(srchstr);
            return srchstr;
        }
       	else
            return null;
     }
}