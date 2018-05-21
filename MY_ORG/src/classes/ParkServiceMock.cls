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
        
      //  parksServices.byCountryResponse response_x = new parksServices.byCountryResponse();
               ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
       response_x.return_x = new List<String>{'Hamburg Wadden Sea National Park', 'Hainich National Park', 'Bavarian Forest National Park'};
        
      
        response.put('response_x', response_x); 
   }
}