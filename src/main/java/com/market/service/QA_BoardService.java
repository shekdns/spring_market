package com.market.service;

import java.util.List;

import com.market.domain.Criteria;
import com.market.domain.QA_BoardVO;



public interface QA_BoardService {
	
	
	public void register(QA_BoardVO qa_board);
	
	public QA_BoardVO get(int qa_idx);
	

	public int modify(QA_BoardVO qa_board);
	

	public int remove(int qa_idx);
	

	public List<QA_BoardVO> getList();
	

	public List<QA_BoardVO> getListWithPaging(Criteria cri);
	
	
	public int getTotal(Criteria cri);
	

	
}
