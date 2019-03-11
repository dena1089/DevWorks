/*public class AccountHandler {

    public static Account insertNewAccount(String AcntName)
    {
        try
        {
        Account acnt = new Account();
        acnt.Name = AcntName;
        insert acnt;
        System.debug('Account Id '+acnt.Id);
        }
        catch(DmlException e) {
            return null;
    	}
        return acnt;
    }
}*/
public class AccountHandler {

    public static Account insertNewAccount(String AccountName){

        Account acct = new Account(Name=AccountName);

        try {
            insert acct;

        } catch (DMLException e){
            return null;
        }

        return acct;
    }
}