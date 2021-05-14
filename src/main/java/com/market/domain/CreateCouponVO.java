package com.market.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CreateCouponVO {

	private int c_cp_idx;
	private String c_cp_name;
	private String c_cp_content;
	private String c_cp_type;
	private int c_cp_price;
	private Date regdate;
	
	private List<CouponAttachVO> c_attachList;
	
}
