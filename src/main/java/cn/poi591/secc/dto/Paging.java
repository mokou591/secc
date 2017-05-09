package cn.poi591.secc.dto;

import java.util.ArrayList;
import java.util.List;

public class Paging {
	//显示的前页和后页的数量
	private final Integer PREV_COUNT = 2;
	private final Integer NEXT_COUNT = 2;
	
	//分页参数
	private Integer max;
	private Integer min;
	private Integer current;
	
	private Boolean hasPrev;
	private Boolean hasNext;
	
	private List<Integer> pageList;
	
	public List<Integer> getPageList() {
		return pageList;
	}
	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}
	public Boolean getHasPrev() {
		return hasPrev;
	}
	public void setHasPrev(Boolean hasPrev) {
		this.hasPrev = hasPrev;
	}
	public Boolean getHasNext() {
		return hasNext;
	}
	public void setHasNext(Boolean hasNext) {
		this.hasNext = hasNext;
	}
	public Integer getMax() {
		return max;
	}
	public void setMax(Integer max) {
		this.max = max;
	}
	public Integer getMin() {
		return min;
	}
	public void setMin(Integer min) {
		this.min = min;
	}
	public Integer getCurrent() {
		return current;
	}
	public void setCurrent(Integer current) {
		this.current = current;
	}
	
	/**
	 * 根据最大最小和当页参数生成展示的页码
	 */
	public void generatePageList() {
		pageList = new ArrayList<Integer>();
		for(int i=this.getCurrent()-PREV_COUNT;i<=this.getCurrent()+NEXT_COUNT;++i){
			if(i>=this.getMin() && i<=this.getMax()){
				//向页码数列合理的页码值
				pageList.add(i);
			}
		}
	}
	
}
