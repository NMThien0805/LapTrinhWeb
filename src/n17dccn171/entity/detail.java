package n17dccn171.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "detail")
public class detail {

	@Id
	@GeneratedValue
	private int id;
	private String brands;
	private String itemname;
	private String itemtext;
	private String itemlink;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getItemtext() {
		return itemtext;
	}
	public void setItemtext(String itemtext) {
		this.itemtext = itemtext;
	}
	public String getItemlink() {
		return itemlink;
	}
	public void setItemlink(String itemlink) {
		this.itemlink = itemlink;
	}
	@Override
	public String toString() {
		return "detail [id=" + id + ", brands=" + brands + ", itemname=" + itemname + ", itemtext=" + itemtext
				+ ", itemlink=" + itemlink + "]";
	}
}
