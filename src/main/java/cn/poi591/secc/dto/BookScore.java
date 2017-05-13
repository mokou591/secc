package cn.poi591.secc.dto;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class BookScore {
	private Integer count;
	@NumberFormat(style=Style.NUMBER, pattern="#.#")
	private Float average;
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Float getAverage() {
		return average;
	}
	public void setAverage(Float average) {
		this.average = average;
	}

	
}
