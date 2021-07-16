package com.market.service;

import java.util.List;

import com.market.domain.Criteria;
import com.market.domain.NoticeAttachVO;
import com.market.domain.NoticeVO;

public interface NoticeService {
	
	
	public void create_notice(NoticeVO notice);
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public NoticeVO notice_get(int no_idx);
	
	public boolean notice_modify(NoticeVO notice);
	
	public boolean notice_remove(int no_idx);

	public List<NoticeAttachVO> getAttachList(int no_idx);
}
