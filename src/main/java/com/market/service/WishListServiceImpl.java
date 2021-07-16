package com.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.WishListVO;
import com.market.mapper.WishListMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class WishListServiceImpl implements WishListService{
	
	
	@Autowired
	private WishListMapper mapper;
	
	@Autowired
	private SqlSessionTemplate wishSqlSession;
	
	@Override
	public void insert_wishList(WishListVO wish) {
		// TODO Auto-generated method stub
		
		mapper = wishSqlSession.getMapper(WishListMapper.class);
		
		try {
			mapper.insert_wishList(wish);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public List<WishListVO> checkList(WishListVO wish) {
		// TODO Auto-generated method stub
		
		mapper = wishSqlSession.getMapper(WishListMapper.class);
		
		
		try {
			return mapper.checkList(wish);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	}

	@Override
	public int delete_wishList(WishListVO wish) {
		// TODO Auto-generated method stub
		
		mapper = wishSqlSession.getMapper(WishListMapper.class);
		
		
		try {
			return mapper.delete_wishList(wish);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public List<WishListVO> showList() {
		// TODO Auto-generated method stub
		
		mapper = wishSqlSession.getMapper(WishListMapper.class);
		
		
		try {
			return mapper.showList();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	}

	@Override
	public List<WishListVO> wish_info(String userid) {
		// TODO Auto-generated method stub
		
		try {
			
			return mapper.wish_info(userid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	
	
	}

	@Override
	public int getTotalCountWish(String userid) {
		// TODO Auto-generated method stub
		
		try {
			return mapper.getTotalCountWish(userid);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		
		
	}

	@Override
	public int wish_check_delete(WishListVO wish) {
		// TODO Auto-generated method stub
		
		try {
			return mapper.wish_check_delete(wish);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
		
	}

}
