package com.market.domain;

import java.util.List;

import lombok.Data;

@Data
public class WishListVO {
	
	private int wish_idx;
	private String userid;
	private int pdid;
	
	public ProductVO product;
	public CategoryVO category;
	
	private List<WishListVO> check_list;
}

