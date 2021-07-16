package com.market.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private int od_detail_num;
	private int order_idx;
	private int pdid;
	private int od_cnt;
	
	public List<OrderDetailVO> check_list;
}
