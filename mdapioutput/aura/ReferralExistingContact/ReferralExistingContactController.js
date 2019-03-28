({
    CallAppEvt : function(component, event, helper) {
        var createEvent = $A.get("e.c:addConAppEvt");
        createEvent.setParams({ "conRec": component.get("v.ConRec")});
        createEvent.fire();
        var createEvent1 = $A.get("e.c:condatacheck");
        createEvent1.setParams({ "aenRec": false, "aeeRec":true });
        createEvent1.fire();
        var aeAppEvt1 = $A.get("e.c:aeRefRecVisible");
        aeAppEvt1.setParams({ "aeShowRefRecord": false });
        aeAppEvt1.fire();
    }
})