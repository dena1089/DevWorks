({
    createCon : function(component) {
        var createRecordEvent = $A.get("e.force:createRecord");
        alert('createRecordEvent '+createRecordEvent);
        createRecordEvent.setParams({
            "entityApiName": "Contact",
            "defaultFieldValues": {
                'FirstName' : component.get("v.cFName"),
                'LastName' : component.get("v.cLName"),
                'Phone' : component.get("v.cPhone"),
                'Email' : component.get("v.cEmail")
            }
        });
        createRecordEvent.fire();
    }
})