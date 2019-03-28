({
    doInit : function(component, event, helper) {
        var action1 = component.get("c.getRecordTypedata");
        action1.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.RecordType", response.getReturnValue());
            }
        });
        $A.enqueueAction(action1);
        var action2 = component.get("c.getReferralType");
        action2.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.ReferralType", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action2);
        var action3 = component.get("c.getLoanPurpose");
        action3.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.LoanPurpose", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action3);
        var action4 = component.get("c.getReferralSeg");
        action4.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.ReferralSeg", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action4);
        var action5 = component.get("c.getReferralDet");
        action5.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.ReferralDet", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action5);
        var action6 = component.get("c.getSeg");
        action6.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Segment", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action6);
        var action7 = component.get("c.getAssignTo");
        action7.setParams({
            "sType": ""
        });
        action7.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.AssignTo", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action7);
    },
    onChangeSeg:function(component, event, helper) {
        
        var ATaction = component.get("c.getAssignTo");
        ATaction.setParams({
            "sType": component.get("v.SegmentVal")
        });
        ATaction.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.AssignTo", response.getReturnValue());
            } 
        });
        $A.enqueueAction(ATaction);
    },
    clickCheckValue:function(component, event, helper) {
        alert("Values "+component.get("v.ReferralTypeVal")+ ' '+component.get("v.RecordTypeVal")+ ' '+component.get("v.LoanPurposeVal")+ ' '+component.get("v.ReferralSegVal")+ ' '+component.get("v.ReferralDetVal")+ ' '+component.get("v.SegmentVal"));
    },
    handleaddConAppEvt : function(component, event, helper) {
        var seConRec = event.getParam("conRec");
        component.set("v.ConRec",seConRec);
    },
    handleaeRefRecVisible : function(component, event, helper) {
        var sRec = event.getParam("aeShowRefRecord");
        component.set("v.ShowRefRec",sRec);
    },
    clickCreateItem : function(component, event, helper) {
        var sAppId = component.get("v.AppIdVal");
        var sAppNum = component.get("v.AppNumVal");
        var sRecType = component.get("v.RecordTypeVal");
        var sRefType = component.get("v.ReferralTypeVal");
        var sRefSeg = component.get("v.ReferralSegVal");
        var sRefDet = component.get("v.ReferralDetVal");
        var sSeg = component.get("v.SegmentVal");
        var sAsgnTo = component.get("v.AssignToVal");
        var sLpVal = component.get("v.LoanPurposeVal");
        component.set("v.RefRec.Referral_Type__c", sRefType);
        component.set("v.RefRec.Loan_Purpose__c", sLpVal);
        component.set("v.RefRec.Referral_Segment__c", sRefSeg);
        component.set("v.RefRec.Referral_Detail__c", sRefDet);
        component.set("v.RefRec.Segment__c", sSeg);
        component.set("v.RefRec.Contact__c", component.get("v.ConRec.Id"));
        component.set("v.RefRec.Assigned_To__c", sAsgnTo);
        component.set("v.RefRec.Appointment_Required__c", sAppId);
        component.set("v.RefRec.Appointment_Id__c", sAppNum);
        component.set("v.RefRec.Need_Identification__c", component.get("v.NeedsIdenVal"));
        //alert("sAppId "+sAppId+" sAppNum "+sAppNum+" sRecType "+sRecType+" sRefType "+sRefType+" sRefSeg "+sRefSeg+" sRefDet "+sRefDet+" sSeg "+sSeg+" sAsgnTo "+sAsgnTo);
        if((sAppId) && sAppNum == "")
        {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error",
                "message": "Please Enter the Appointment Number!!!"
            });
            toastEvent.fire();
        }
        else if(sLpVal=="" || sRecType == "" || sRefType == "" || sRefSeg== ""|| sRefDet== ""|| sSeg== ""|| sAsgnTo== "")
        {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Missing Mandatory Fields",
                "message": "Please Select Proper values."
            });
            toastEvent.fire();
        }
            else{
                var validRef = component.find('NewReferralForm').reduce(function (validSoFar, inputCmp) {
                    // Displays error messages for invalid fields
                    inputCmp.showHelpMessageIfInvalid();
                    return validSoFar && inputCmp.get('v.validity').valid;
                }, true);
                //alert("validCon "+validCon);
                if(validRef){
                    var sRefData = component.find('NewReferralForm');
                    //alert("sRefData "+component.get("v.RefRec"));
                    var action = component.get("c.getReferral");
                    //alert("action "+action);
                    action.setParams({"refData" : component.get("v.RefRec"),
                                      "RecType" : sRecType
                                     });
                    action.setCallback(this, function(response){
                        var state = response.getState();
                        //alert("State "+state);
                        if (state === "SUCCESS") {
                            component.set("v.eRefRec", response.getReturnValue());
                            component.set("v.ShowRefRec", true);
                        }
                        else
                        {
                            var errors = response.getError();
                            var message = '';
                            if (errors) {
                                for(var i=0; i < errors.length; i++) {
                                    for(var j=0; errors[i].pageErrors && j < errors[i].pageErrors.length; j++) {
                                        message += (message.length > 0 ? '\n' : '') + errors[i].pageErrors[j].message;
                                        alert('message '+message);
                                    }
                                    if(errors[i].fieldErrors) {
                                        for(var fieldError in errors[i].fieldErrors) {
                                            var thisFieldError = errors[i].fieldErrors[fieldError];
                                            for(var j=0; j < thisFieldError.length; j++) {
                                                message += (message.length > 0 ? '\n' : '') + thisFieldError[j].message;
                                            	alert('message '+message);
                                            }
                                        }
                                    }
                                    if(errors[i].message) {
                                        message += (message.length > 0 ? '\n' : '') + errors[i].message;
                                    }
                                }
                            } else {
                                message += (message.length > 0 ? '\n' : '') + 'Unknown error';
                            }
                        }
                    });
                    $A.enqueueAction(action);
                }
            }
    }
})