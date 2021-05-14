package com.market.mapper;

import com.market.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public int insert(MemberVO user);
	
}
