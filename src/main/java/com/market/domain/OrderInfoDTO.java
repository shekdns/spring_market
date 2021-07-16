package com.market.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderInfoDTO {
	
	private int bk_cnt;
	private int pdid;
	private int pdprice;
	private String userid;
	private String img;
	private String pdname;
	private String caname;
	
	public List<OrderInfoDTO> check_list;
}
