package n17dccn171.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "accout")
public class accout {
	@Id
	private String email;
	private String password;
	private String code;
	private int discountcode;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

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
		return "accout [email=" + email + ", password=" + password + ", code=" + code + ", discountcode=" + discountcode
				+ "]";
	}
	
}
