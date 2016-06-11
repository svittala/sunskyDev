/***
 * The Apex class 'AnimalLocator', have a 'getAnimalNameById' method that
 *  accepts an Integer and returns a String.
 * 'getAnimalNameById' method must call 
 * https://th-apex-http-callout.herokuapp.com/animals/:id,
 *  using the ID passed into the method.
 *  The method returns the value of the 'name' property (i.e., the animal name).
 */
public class AnimalLocator {
    public static string getAnimalNamebyID (integer loopid){
        string retstring = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        string endPoint = 'https://th-apex-http-callout.herokuapp.com/animals/' + loopid;
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // return string is like this -- {"animal":{"id":2,"name":"bear","eats":"berries, campers, adam seligman","says":"yum yum"}}
            // get to a JSon2Apex class..
            Json2Apex animalJsonmap = JSON2Apex.parse(response.getBody()); 
            retstring =  animaljsonmap.animalname();
            System.debug('Received the following Name:' + retstring);
            
        }
  		return retstring;
        
    }
    
}