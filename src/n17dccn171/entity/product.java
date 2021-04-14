package n17dccn171.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "product")
public class product {
	@Id
	@GeneratedValue
	private int id;
	private String brands;
	private String itemname;
	private String color;
	private int quantity;
	private float price;
	private int discount;
	private String linkimg;
	private String itemfullname;
	private String description;
	private int reviews;
	private String type;
	private Boolean newproduct;
	private String series_img;
	
	public int getId() {
		return id;
	}
	public void setID(int id) {
		this.id = id;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getLinkimg() {
		return linkimg;
	}
	public void setLinkimg(String linkimg) {
		this.linkimg = linkimg;
	}
	public String getItemfullname() {
		return itemfullname;
	}
	public void setItemfullname(String itemfullname) {
		this.itemfullname = itemfullname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getReviews() {
		return reviews;
	}
	public void setReviews(int reviews) {
		this.reviews = reviews;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Boolean getNewproduct() {
		return newproduct;
	}
	public void setNewproduct(Boolean newproduct) {
		this.newproduct = newproduct;
	}
	public String getSeries_img() {
		return series_img;
	}
	public void setSeries_img(String series_img) {
		this.series_img = series_img;
	}
	@Override
	public String toString() {
		return "product [id=" + id + ", brands=" + brands + ", itemname=" + itemname + ", color=" + color
				+ ", quantity=" + quantity + ", price=" + price + ", discount=" + discount + ", linkimg=" + linkimg
				+ ", itemfullname=" + itemfullname + ", description=" + description + ", reviews=" + reviews + ", type="
				+ type + "]";
	}
}
