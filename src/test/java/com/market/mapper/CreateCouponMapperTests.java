package com.market.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.market.domain.CreateCouponVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" , 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class CreateCouponMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CreateCouponMapper mapper;
	
	//쿠폰 생성
	@Test
	public void CreateCouponTest() {
		
		CreateCouponVO coupon = new CreateCouponVO();
		coupon.setC_cp_name("쿠폰1");
		coupon.setC_cp_content("테스트용 쿠폰1");
		coupon.setC_cp_type("기본");
		coupon.setC_cp_price(1000);		
		mapper.create_coupon(coupon);
		
		log.info(coupon);
	}
	
	
	

}
