({
	doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    handleAddItem: function(component, event, helper)
    {
        var newCampingItem = event.getParam("item");
        var action = component.get("c.saveItem");
		action.setParams({
            "campingitem": newCampingItem
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var campingitms = component.get("v.items");
                campingitms.push(response.getReturnValue());
                component.set("v.items", campingitms);
                //component.set("newItem", "{'sobjectType': 'Camping_Item__c', 'Name':'','Quantity__c':0,'Price__c':0,'Packed__c':false}");
            }
        });
        $A.enqueueAction(action);
    }
})