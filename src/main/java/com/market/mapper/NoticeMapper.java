package com.market.mapper;

import java.util.List;

import com.market.domain.Criteria;
import com.market.domain.NoticeAttachVO;
import com.market.domain.NoticeVO;

public interface NoticeMapper {

	
	public Integer create_notice(NoticeVO notice);
	
	public NoticeVO read(int no_idx);
	
	public int delete_notice(int no_idx);
	
	public int update_notice(NoticeVO notice);
	
	public List<NoticeVO> getListWithPaging(Criteria cri); 
	
	public int getTotalCount(Criteria cri);
	
	public List<NoticeAttachVO> findByNo_Idx(int no_idx);
	
}
