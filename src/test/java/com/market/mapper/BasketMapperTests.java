package com.market.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.market.domain.BasketVO;
import com.market.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" , 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class BasketMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;
	
	@Test
	public void testGetTotalCount() {
		
		String userid = "test";
		
		int totalCnt = mapper.getTotalCountBasket(userid);

		log.info("totalCnt = " + totalCnt);

	}
	
//	@Test
//	public void testBasketInfo() {
//
//
//		String userid = "test";
//		
//	    List<BasketVO> list = mapper.basket_info(userid);
//	    
//		list.forEach(basket -> log.info(basket));
//
//	}
}
