package com.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.OrderDetailVO;
import com.market.domain.OrderVO;
import com.market.domain.SendCouponVO;
import com.market.mapper.OrderMapper;
import com.market.mapper.SendCouponMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService{
	
	
	@Autowired
	private SendCouponMapper send_mapper;
	
	@Autowired
	private OrderMapper order_mapper;
	
	
	@Override
	public List<SendCouponVO> show_coupon_order(String userid) {
		// TODO Auto-generated method stub
		try {
			return send_mapper.show_coupon_order(userid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void insert_order(OrderVO order) {
		// TODO Auto-generated method stub
		
		try {
			order_mapper.insert_order(order);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	@Override
	public void insert_order_detail(OrderDetailVO order_detail, int order_idx) {
		// TODO Auto-generated method stub
		
		try {
			
			System.out.println("order_idx = "+order_idx);
			order_detail.setOrder_idx(order_idx);
			order_mapper.insert_order_detail(order_detail);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	
}
