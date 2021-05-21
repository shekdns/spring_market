package com.market.service;

import java.util.List;

import com.market.domain.CouponAttachVO;
import com.market.domain.CreateCouponVO;
import com.market.domain.Criteria;

public interface CreateCouponService {
	
	public void create_coupon(CreateCouponVO coupon);
	
	public List<CreateCouponVO> getListWithPaging(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public CreateCouponVO coupon_get(int c_cp_idx);
	
	public boolean coupon_modify(CreateCouponVO coupon);
	
	public boolean coupon_remove(int c_cp_idx);

	public List<CouponAttachVO> getAttachList(int c_cp_idx);
	
	

}
