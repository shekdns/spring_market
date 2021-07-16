package com.market.service;

import com.market.domain.MemberVO;

public interface UserService {
	
	public void user_register(MemberVO member);
	
	public MemberVO user_read(String userid);
	
	//유효성 검사 아이디,이름,이메일
	public int userIdCheck(String userid);
	
	public int userNameCheck(String username);
	
	public int userEmailCheck(String email);
	
	//비밀번호 , 아이디 찾기
	
	public int find_checkPass(String id, String email);
	
	public int find_checkId(String name, String email);
	
	//포인트 적립
	public int update_point(MemberVO user); 
	
	//포인트 마이너스
	public int update_minus_point(MemberVO user);
	
}
