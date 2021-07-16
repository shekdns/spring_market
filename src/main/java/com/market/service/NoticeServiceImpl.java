package com.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.Criteria;
import com.market.domain.NoticeAttachVO;
import com.market.domain.NoticeVO;
import com.market.mapper.NoticeAttachMapper;
import com.market.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	
	@Autowired
	private NoticeMapper mapper;
	
	@Autowired
	private NoticeAttachMapper attachMapper;
	

	@Autowired
	private SqlSessionTemplate noticeSqlSession;
	
	
	@Override
	public void create_notice(NoticeVO notice) {
		// TODO Auto-generated method stub
		
		mapper = noticeSqlSession.getMapper(NoticeMapper.class);
		
		mapper.create_notice(notice);
		
		if(notice.getNo_attachList() == null || notice.getNo_attachList().size() <= 0) {
			return;
		}
		
		notice.getNo_attachList().forEach(attach -> {
			
			attach.setNo_idx(notice.getNo_idx());
			attachMapper.no_a_insert(attach);
		});
		
	}

	@Override
	public List<NoticeVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public NoticeVO notice_get(int no_idx) {
		// TODO Auto-generated method stub
		return mapper.read(no_idx);
	}

	@Override
	public boolean notice_modify(NoticeVO notice) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(notice.getNo_idx());
		
		boolean modifyResult = mapper.update_notice(notice) == 1;
		
		if(modifyResult && notice.getNo_attachList() != null && notice.getNo_attachList().size() > 0) {
			
			notice.getNo_attachList().forEach(attach -> {
				
				attach.setNo_idx(notice.getNo_idx());
				attachMapper.no_a_insert(attach);
			});
			
		}
			
		
		return modifyResult;
	
	}

	@Override
	public boolean notice_remove(int no_idx) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(no_idx);
		
		return mapper.delete_notice(no_idx) == 1;
	}

	@Override
	public List<NoticeAttachVO> getAttachList(int no_idx) {
		// TODO Auto-generated method stub
		return attachMapper.findByNo_Idx(no_idx);
	}

}
