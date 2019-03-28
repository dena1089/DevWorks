({
    doInit:function(component, event, helper) {
        component.set("v.cLName", "");
        component.set("v.cFName", "");
        component.set("v.cPhone", "");
        component.set("v.cEmail", "");
    },
    clickCreateItem: function(component, event, helper) {
        var validCon = component.find('NewContactForm').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        //alert("validCon "+validCon);
        if(validCon){
            var newCon = component.get("v.ConRec");
            //alert("newCon "+newCon);
            //helper.createCon(component); not using this for now
            var action = component.get("c.setContactDet");
            action.setParams({
                "ConLName": component.get("v.cLName"),
                "ConFName": component.get("v.cFName"),
                "sPhone" : component.get("v.cPhone"),
                "sEmail" : component.get("v.cEmail")
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                //alert("State "+state);
                if (state === "SUCCESS") {
                    //alert("Response "+response.getReturnValue());
                    component.set("v.eConRec", response.getReturnValue());
                    component.set("v.nRec",false);
                    component.set("v.eRec",true);
                    var createEvent = $A.get("e.c:addConAppEvt");
                    createEvent.setParams({ "conRec": component.get("v.eConRec")});
                    createEvent.fire();
                    var aeAppEvt1 = $A.get("e.c:aeRefRecVisible");
                aeAppEvt1.setParams({ "aeShowRefRecord": false });
                aeAppEvt1.fire();
                }
            });
            $A.enqueueAction(action); 
            
        }	
    },
    handlecondatacheck: function(component, event, helper) {
        var snRec = event.getParam("aenRec");
        var seRec = event.getParam("aeeRec");
        component.set("v.nRec",snRec);
        component.set("v.eRec",seRec);
    },
    handleaddConAppEvt: function(component, event, helper) {
        var seConRec = event.getParam("conRec");
        component.set("v.eConRec",seConRec);
    }
})