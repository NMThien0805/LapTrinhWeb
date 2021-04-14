package n17dccn171.controller;

import java.util.Arrays;

public class detail_bonus {
	private String[] text = new String[100];
	private String[] link = new String[100];
	public String[] getText() {
		return text;
	}
	public void setText(String[] text) {
		this.text = text;
	}
	public String[] getLink() {
		return link;
	}
	public void setLink(String[] link) {
		this.link = link;
	}
	@Override
	public String toString() {
		return "detail_bonus [text=" + Arrays.toString(text) + "\n link=" + Arrays.toString(link) + "]";
	}
}
