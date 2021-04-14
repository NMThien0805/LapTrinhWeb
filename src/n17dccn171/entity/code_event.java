package n17dccn171.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "code_event")
public class code_event {

	@Id
	private String code;
	private int discountcode;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getDiscountcode() {
		return discountcode;
	}
	public void setDiscountcode(int discountcode) {
		this.discountcode = discountcode;
	}
	@Override
	public String toString() {
		return "code_event [code=" + code + ", discountcode=" + discountcode + "]";
	}
}
