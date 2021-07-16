package com.market.mapper;

import com.market.domain.MemberVO;


public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public int insert(MemberVO user);
	
	//유효성
	public int checkOverId(String userid);
	
	public int checkOverName(String username);
	
	public int checkOverEmail(String email);
	
	
	//아이디 찾기
	public String searchId(String username, String email);
	
	public int find_checkId(String username, String email);
	
	public MemberVO id_userInfo(String username);
	
	//비밀번호 찾기
	
	public int searchPassword(String userid, String email, String userpw);
	
	public int find_checkPass(String userid, String email);
	
	public MemberVO pw_userInfo(String userid);
	
	
	//주문페이지
	public int update_point(MemberVO user); 
	
	public int update_minus_point(MemberVO user);
	
}
