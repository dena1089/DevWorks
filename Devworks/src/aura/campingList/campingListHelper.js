({
    createItem: function(component, camping) {
        var action = component.get("c.saveItem");
		action.setParams({
            "campingitem": camping
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