package com.market.service;

import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.market.domain.MemberVO;
import com.market.domain.SendCouponVO;
import com.market.mapper.MemberMapper;
import com.market.mapper.SendCouponMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {

	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private SendCouponMapper send_mapper;
	
	@Autowired
	private SqlSessionTemplate userSqlSession;
	
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	
	@Transactional
	@Override
	public void user_register(MemberVO member) {
		// TODO Auto-generated method stub
		
		member.setUserpw(pwencoder.encode(member.getUserpw()));
		
		mapper.insert(member);
		
		SendCouponVO send_coupon = new SendCouponVO();
		UUID uuid = UUID.randomUUID();
		
		send_coupon.setUserid(member.getUserid());
		send_coupon.setS_cp_uuid(uuid.toString());
		send_coupon.setC_cp_idx(174);
		send_mapper.send_coupon_insert(send_coupon);
		
		
	}

	@Override
	public MemberVO user_read(String userid) {
		// TODO Auto-generated method stub
		return mapper.read(userid);
	}

	@Override
	public int userIdCheck(String userid) {
		// TODO Auto-generated method stub
		
		mapper = userSqlSession.getMapper(MemberMapper.class);
		
		return mapper.checkOverId(userid);
		
	}

	@Override
	public int userNameCheck(String username) {
		// TODO Auto-generated method stub

		mapper = userSqlSession.getMapper(MemberMapper.class);
		
		return mapper.checkOverName(username);

	}

	@Override
	public int userEmailCheck(String email) {
		// TODO Auto-generated method stub
		
		mapper = userSqlSession.getMapper(MemberMapper.class);
		
		return mapper.checkOverEmail(email);
	}

	@Override
	public int find_checkPass(String id, String email) {
		// TODO Auto-generated method stub
		mapper = userSqlSession.getMapper(MemberMapper.class);
		
		return mapper.find_checkPass(id, email);
	}

	@Override
	public int find_checkId(String name, String email) {
		// TODO Auto-generated method stub
		mapper = userSqlSession.getMapper(MemberMapper.class);
		
		return mapper.find_checkId(name, email);
	}

	@Override
	public int update_point(MemberVO user) {
		// TODO Auto-generated method stub
		
		try {
			return mapper.update_point(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		

	}

	@Override
	public int update_minus_point(MemberVO user) {
		// TODO Auto-generated method stub
		try {
			return mapper.update_minus_point(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

}
