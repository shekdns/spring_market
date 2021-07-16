package com.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.market.domain.CouponAttachVO;
import com.market.domain.CreateCouponVO;
import com.market.domain.Criteria;
import com.market.mapper.CreateCouponAttachMapper;
import com.market.mapper.CreateCouponMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class CreateCouponServiceImpl implements CreateCouponService{
	
	@Autowired
	private CreateCouponMapper mapper;
	
	@Autowired
	private CreateCouponAttachMapper attachMapper;
	

	@Autowired
	private SqlSessionTemplate couponSqlSession;
	
	
	@Transactional
	@Override
	public void create_coupon(CreateCouponVO coupon) {
		// TODO Auto-generated method stub
		
		mapper = couponSqlSession.getMapper(CreateCouponMapper.class);
		
		mapper.create_coupon(coupon);
		
		if(coupon.getC_attachList() == null || coupon.getC_attachList().size() <= 0) {
			return;
		}
		
		coupon.getC_attachList().forEach(attach ->{
			
			attach.setC_cp_idx(coupon.getC_cp_idx());
			attachMapper.c_a_insert(attach);
		});
		
	}

	@Override
	public List<CreateCouponVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public CreateCouponVO coupon_get(int c_cp_idx) {
		// TODO Auto-generated method stub
		return mapper.read(c_cp_idx);
	}
	
	@Transactional
	@Override
	public boolean coupon_modify(CreateCouponVO coupon) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(coupon.getC_cp_idx());
		
		boolean modifyResult = mapper.update_coupon(coupon) == 1;
		
		if(modifyResult && coupon.getC_attachList() != null && coupon.getC_attachList().size() > 0) {
			
			coupon.getC_attachList().forEach(attach -> {
				
				attach.setC_cp_idx(coupon.getC_cp_idx());
				attachMapper.c_a_insert(attach);
				
			});
			
		}
		
		return modifyResult;
	}

	@Override
	public boolean coupon_remove(int c_cp_idx) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(c_cp_idx);
		
		return mapper.delete_coupon(c_cp_idx) == 1;
	}

	@Override
	public List<CouponAttachVO> getAttachList(int c_cp_idx) {
		// TODO Auto-generated method stub
		return attachMapper.findByC_Idx(c_cp_idx);
	}


	

	
	
}
