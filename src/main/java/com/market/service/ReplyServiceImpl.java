package com.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.Criteria;
import com.market.domain.ReplyPageDTO;
import com.market.domain.ReplyVO;
import com.market.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper reply_mapper;
	
	
	@Override
	public int register(ReplyVO reply) {
		// TODO Auto-generated method stub
		try {
			return reply_mapper.insert(reply);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public ReplyVO get(int rno) {
		// TODO Auto-generated method stub
		
		try {
			return reply_mapper.read(rno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public int modify(ReplyVO reply) {
		// TODO Auto-generated method stub
		
		try {
			return reply_mapper.update(reply);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
		
		try {
			return reply_mapper.delete(rno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
		
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int r_pdid) {
		// TODO Auto-generated method stub
		
		
		try {
			return reply_mapper.getList(cri, r_pdid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public ReplyPageDTO getListWithPaging(Criteria cri, int r_pdid) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(
				reply_mapper.getCountByBno(r_pdid), 
				reply_mapper.getListWithPaging(cri, r_pdid));
	}
	
	
}
