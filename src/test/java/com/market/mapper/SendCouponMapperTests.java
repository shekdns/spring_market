package com.market.mapper;

import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.market.domain.SendCouponVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" , 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class SendCouponMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private SendCouponMapper mapper;
	
//	@Test
//	public void SendCouponTest() {
//		
//		SendCouponVO coupon = new SendCouponVO(); 
//		UUID uuid = UUID.randomUUID();
//		
//		coupon.setUserid("test");
//		coupon.setC_cp_idx(154);
//		coupon.setS_cp_uuid(uuid.toString());
//		mapper.send_coupon_insert(coupon);
//		
//		log.info(coupon);
//	}
	
	@Test
	public void testShow_order_coupon() {


		String userid = "test";
		
	    List<SendCouponVO> list = mapper.show_coupon_order(userid);
	    
		list.forEach(coupon -> log.info(coupon));

	}
	
	
}
