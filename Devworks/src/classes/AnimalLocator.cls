public class AnimalLocator {
	public static String getAnimalNameById(integer id)
    {
        String Resp;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> anmlst = (Map<String, Object>) results.get('animal');
            Resp = (String) anmlst.get('eat');
            System.debug('Received the following animals:'+Resp);
        }
        return Resp;
    }
}