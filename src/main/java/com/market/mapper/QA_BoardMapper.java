package com.market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.market.domain.Criteria;
import com.market.domain.QA_BoardVO;


public interface QA_BoardMapper {

	
    public List<QA_BoardVO> getList();

	public List<QA_BoardVO> getListWithPaging(Criteria cri);
	
	
	public void insert(QA_BoardVO qa_board);

	public Integer insertSelectKey(QA_BoardVO qa_board);

	public QA_BoardVO read(int qa_idx);
	
	
	public int delete(int qa_idx);
	

	public int update(QA_BoardVO qa_board);
	

	public int getTotalCount(Criteria cri);
	

	public void updateQa_Hit(@Param("qa_idx") int qa_idx);
	
}
