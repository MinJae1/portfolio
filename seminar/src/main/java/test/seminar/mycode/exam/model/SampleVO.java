package test.seminar.mycode.exam.model;

import java.sql.Date;

public class SampleVO {

	private int wrId;
	private String wrTitle;
	private String wrContent;
	private Date wrDate;
	private int wrHits;

	public int getWrId() {
		return wrId;
	}

	public void setWrId(int wrId) {
		this.wrId = wrId;
	}

	public String getWrTitle() {
		return wrTitle;
	}

	public void setWrTitle(String wrTitle) {
		this.wrTitle = wrTitle;
	}

	public String getWrContent() {
		return wrContent;
	}

	public void setWrContent(String wrContent) {
		this.wrContent = wrContent;
	}

	public Date getWrDate() {
		return wrDate;
	}

	public void setWrDate(Date wrDate) {
		this.wrDate = wrDate;
	}

	public int getWrHits() {
		return wrHits;
	}

	public void setWrHits(int wrHits) {
		this.wrHits = wrHits;
	}

}
