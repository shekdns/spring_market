package com.market.service;

import java.util.List;

import com.market.domain.CategoryVO;
import com.market.domain.Criteria;

public interface CategoryService {
	
public void create_coupon(CategoryVO ca);
	
	public List<CategoryVO> getList();
	
	//public CreateCouponVO getListWithPaging(Criteria cri);
	
	//public int getTotal(Criteria cri);
	
	public CategoryVO coupon_get(int cacode);
	
	public boolean coupon_modify(CategoryVO ca);
	
	public boolean coupon_remove(int cacode);

	public List<CategoryVO> getList8();
	
}
