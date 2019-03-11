({
	doInit: function(component, event, helper) {
        var url = $A.get('$Resource.P1');
		component.set('v.backgroundImageURL', url);
        //var concls = component.find("clsContactDetail"); 
		//$A.util.addClass(concls.getElementsByClassName(), 'slds-hide');
        // Create the action
        var action = component.get("c.getAccountDetails");
        action.setParams({AccountId : component.get("v.AccountId")});

        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.AccntDetail",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
        //GetContactDetails
        var action1 = component.get("c.getContactDetails");
        action1.setParams({AccountId : component.get("v.AccountId")});

        // Add callback behavior for when response is received
        action1.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.ConDetails",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action1);
        
        //GetOpptyDetails
        var action1 = component.get("c.getOptyDetails");
        action1.setParams({AccountId : component.get("v.AccountId")});

        // Add callback behavior for when response is received
        action1.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.OptyDetails",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action1);
        
        //GetCaseDetails
        var action2 = component.get("c.getCaseDetails");
        action2.setParams({AccountId : component.get("v.AccountId")});
        // Add callback behavior for when response is received
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.CaseDetails",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action2);
        
        //GetActivityDetails
        var action3 = component.get("c.getActionDetails");
        action3.setParams({AccountId : component.get("v.AccountId")});
        // Add callback behavior for when response is received
        action3.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.ActDetails",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action3);
        
        //GetOrderDetails
        var action4 = component.get("c.getOrderDetails");
        action4.setParams({AccountId : component.get("v.AccountId")});
        // Add callback behavior for when response is received
        action4.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.OrdDetails",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action4);
        
        //GetNoteDetails
        var action5 = component.get("c.getNoteDetails");
        action5.setParams({AccountId : component.get("v.AccountId")});
        // Add callback behavior for when response is received
        action5.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.NoteDetails",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action5);
        
        //GetAttDetails
        var action6 = component.get("c.getAttDetails");
        action6.setParams({AccountId : component.get("v.AccountId")});
        // Add callback behavior for when response is received
        action6.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.AttDetails",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action6);
        //hide all subviews
        var condetail = component.find("ContactDetail");
       var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(condetail, 'slds-hide');
        $A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.addClass(CaseDetail, 'slds-hide');
        $A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.addClass(OrdDetail, 'slds-hide');
        $A.util.addClass(NoteDetail, 'slds-hide');
       	$A.util.addClass(AttDetail, 'slds-hide');
        },
//Account
handleClickAccount : function(component, event, helper) {
    	var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.removeClass(accountdetail, 'slds-hide');
    	$A.util.addClass(accountdetail, 'slds-show');
    	$A.util.addClass(condetail, 'slds-hide');
        $A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.addClass(CaseDetail, 'slds-hide');
        $A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.addClass(OrdDetail, 'slds-hide');
        $A.util.addClass(NoteDetail, 'slds-hide');
        $A.util.addClass(AttDetail, 'slds-hide'); 	
},
//Contact
handleClickContact : function(component, event, helper) {
    	var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(accountdetail, 'slds-hide');
    	$A.util.removeClass(condetail, 'slds-hide');
    	$A.util.addClass(condetail, 'slds-show');
        $A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.addClass(CaseDetail, 'slds-hide');
        $A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.addClass(OrdDetail, 'slds-hide');
        $A.util.addClass(NoteDetail, 'slds-hide');
        $A.util.addClass(AttDetail, 'slds-hide'); 	
},
//Opportunity
handleClickOpty : function(component, event, helper) {
    var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(accountdetail, 'slds-hide');
    	$A.util.addClass(condetail, 'slds-hide');
    	$A.util.removeClass(OptyDetail, 'slds-hide');
    	$A.util.addClass(OptyDetail, 'slds-show');
        $A.util.addClass(CaseDetail, 'slds-hide');
        $A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.addClass(OrdDetail, 'slds-hide');
        $A.util.addClass(NoteDetail, 'slds-hide');
        $A.util.addClass(AttDetail, 'slds-hide'); 	
},
    //Case
handleClickCase : function(component, event, helper) {
    var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(accountdetail, 'slds-hide');
    	$A.util.addClass(condetail, 'slds-hide');
    	$A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.removeClass(CaseDetail, 'slds-hide');
    	$A.util.addClass(OptyDetail, 'slds-show');
        $A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.addClass(OrdDetail, 'slds-hide');
        $A.util.addClass(NoteDetail, 'slds-hide');
        $A.util.addClass(AttDetail, 'slds-hide');
},
        //Activity
handleClickActivity : function(component, event, helper) {
    var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(accountdetail, 'slds-hide');
    	$A.util.addClass(condetail, 'slds-hide');
    	$A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.addClass(CaseDetail, 'slds-hide');
    	$A.util.removeClass(ActivityDetail, 'slds-hide');
    	$A.util.addClass(ActivityDetail, 'slds-show');
        $A.util.addClass(OrdDetail, 'slds-hide');
        $A.util.addClass(NoteDetail, 'slds-hide');
        $A.util.addClass(AttDetail, 'slds-hide');
},
    //Order
handleClickOrder : function(component, event, helper) {
    var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(accountdetail, 'slds-hide');
    	$A.util.addClass(condetail, 'slds-hide');
    	$A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.addClass(CaseDetail, 'slds-hide');
    	$A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.removeClass(OrdDetail, 'slds-hide');
    	$A.util.addClass(OrdDetail, 'slds-show');
        $A.util.addClass(NoteDetail, 'slds-hide');
        $A.util.addClass(AttDetail, 'slds-hide');
},
    //Note
handleClickNotes : function(component, event, helper) {
    	var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       	var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(accountdetail, 'slds-hide');
    	$A.util.addClass(condetail, 'slds-hide');
    	$A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.addClass(CaseDetail, 'slds-hide');
    	$A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.addClass(OrdDetail, 'slds-hide');
    	$A.util.removeClass(NoteDetail, 'slds-hide');
    	$A.util.addClass(NoteDetail, 'slds-show');
        $A.util.addClass(AttDetail, 'slds-hide');
},
    //Attachment
handleClickAtt : function(component, event, helper) {
    	var accountdetail = component.find("AccountDetail");
   		var condetail = component.find("ContactDetail");
       	var OptyDetail = component.find("OptyDetail");
        var CaseDetail = component.find("CaseDetail");
        var ActivityDetail = component.find("ActivityDetail");
        var OrdDetail = component.find("OrdDetail");
		var NoteDetail = component.find("NoteDetail");
        var AttDetail = component.find("AttDetail");
    	$A.util.addClass(accountdetail, 'slds-hide');
    	$A.util.addClass(condetail, 'slds-hide');
    	$A.util.addClass(OptyDetail, 'slds-hide');
        $A.util.addClass(CaseDetail, 'slds-hide');
    	$A.util.addClass(ActivityDetail, 'slds-hide');
        $A.util.addClass(OrdDetail, 'slds-hide');
    	$A.util.addClass(NoteDetail, 'slds-hide');
    	$A.util.removeClass(AttDetail, 'slds-hide');
        $A.util.addClass(AttDetail, 'slds-show');
}
})