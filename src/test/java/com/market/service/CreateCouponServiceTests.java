package com.market.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.market.domain.CreateCouponVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" , 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class CreateCouponServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private CreateCouponService service;
	
	//쿠폰 생성
	@Test
	public void CreateCouponTest() {
		
		CreateCouponVO coupon = new CreateCouponVO();
		coupon.setC_cp_name("쿠폰2");
		coupon.setC_cp_content("테스트용 쿠폰2");
		coupon.setC_cp_type("기본");
		coupon.setC_cp_price(1000);		
		service.create_coupon(coupon);
		
		log.info(coupon);
	}
	
}
