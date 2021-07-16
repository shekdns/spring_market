package com.market.mapper;

import java.util.List;

import com.market.domain.WishListVO;

public interface WishListMapper {

	public Integer insert_wishList(WishListVO wish);
	
	public int delete_wishList(WishListVO wish);
	
	public List<WishListVO> checkList(WishListVO wish);
	
	public List<WishListVO> showList();
	
	public List<WishListVO> wish_info(String userid);
	
	public int getTotalCountWish(String userid);
	
	public int wish_check_delete(WishListVO wish);
	
}
