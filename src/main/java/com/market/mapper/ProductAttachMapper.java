package com.market.mapper;

import java.util.List;

import com.market.domain.ProductAttachVO;


public interface ProductAttachMapper {
	
	public void pd_a_insert(ProductAttachVO pdavo);
	
	public void pd_a_delete(String pd_uuid);
	
	public List<ProductAttachVO> findByPdId(int pdid);

	public void deleteAll(int pdid);
	
}
