//
@IsTest
public class JSON2Apex_Test {
	
	static testMethod void testParse() {
		String json = '{\"animal\":{\"id\":2,\"name\":\"bear\",\"eats\":\"berries, campers, adam seligman\",\"says\":\"yum yum\"}}';
		JSON2Apex obj = JSON2Apex.parse(json);
		System.assert(obj != null);
	}
    static testMethod void testName() {
		String json = '{\"animal\":{\"id\":2,\"name\":\"bear\",\"eats\":\"berries, campers, adam seligman\",\"says\":\"yum yum\"}}';
		JSON2Apex obj = JSON2Apex.parse(json);
        string bname = obj.animalname();
		System.assertEquals('bear', bname,
          'The array should only contain bear.');
    }
    
 }