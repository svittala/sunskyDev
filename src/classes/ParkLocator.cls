public class ParkLocator {
 /* Create a class called 'ParkLocator' that has a
  * 'country' method that uses the 'ParkService' class 
  * and returns an array of available park names for a
  * particular country passed to the web service. 
  * Possible country names that can be passed to the web service
  * include Germany, India, Japan and United States.  */
    public static string[] country(string country){
        ParkService.ParksImplPort P = new Parkservice.ParksImplPort();
        string[] parklist = P.byCountry(country);
        return parklist;
    }
}