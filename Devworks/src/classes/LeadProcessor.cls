global class LeadProcessor implements Database.Batchable<sObject>{
	global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID FROM LEAD'
        );
	}
    global void execute(Database.BatchableContext bc, List<Lead> lst){
        for(Lead ld : lst)
        {
            ld.LeadSource = 'Dreamforce';
            System.debug('Lead Id '+ld.Id);
            //lst.add(ld);
        }
        update lst;
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        System.debug('job '+job);
        // call some utility to send email
        //EmailUtils.sendMessage(a, recordsProcessed);
    }    
}