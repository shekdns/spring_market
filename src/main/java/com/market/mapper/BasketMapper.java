package com.market.mapper;

import java.util.List;

import com.market.domain.BasketVO;

public interface BasketMapper {

	
	public Integer insert_basket(BasketVO basket);
	
	List<BasketVO> basket_all_list();
	
	public int getTotalCountBasket(String userid);
	
	List<BasketVO> basket_info(String userid);
	
	public int basket_delete(int bk_idx);
	
	public int basket_check_delete(BasketVO basket);
	
	//관심목록 -> 장바구니
	List<BasketVO> basket_all_list_userid(String userid);
	
}
