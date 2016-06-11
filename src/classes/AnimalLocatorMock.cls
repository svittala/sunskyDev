@istest
global class AnimalLocatorMock implements HttpCalloutMock {
    /* helper class to test the Httpcallouts 
     */
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        string bodyText = '{"animal":{"id":2,"name":"bear","eats":"berries, campers, adam seligman","says":"yum yum"}}';
        response.setBody(bodyText);
        response.setStatusCode(200);
        return response; 
    }
}