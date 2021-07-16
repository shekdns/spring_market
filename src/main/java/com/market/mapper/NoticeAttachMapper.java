package com.market.mapper;

import java.util.List;

import com.market.domain.NoticeAttachVO;


public interface NoticeAttachMapper {
	
	
	public void no_a_insert(NoticeAttachVO navo);
	
	public void no_a_delete(String no_uuid);
	
	public List<NoticeAttachVO> findByNo_Idx(int no_idx);

	public void deleteAll(int no_idx);
	
}
