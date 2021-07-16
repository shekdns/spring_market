package com.market.service;

import java.util.List;

import com.market.domain.Criteria;
import com.market.domain.ProductAttachVO;
import com.market.domain.ProductVO;

public interface ProductService {
	
	public void create_product(ProductVO pro);
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	//public CreateCouponVO getListWithPaging(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public ProductVO product_get(int pdid);
	
	public boolean product_modify(ProductVO pro);
	
	public boolean product_remove(int pdid);

	public List<ProductAttachVO> getAttachList(int pdid);
	
	
	//프론트 쪽
	public List<ProductVO> ScrollPaingStart(Criteria cri);
	
	public List<ProductVO> ScrollPagingDown(ProductVO pro);
	
	public List<ProductVO> ScrollPagingUp(ProductVO pro);

}
