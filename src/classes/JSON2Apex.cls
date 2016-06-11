public class JSON2Apex {

	private Animal animal;

	private class Animal {
		Integer id;
		String name;
		String eats;
		String says;
    }

    public string animalname(){
        return animal.name;
    }
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}