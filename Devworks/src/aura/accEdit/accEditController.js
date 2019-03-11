({
    handleSaveRecord: function(component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving record, error: ' + 
                           JSON.stringify(saveResult.error));
                var errMsg = "";
                for (var i = 0; i < saveResult.error.length; i++) {
                    errMsg += saveResult.error[i].message + "\n";
                }
                component.set("v.recordSaveError", errMsg);
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
        },
// Control the component behavior here when record is changed (via any component)
    handleAccRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            // get the fields that are changed for this record
            var changedFields = eventParams.changedFields;
            console.log('Fields that are changed: ' + JSON.stringify(changedFields));
            // record is changed so refresh the component (or other component logic)
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated."
            });
            resultsToast.fire();
        } else if(eventParams.changeType === "LOADED") {
            // record is loaded in the cache+
            console.log('Loaded: ');
            var resultsToast1 = $A.get("e.force:showToast");
            resultsToast1.setParams({
                "title": "Loaded",
                "message": "The record was Loaded"
            });
        } else if(eventParams.changeType === "REMOVED") {
            // record is deleted and removed from the cache
            console.log('Removed: ');
            var resultsToast2 = $A.get("e.force:showToast");
            resultsToast2.setParams({
                "title": "Removed",
                "message": "The record was Removed"
            });
            resultsToast2.fire();
        } else if(eventParams.changeType === "ERROR") {
            console.log('Error: ' + component.get("v.error"));
            var resultsToast3 = $A.get("e.force:showToast");
            resultsToast3.setParams({
                "title": "Error",
                "message": "The record was not updated"
            });
            resultsToast3.fire();
        }
    }
})