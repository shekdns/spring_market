package com.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.BasketVO;
import com.market.mapper.BasketMapper;

@Service
public class BasketServiceImpl implements BasketService{

	
	@Autowired
	private BasketMapper mapper;
	
	@Autowired
	private SqlSessionTemplate basketSqlSession;
	
	@Override
	public void insert_basket(BasketVO basket) {
		// TODO Auto-generated method stub
		try {
			
			mapper = basketSqlSession.getMapper(BasketMapper.class);
			mapper.insert_basket(basket);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public List<BasketVO> basket_all_list() {
		// TODO Auto-generated method stub
		
		try {
			return mapper.basket_all_list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	}

	@Override
	public List<BasketVO> basketInfo(String userid) {
		// TODO Auto-generated method stub
		
		try {
			return mapper.basket_info(userid);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	
	}

	@Override
	public int getTotalCountBasket(String userid) {
		// TODO Auto-generated method stub
		try {
			
			return mapper.getTotalCountBasket(userid);
		} catch (Exception e) {
			// TODO: handle exception
		
			e.printStackTrace();
			return 0;
		}
		
		
	}

	@Override
	public int basket_delete(int bk_idx) {
		// TODO Auto-generated method stub
		
		try {
			return mapper.basket_delete(bk_idx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	
	}

	@Override
	public int basket_check_delete(BasketVO basket) {
		// TODO Auto-generated method stub
		
		try {
			return mapper.basket_check_delete(basket);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
	
	}

	@Override
	public List<BasketVO> basket_all_list_userid(String userid) {
		// TODO Auto-generated method stub
		
		try {
			return mapper.basket_all_list_userid(userid);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			return null;
		}
		

	}

}
