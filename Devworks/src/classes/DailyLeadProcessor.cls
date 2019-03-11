global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leadlst = new List<Lead>([select id, leadsource from lead where leadsource = '' limit 200]);
        if(leadlst.size() > 0)
        {
            for(Lead ld: leadlst)
            {
               ld.LeadSource = 'Dreamforce';
               //leadlst.add(ld);
            }
            update leadlst;
        }
    }
}