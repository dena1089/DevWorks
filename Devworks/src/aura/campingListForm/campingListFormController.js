({
	clickCreateItem: function(component, event, helper) {
	var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validCamping){
            // Create the new Camping List
            var newCamping = component.get("v.newItem");
            console.log("Create expense: " + JSON.stringify(newCamping));
            //var newCampings = component.get("v.items");
            //newCampings.push(JSON.parse(JSON.stringify(newCamping)));
             //component.set("v.items", newCampings);
            //component.set("v.newItem","{'sobjectType': 'Camping_Item__c', 'Name':'','Quantity__c':0,'Price__c':0,'Packed__c':false}");
            helper.createItem(component, newCamping);
        }	
	}
})