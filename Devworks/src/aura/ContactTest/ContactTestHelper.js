({
	loadContact : function(component) {
    var action = component.get("c.getContact");

    action.setParams({
        contactId : component.get("v.contactId")
    });

    action.setCallback(this, function(a) {
        if (a.getState() === "SUCCESS") {
            component.set("v.contact", a.getReturnValue());
        } else if (a.getState() === "ERROR") {
            $A.log("Errors", a.getError());
        }
    });

    $A.enqueueAction(action);
}
})