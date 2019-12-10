package com.mobile.bikok.rent.model;

public class MRentVO {

	//----------------------------------
	private int no;
	
	//user_info----------------------
	private int member_no;
	private String member_id;
	
	//bike_info----------------------
	private String bike_id;
	
	//location
	private String real_time; //gps정보 업데이트 실시간시각
	private double latitude; //위도
	private double longitude; //경도
	
	//time
	private String rent_time; //대여시각
	private String running_time; //주행시간
	private String return_time; //반납시각
	
	private int lock_state; //잠금상태 1해제, 0잠금
	
	private int bws; //back warning sensor, 후방감지센서 작동, on경고 null대기
	
	//-------------------------------------


	@Override
	public String toString() {
		return "MRentVO [member_id=" + member_id + ",bike_id=" + bike_id + ",bws=" + bws + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBike_id() {
		return bike_id;
	}

	public void setBike_id(String bike_id) {
		this.bike_id = bike_id;
	}

	public String getReal_time() {
		return real_time;
	}

	public void setReal_time(String real_time) {
		this.real_time = real_time;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getRent_time() {
		return rent_time;
	}

	public void setRent_time(String rent_time) {
		this.rent_time = rent_time;
	}

	public String getRunning_time() {
		return running_time;
	}

	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}

	public String getReturn_time() {
		return return_time;
	}

	public void setReturn_time(String return_time) {
		this.return_time = return_time;
	}

	public int getLock_state() {
		return lock_state;
	}

	public void setLock_state(int lock_state) {
		this.lock_state = lock_state;
	}

	public int getBws() {
		return bws;
	}

	public void setBws(int bws) {
		this.bws = bws;
	}

	
	
}

