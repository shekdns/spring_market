package com.market.mapper;

import java.util.List;

import com.market.domain.SendCouponVO;

public interface SendCouponMapper {
	
	public void send_coupon_insert(SendCouponVO send_coupon);
	
	public List<SendCouponVO> show_coupon_order(String userid);
	
	public int use_send_coupon(String situ, int s_cp_idx);

}
