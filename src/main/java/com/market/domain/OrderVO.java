package com.market.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	
	private int order_idx;
	private String order_id;
	private String order_zip;
	private String order_addr1;
	private String order_addr2;
	private String order_tel;
	private String order_phone;
	private int order_total;
	private String order_email;
	private int order_onum;
	private String order_situ;
	private String order_message;
	private String order_name;
	
	
	public List<OrderVO> check_list;
}
