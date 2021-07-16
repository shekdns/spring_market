package com.market.domain;

import java.util.List;

import lombok.Data;

@Data
public class BasketVO {
	
	private int bk_idx;
	private String userid;
	private int pdid;
	private int bk_cnt;
	
	public ProductVO product;
	public CategoryVO category;
	
	private List<BasketVO> check_list;
}
