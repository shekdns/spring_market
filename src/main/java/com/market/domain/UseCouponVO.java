package com.market.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UseCouponVO {
	
	private int u_cp_idx;
	private int s_cp_idx;
	private Date use_date;
	
	public SendCouponVO send_coupon;



}
