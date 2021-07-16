package com.market.service;

import java.util.List;

import com.market.domain.BasketVO;

public interface BasketService {
	
	public void insert_basket(BasketVO basket);
	
	public List<BasketVO> basket_all_list();
	
	public List<BasketVO> basketInfo(String userid);
	
	public int getTotalCountBasket(String userid);
	
	public int basket_delete(int bk_idx);
	
	public int basket_check_delete(BasketVO basket);
	
	List<BasketVO> basket_all_list_userid(String userid);
}
