package com.market.mapper;

import java.util.List;

import com.market.domain.CategoryVO;

public interface CategoryMapper {
	
	public Integer create_category(CategoryVO ca);
	
	public int delete_category(int cacode);
	
	public int update_category(CategoryVO ca);
	
	public CategoryVO read(int cacode);
	
	public List<CategoryVO> getList();
	
	public List<CategoryVO> getList8();
	
}
