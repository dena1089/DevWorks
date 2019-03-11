trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasklst = new List<Task>();
    for (Opportunity opp : [SELECT ID FROM Opportunity WHERE ID in :Trigger.New and StageName ='Closed Won' ])
    {
        Task tdata = new Task(WhatId = opp.Id, subject ='Follow Up Test Task');
        tasklst.add(tdata);
    }
    if(tasklst.size() >0 )
    {
        insert tasklst;
    }
}