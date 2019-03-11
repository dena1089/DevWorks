public class AddPrimaryContact implements Queueable {
    private contact con;
    Private String conState;
    
    //Public constructor
    public AddPrimaryContact(contact condata, String cstate)
    {
        this.con = condata;
        this.conState = cstate;
    }
    
    public void execute(QueueableContext context) {
        List<Account> Acntlst = new List<Account>([SELECT ID, NAME, (SELECT FIRSTNAME, LASTNAME FROM contacts) FROM ACCOUNT WHERE BillingState = :conState LIMIT 200]);
        List<Contact> conlst = new List<Contact>();
        for(Account Acnt : Acntlst)
        {
        	contact crec = con.clone(false, false, false, false);
            crec.AccountId = Acnt.Id;
        	conlst.add(crec);
        }
        if(conlst.size() > 0)
        {
            insert conlst;
        }
    }
}