
package vmm2;

/**
 *
 * @author lenovo
 */
public class product {
    public int productid,mrp,offerprice,shopkeeperid,qty;
   public String productname,primaryphoto,productdes,brand,category;

    public product(int productid, int mrp, int offerprice, int shopkeeperid, String productname, String primaryphoto, String productdes, String brand, String category,int qty) {
        this.productid = productid;
        this.mrp = mrp;
        this.offerprice = offerprice;
        this.shopkeeperid = shopkeeperid;
        this.productname = productname;
        this.primaryphoto = primaryphoto;
        this.productdes = productdes;
        this.brand = brand;
        this.category = category;
        this.qty=qty;
    }
    
    
    
    
}
