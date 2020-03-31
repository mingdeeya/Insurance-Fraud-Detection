package com.stack.ins.member.model;

public class Member {
	
	
    private String userid;
    private String name;
    private String password;
    private String phone;
    private String email;
//  db에서 삭제 하기 전에 1차적으로 삭제하기 -for 복구를 위한 숫자  default = 0  삭제시 = 1 로 바꿈 
    private int deleteCount;
   
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    
    
}
