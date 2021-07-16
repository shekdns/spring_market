package com.market.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.market.domain.CreateCouponVO;
import com.market.domain.Criteria;

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
//	@Test
//	public void CreateCouponTest() {
//		
//		CreateCouponVO coupon = new CreateCouponVO();
//		coupon.setC_cp_name("쿠폰1");
//		coupon.setC_cp_content("테스트용 쿠폰1");
//		coupon.setC_cp_type("기본");
//		coupon.setC_cp_price(1000);		
//		mapper.create_coupon(coupon);
//		
//		log.info(coupon);
//	}
	
	@Test
	public void testPaging() {

		Criteria cri = new Criteria();
		
	    //10개씩 3페이지 
	    cri.setPageNum(2);
	    cri.setAmount(10);

	    List<CreateCouponVO> list = mapper.getListWithPaging(cri);
	    
		list.forEach(coupon -> log.info(coupon));

	}
		

}
