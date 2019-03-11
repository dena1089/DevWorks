trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> evt = new List<Task>();
    //List<Order_Event__e> Evtlst = new List<Order_Event__e>([SELECT ID, Order_Number__c, CreatedById FROM Order_Event__e where Id in :Trigger.New]);
    for(Order_Event__e event : Trigger.New)
    {
        if(event.Has_Shipped__c == true)
        {
        Task eRec = new Task(Priority='Medium',Subject='Follow up on shipped order ' + event.Order_Number__c,OwnerId= event.CreatedById);
        evt.add(eRec);
        }
    }
    insert evt;
}