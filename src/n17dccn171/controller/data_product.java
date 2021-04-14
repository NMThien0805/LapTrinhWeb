package n17dccn171.controller;

import n17dccn171.entity.product;

public class data_product {
	private product product = new product();
	private product_bonus product_bonus= new product_bonus();
	private int count_text=0;
	private int count_link=0;
	
	public product getProduct() {
		return product;
	}
	public void setProduct(product product) {
		this.product = product;
	}
	public product_bonus getProduct_bonus() {
		return product_bonus;
	}
	public void setProduct_bonus(product_bonus product_bonus) {
		this.product_bonus = product_bonus;
	}

	
	public int getCount_text() {
		return count_text;
	}
	public void setCount_text(int count_text) {
		this.count_text = count_text;
	}
	public int getCount_link() {
		return count_link;
	}
	public void setCount_link(int count_link) {
		this.count_link = count_link;
	}
	
	@Override
	public String toString() {
		return "data_product product=" + product + "\nproduct_bonus=" + product_bonus;
	}
	
}
