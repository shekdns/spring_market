package com.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.market.domain.Criteria;
import com.market.domain.ProductAttachVO;
import com.market.domain.ProductVO;
import com.market.mapper.ProductAttachMapper;
import com.market.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private ProductAttachMapper attachMapper;
	
	@Autowired
	private SqlSessionTemplate productSqlSession;
	
	
	@Transactional
	@Override
	public void create_product(ProductVO pro) {
		// TODO Auto-generated method stub
		
		mapper = productSqlSession.getMapper(ProductMapper.class);
		
		mapper.register_product(pro);
		
		if(pro.getPd_attachList() == null || pro.getPd_attachList().size() <= 0) {
			return;
		}
		
		pro.getPd_attachList().forEach(attach ->{
			
			attach.setPdid(pro.getPdid());
			attachMapper.pd_a_insert(attach);
		});
		
	}
	
	
	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public ProductVO product_get(int pdid) {
		// TODO Auto-generated method stub
		return mapper.read(pdid);
	}
	
	@Transactional
	@Override
	public boolean product_modify(ProductVO pro) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(pro.getPdid());
		
		boolean modifyResult = mapper.update_product(pro) == 1;
		
		if(modifyResult && pro.getPd_attachList() != null && pro.getPd_attachList().size() > 0) {
			
			pro.getPd_attachList().forEach(attach -> {
				
				attach.setPdid(pro.getPdid());
				attachMapper.pd_a_insert(attach);
				
			});
			
		}
		
		return modifyResult;
	}

	@Override
	public boolean product_remove(int pdid) {
		// TODO Auto-generated method stub
		attachMapper.deleteAll(pdid);
		
		return mapper.delete_product(pdid) == 1;
	}

	@Override
	public List<ProductAttachVO> getAttachList(int pdid) {
		// TODO Auto-generated method stub
		return attachMapper.findByPdId(pdid);
	}


	@Override
	public List<ProductVO> ScrollPaingStart(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.ScrollPaingStart(cri);
	}


	@Override
	public List<ProductVO> ScrollPagingDown(ProductVO pro) {
		// TODO Auto-generated method stub
		
		return mapper.ScrollPagingDown(pro);
	}


	@Override
	public List<ProductVO> ScrollPagingUp(ProductVO pro) {
		// TODO Auto-generated method stub
		return mapper.ScrollPagingUp(pro);
	}




	
	
}
