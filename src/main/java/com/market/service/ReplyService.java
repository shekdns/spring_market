package com.market.service;

import java.util.List;

import com.market.domain.Criteria;
import com.market.domain.ReplyPageDTO;
import com.market.domain.ReplyVO;



public interface ReplyService {
	

	public int register(ReplyVO reply);
	

	public ReplyVO get(int rno);

	
	public int modify(ReplyVO reply);
	
	
	public int remove(int rno);
	
	
	public List<ReplyVO> getList(Criteria cri, int r_pdid);
	

	public ReplyPageDTO getListWithPaging(Criteria cri, int r_pdid);
}
