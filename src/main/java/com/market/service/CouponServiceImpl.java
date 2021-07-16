package com.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.market.domain.UseCouponVO;
import com.market.mapper.SendCouponMapper;
import com.market.mapper.UseCouponMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CouponServiceImpl implements CouponService{

	
	@Autowired
	private SendCouponMapper send_mapper;
	
	@Autowired
	private UseCouponMapper use_mapper;


	@Transactional
	@Override
	public void update_send_coupon(String situ, int s_cp_idx) {
		// TODO Auto-generated method stub
		
		try {
			
			//String situ = "사용";
			System.out.println("s_cp-idx = " + s_cp_idx);
			send_mapper.use_send_coupon(situ, s_cp_idx);
			
			UseCouponVO use_coupon = new UseCouponVO();
			
			use_coupon.setS_cp_idx(s_cp_idx);
			
			use_mapper.insert_use_coupon(use_coupon);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		
	}
	
	
	
}
