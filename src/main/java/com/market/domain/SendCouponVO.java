package com.market.domain;

import lombok.Data;

@Data
public class SendCouponVO {
	
	private int s_cp_idx;
	private String userid;
	private String s_cp_uuid;
	private String send_date;
	private int c_cp_idx;
	private String situ;
	
	private MemberVO member;
	private CreateCouponVO c_coupon;
	
}
