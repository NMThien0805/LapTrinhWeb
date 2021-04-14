package n17dccn171.controller;

import n17dccn171.entity.detail;

public class data_detail {
	private detail detail = new detail();
	private detail_bonus detail_bonus = new detail_bonus();
	private int count_text=0;
	private int count_link=0;
	
	public detail getDetail() {
		return detail;
	}
	public void setDetail(detail detail) {
		this.detail = detail;
	}
	public detail_bonus getDetail_bonus() {
		return detail_bonus;
	}
	public void setDetail_bonus(detail_bonus detail_bonus) {
		this.detail_bonus = detail_bonus;
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
		return "data_detail detail=" + detail + "\n detail_bonus=" + detail_bonus;
	}
	
}
