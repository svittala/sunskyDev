public class Fridge implements KitchenAppliance {
private string modelNumber ;
private integer numberInStock;
public static final integer STOCK_THRESHOLD = 5;

    public Fridge ( ){
    	modelNumber = 'MODEL';
        numberInstock = STOCK_THRESHOLD;
      }

    public Fridge ( string theModelNumber, integer theNumberInStock){
    	modelNumber = theModelNumber;
        numberInstock = theNumberInStock;
         if (numberInStock < STOCK_THRESHOLD) numberInStock = STOCK_THRESHOLD;
    }
	public void Print (){
        system.debug(' Stock of fridge ' + getModelNumber() +' =' + numberInStock);
    }
    public void updateStock( integer justSold){
    	numberInStock -= justSold;
        // make sure we dont have negative value
        if (numberInStock < STOCK_THRESHOLD) numberInStock = STOCK_THRESHOLD;
    }
    public string getModelNumber(){
        return 'F-' + modelNumber;
    }
}