public class StoreFrontController {
List <DisplayMerchandise> products;
Map <string, DisplayMerchandise> shoppingCart = new Map <string, DisplayMerchandise> () ;

// Action Method to handle purchasing process
    public PageReference addToCart(){
        for (DisplayMerchandise p: products) {
            if (0 < p.qtytoBuy) {
                 shoppingCart.Put(p.Name, p);
            } else  { // remove 0 items
                 shoppingCart.Remove(p.name);
            }
        }
        return null; // stay on the same page
   }
    public string getCartContents(){
        if (0 == shoppingCart.size()) {
              return '(empty)';
        }
        string msg =  '<ul>\n';
        List <DisplayMerchandise> displayMerchandiseList = ShoppingCart.Values();
        for (DisplayMerchandise displayMerchandise : displayMerchandiseList ) {
            msg += '<li>';
            msg += displayMerchandise.name + '(' + displayMerchandise.qtyToBuy +')';
            msg += '</li>\n';
        }
        msg += '</ul>';
        return msg;
    }
   
    public List <DisplayMerchandise> getProducts(){
        if (products==null) {
            products = new List <DisplayMerchandise>();
            for (Merchandise__c item : [ SELECT Id,Name,Description__c,Price__c,Total_Inventory__C FROM Merchandise__c Limit 100]) {
            products.add (new DisplayMerchandise(item));
            }
        }
    return products;
    }
    // helper function for testing 
    public integer length(){
        return products.size();
    }

    // create an inner class for DisplayMerchandise
    public class DisplayMerchandise {
        private Merchandise__c merchandise;
    
        public DisplayMerchandise( Merchandise__c item){
            this.merchandise = item;
        }
      
        
        //propertise for visualforce view
        public string name {
           get { return merchandise.Name;}
        }
        public string Description {
            get {return merchandise.Description__c;}
        }
        public Decimal Price {
            get {return merchandise.Price__c;}
        }
        public Boolean inStock {
            get {return (0 < merchandise.total_inventory__c);}
        }
        integer qtyToBuy;
        public integer getqtyToBuy() {return qtyToBuy;}
        public void setqtyToBuy(integer v){qtyToBuy=v;}
     }
    
    
}