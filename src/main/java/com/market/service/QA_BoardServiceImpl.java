package com.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.Criteria;
import com.market.domain.QA_BoardVO;
import com.market.mapper.QA_BoardMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class QA_BoardServiceImpl implements QA_BoardService{
	
	
	
	@Autowired
	private QA_BoardMapper mapper;
	
	@Override
	public void register(QA_BoardVO qa_board) {
		// TODO Auto-generated method stub
		
		try {
			mapper.insertSelectKey(qa_board);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	@Override
	public QA_BoardVO get(int qa_idx) {
		// TODO Auto-generated method stub
		
	try {
			return mapper.read(qa_idx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public int modify(QA_BoardVO qa_board) {
		// TODO Auto-generated method stub
		
	try {
			return mapper.update(qa_board);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
		
	}

	@Override
	public int remove(int qa_idx) {
		// TODO Auto-generated method stub
	try {
			
			return mapper.delete(qa_idx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
		
	}

	@Override
	public List<QA_BoardVO> getList() {
		// TODO Auto-generated method stub
	try {
			return mapper.getList();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<QA_BoardVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
	try {
			return mapper.getListWithPaging(cri);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
	try {
			return mapper.getTotalCount(cri);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
	}

}
