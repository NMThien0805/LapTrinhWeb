package n17dccn171.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class cart {
	@Id
	@GeneratedValue
	private int id_cart;
	private int id_item=0;
	private String linkimg="";
	private String brands="";
	private String itemname="";
	private float price=0;
	private String email="";
	private String shipping="";
	private int quantity=0;
	
	public int getId_cart() {
		return id_cart;
	}
	public void setId_cart(int id_cart) {
		this.id_cart = id_cart;
	}
	public int getId_item() {
		return id_item;
	}
	public void setId_item(int id_item) {
		this.id_item = id_item;
	}
	public String getLinkimg() {
		return linkimg;
	}
	public void setLinkimg(String linkimg) {
		this.linkimg = linkimg;
	}
	public String getBrands() {
		return brands;
	}
	public void setBrands(String brands) {
		this.brands = brands;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "cart [id_cart=" + id_cart + ", linkimg=" + linkimg + ", brands=" + brands + ", itemname=" + itemname
				+ ", price=" + price + ", email=" + email + ", shipping=" + shipping + "]";
	}
}
