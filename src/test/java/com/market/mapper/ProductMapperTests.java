package com.market.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.market.domain.CreateCouponVO;
import com.market.domain.Criteria;
import com.market.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" , 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class ProductMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//	    //10개씩 3페이지 
//	    cri.setPageNum(1);
//	    cri.setAmount(10);
//	    cri.setCacode(1);
//	    
//	    List<ProductVO> list = mapper.getListWithPaging(cri);
//	    
//		list.forEach(pro -> log.info(pro));
//
//	}
	
	//상품 생성
	@Test
	public void CreateProductTest() {
		
		ProductVO product = new ProductVO();
		
		for(int i = 1; i < 80; i++) {
			
			product.setPdname("테스트" + i);
			product.setPdprice(1000 + i);
			product.setPdcontent("테스트내용" + i);
			product.setCacode(1);
			product.setMain_img("");
			mapper.register_product(product);
			
			log.info(product);
		}
	}
	
//	@Test
//	public void testScrollPaging() {
//
//				Criteria cri = new Criteria();
//				
//			    //10개씩 3페이지 
//			    cri.setCacode(1);
//			    
//			    List<ProductVO> list = mapper.ScrollPaingStart(cri);
//			    
//				list.forEach(pro -> log.info(pro));
//		
//	}
	
//	@Test
//	public void testScrollPaing2() {
//		
//		//Criteria cri = new Criteria();
//		
//		//cri.setCacode(1);
//		
//		ProductVO p = new ProductVO();
//		
//		p.setPdid(61); 
//		p.setCacode(1);
//		List<ProductVO> list = mapper.ScrollPaging(p);
//		list.forEach(pro -> log.info(pro));
//	}
}	
