package com.market.service;

import java.util.List;

import com.market.domain.WishListVO;


public interface WishListService {
	
	public void insert_wishList(WishListVO wish);
	
	public List<WishListVO> checkList(WishListVO wish);
	
	public int delete_wishList(WishListVO wish);
	
	public List<WishListVO> showList();
	
	public List<WishListVO> wish_info(String userid);
	
	public int getTotalCountWish(String userid);
	
	public int wish_check_delete(WishListVO wish);
	
}
