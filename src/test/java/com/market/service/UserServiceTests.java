package com.market.service;

import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.market.domain.MemberVO;
import com.market.domain.SendCouponVO;
import com.market.mapper.SendCouponMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" , 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class UserServiceTests {
	
	@Setter(onMethod_ = { @Autowired })
	private UserService user;
	
	@Setter(onMethod_ = { @Autowired })
	private SendCouponMapper send;
	
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	
	
	//유저 생성
	@Test
	public void UserCreateTest() {
		
		MemberVO member = new MemberVO();
		
		member.setUserid("test13");
		member.setUsername("ㅌㅌㅌ");
		member.setUserpw(pwencoder.encode("pw"));
		member.setEmail("aa@naver.com");
		member.setPhone1("111");
		member.setPhone2("222");
		member.setPhone3("333");
		member.setZipcode("12345");
		
		user.user_register(member);
		
//		SendCouponVO send_coupon = new SendCouponVO();
//		UUID uuid = UUID.randomUUID();
//		
//		send_coupon.setUserid(member.getUserid());
//		send_coupon.setS_cp_uuid(uuid.toString());
//		send_coupon.setC_cp_idx(174);
//		send.send_coupon_insert(send_coupon);
		
	}
}
