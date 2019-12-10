package com.manage.bikok.rent.realT.model;

public class RealTimerVO {

	private int state;
	private String time;
	private String code;
	private int userId;
	private String userName;
	private int no;
	private int bikeId;
	private String realtime;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBikeId() {
		return bikeId;
	}

	public void setBikeId(int bikeId) {
		this.bikeId = bikeId;
	}

	public String getRealtime() {
		return realtime;
	}

	public void setRealtime(String realtime) {
		this.realtime = realtime;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "code :" + code + ", state: " + state + ", time :" + time + ", userId : " + userId + ", userName :"
				+ userName;
	}

}
