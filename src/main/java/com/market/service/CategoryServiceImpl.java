package com.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.CategoryVO;
import com.market.domain.Criteria;
import com.market.mapper.CategoryMapper;
import com.market.mapper.CreateCouponMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryMapper mapper;
	
	@Autowired
	private SqlSessionTemplate cateSqlSession;
	
	
	@Override
	public void create_coupon(CategoryVO ca) {
		// TODO Auto-generated method stub
		
		mapper = cateSqlSession.getMapper(CategoryMapper.class);
		
		mapper.create_category(ca);
		
	}

	@Override
	public List<CategoryVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public CategoryVO coupon_get(int cacode) {
		// TODO Auto-generated method stub
		return mapper.read(cacode);
	}

	@Override
	public boolean coupon_modify(CategoryVO ca) {
		// TODO Auto-generated method stub
		return mapper.update_category(ca) == 1;
	}

	@Override
	public boolean coupon_remove(int cacode) {
		// TODO Auto-generated method stub
		return mapper.delete_category(cacode) == 1;
	}

	@Override
	public List<CategoryVO> getList8() {
		// TODO Auto-generated method stub
		
		try {
			return mapper.getList8();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	}

		
	
}
