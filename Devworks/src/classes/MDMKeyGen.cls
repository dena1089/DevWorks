public class MDMKeyGen {
	public static mdm__c GetMDMKey(String Recordid)
    {
        String Resp;
        mdm__c mdata;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://den108901-dev-ed.my.salesforce.com/services/apexrest/MDMKeyGeneration/'+Recordid);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            System.debug('Response Body '+response.getBody());
            // Deserializes the JSON string into collections of primitive data types.
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //Map<String, Object> anmlst = (Map<String, Object>) results.get('animal');
            Resp = response.getBody();
            System.debug('Received the following:'+Resp);
        }
        else
        {
            System.debug('Else Loop with Account Id '+Recordid);
            List<MDM__c> result = [SELECT MasterRecordId__c, Record_Status__c FROM MDM__c WHERE External_Id__c = :Recordid];
            system.debug('result.size()'+result.size());
            if(result.size() > 0)
            {
            	//mdata.MasterRecordId__c = result[0].MasterRecordId__c ;
            	//mdata.Record_Status__c = result[0].Record_Status__c;
            	mdata = result[0];
        	}
            System.debug('Received the following:'+mdata);
        }
        return mdata;
    }
}