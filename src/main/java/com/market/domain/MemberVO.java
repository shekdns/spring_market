package com.market.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid;
	private String username;
	private String userpw;
	private String email;
	private String phone1;
	private String phone2;
	private String phone3;
	private String zipcode;
	private int point;
	private Date regdate;
	
	public List<AuthVO> authList;
	
}
