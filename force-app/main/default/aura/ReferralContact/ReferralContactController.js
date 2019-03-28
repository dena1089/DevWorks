({
    doInit : function(component, event, helper) {
        component.set("v.contacts","");
    },
    handleNew : function(component, event, helper) {
        var createEvent = $A.get("e.c:condatacheck");
        createEvent.setParams({ "aenRec": true, "aeeRec":false });
        createEvent.fire();
    },
    handleSearch : function(component, event, helper) {
        component.set("v.fMsg", false);
        component.set("v.RecFound", false);
        var action = component.get("c.getContactDet");
        action.setParams({
            "ConLName": component.get("v.ConLName"),
            "ConFName": component.get("v.ConFName"),
            "cnt" : component.get("v.dcount")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            //alert("State "+state);
            if (state === "SUCCESS") {
                //alert("Response "+response.getReturnValue());
                component.set("v.ConRecs", response.getReturnValue());
            }
            else
            {
                component.set("v.NoRecMsg", true);
            }
            var ngs = component.get("v.ConRecs");
            if(ngs.length > 0)
            {
                component.set("v.RecFound", true);
            }
            else
            {
                component.set("v.NoRecMsg", true);
            }
        });
        $A.enqueueAction(action);
    }
})