package com.market.service;

import java.util.List;

import com.market.domain.OrderDetailVO;
import com.market.domain.OrderVO;
import com.market.domain.SendCouponVO;

public interface OrderService {
	
	public List<SendCouponVO> show_coupon_order(String userid);

	public void insert_order(OrderVO order);
	
	public void insert_order_detail(OrderDetailVO order_detail, int order_idx);
}
