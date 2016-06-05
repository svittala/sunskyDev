public class Toaster implements KitchenAppliance {
    private string modelNumber;
 
    public Toaster()
    {
        modelNumber = 'MD-00';
    }    
    public void Print (){
        system.debug(' Stock of Toaster' + getModelNumber() +' not defined' );
    }
    public string getModelNumber () {
    	return 'T-' + modelNumber; 
    }
}