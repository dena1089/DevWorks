({
    CallNavigation : function(component, event, helper) {
        var Id = component.get("v.simpleRecord.Id");
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": '/'+Id
        });
        urlEvent.fire();
    }
})