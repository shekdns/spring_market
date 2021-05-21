package com.market.mapper;

import java.util.List;

import com.market.domain.CouponAttachVO;
import com.market.domain.CreateCouponVO;
import com.market.domain.Criteria;

public interface CreateCouponMapper {
	
	public Integer create_coupon(CreateCouponVO coupon);
	
	public CreateCouponVO read(int c_cp_idx);
	
	public int delete_coupon(int c_cp_idx);
	
	public int update_coupon(CreateCouponVO coupon);
	
	public List<CreateCouponVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<CouponAttachVO> findByC_Idx(int c_cp_idx);
	
}
