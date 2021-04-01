package kr.co.motorDiagnosis.main.common.vo;

public class Pager {

	/** 페이지네이션 및 검색 */
	private int page = 1;
	private int perPage = 10;
	private float total;
	
	private int startPage = 0;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getOffset() {
		return (page - 1) * perPage;
	}
	public int getLast() {
//		return (int) Math.ceil(total / perPage);
		return (int) Math.ceil(total / 10);
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
}
