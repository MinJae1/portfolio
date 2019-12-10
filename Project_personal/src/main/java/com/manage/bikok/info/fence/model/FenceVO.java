package com.manage.bikok.info.fence.model;

public class FenceVO {
	private int no;
	private String name;
	private String summary;
	private String wDate;
	private String latitude;
	private String logitude;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLogitude() {
		return logitude;
	}

	public void setLogitude(String logitude) {
		this.logitude = logitude;
	}

	@Override
	public String toString() {
		return "FenceVO [name=" + name + ", summary=" + summary + ", wDate=" + wDate + ", latitude=" + latitude
				+ ", logitude=" + logitude + "]";
	}

}
