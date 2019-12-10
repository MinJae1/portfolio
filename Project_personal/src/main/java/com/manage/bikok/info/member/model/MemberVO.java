package com.manage.bikok.info.member.model;

public class MemberVO {
	private int id;
	private String userId;
	private String pwd;
	private String name;
	private String phone;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Member [id=" + id + ", userId=" + userId + ", name=" + name + ", phone=" + phone + "]";
	}
}
