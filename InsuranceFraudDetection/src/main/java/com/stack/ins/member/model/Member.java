package com.stack.ins.member.model;

import java.util.Date;

public class Member {
	
	private String userId;
	private String name;
	private String password;
	private String email;
	private String phone;
	private int delCount;
	private Date birth;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getDelCount() {
		return delCount;
	}
	public void setDelCount(int delCount) {
		this.delCount = delCount;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", name=" + name + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", delCount=" + delCount + ", birth=" + birth + "]";
	}
	
	
	
    
}
