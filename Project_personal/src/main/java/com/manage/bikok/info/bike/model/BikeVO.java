package com.manage.bikok.info.bike.model;

public class BikeVO {
	private int no;
	private String code;
	private int state;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "BikeVO [code=" + code + ", state=" + state + "]";
	}

}
