({
	doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.GetMDMKey");
        action.setParams({RecordId : component.get("v.AccountId")});

        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            var sout = '';
            var soutstat = '';
            var sresout = '';
            if (state === "SUCCESS") {
                component.set("v.AccntDetail",response.getReturnValue());
                sout = component.get("v.AccntDetail") ;
                if(sout != null)
                {
                    sresout = component.get("v.AccntDetail.MasterRecordId__c");
                    if(sresout != null)
                    	sresout = sresout.slice(-4);
                    soutstat = 'XXXX';
                }
                else
                {
                    sresout = 'XXXX';
                    soutstat = 'NoRecord';
                }
                component.set("v.CustomerId", sresout);
                component.set("v.CustStat", soutstat);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    ChangeLabel: function(component, event, helper) {
       var btn = event.getSource();
        var bool = btn.get('v.label');
        var iden ='';
        var sout = '';
        if(bool === "ShowFull"){
            btn.set('v.label', 'Hide');
            iden = '1';
        }
        if(bool === "Hide"){
            btn.set('v.label', 'ShowFull');
            iden = '2';
        }
        // Create the action
        var action = component.get("c.GetMDMKey");
        action.setParams({RecordId : component.get("v.AccountId")});
   // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            var sout = '';
            var soutstat = '';
            var sresout = '';
            if (state === "SUCCESS") {
                component.set("v.AccntDetail",response.getReturnValue());
                sout = component.get("v.AccntDetail") ;
                if(sout != null)
                {
                    sresout = component.get("v.AccntDetail.MasterRecordId__c");
                    if(sresout != null)
                    {
                    	if(iden === "2")
                            sresout = sresout.slice(-4);
                    }
                    soutstat = component.get("v.AccntDetail.Record_Status__c");
                    if(soutstat != null)
                    {
                    	if(iden === "2")
                        	soutstat = 'XXXX';
                    }
                }
                else
                {
                    sresout = 'XXXX';
                    soutstat = 'NoRecord';
                }
                component.set("v.CustomerId", sresout);
                component.set("v.CustStat", soutstat);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    }
})