package com.market.mapper;

import java.util.List;

import com.market.domain.Criteria;
import com.market.domain.ProductAttachVO;
import com.market.domain.ProductVO;

public interface ProductMapper {
	
	public Integer register_product(ProductVO pro);
	
	public ProductVO read(int pdid);
	
	public int delete_product(int pdid);
	
	public int update_product(ProductVO pro);
	
	public List<ProductVO> getListWithPaging(Criteria cri); 
	
	//public CreateCouponVO getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<ProductAttachVO> findByPdId(int pdid);
	
	
	
	/* 프론트 영역*/
	public List<ProductVO> ScrollPaingStart(Criteria cri);
	
	public List<ProductVO> ScrollPagingDown(ProductVO pro);
	
	public List<ProductVO> ScrollPagingUp(ProductVO pro);
	 
}
