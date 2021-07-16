package com.market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.market.domain.Criteria;
import com.market.domain.ReplyVO;

public interface ReplyMapper {
	

	public int insert(ReplyVO vo);
	

	public ReplyVO read(int rno);
	

	public int delete(int rno);
	
	
	public int update(ReplyVO reply);
	
	
	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("r_pdid") int r_pdid);
	
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("r_pdid") int r_pdid);


	public int getCountByBno(int bno);
}
