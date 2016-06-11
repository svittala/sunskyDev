@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send 
        // Notes:- create the responseElement and set the value of the public variable in that class
        // then do a insert into a map - response.put ('response_x,responseElement)
            ParkService.byCountryResponse responseElement = 
            new ParkService.byCountryResponse();
               responseElement.return_x = new list <string> {'Mock Result1','Mock Result2'};
        // end
        response.put('response_x', responseElement); 
   }
}