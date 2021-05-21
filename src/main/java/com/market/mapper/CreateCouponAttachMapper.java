package com.market.mapper;

import java.util.List;

import com.market.domain.CouponAttachVO;

public interface CreateCouponAttachMapper {
	
	public void c_a_insert(CouponAttachVO cavo);
	
	public void c_a_delete(String uuid);
	
	public List<CouponAttachVO> findByC_Idx(int c_cp_idx);

	public void deleteAll(int c_cp_idx);
}
