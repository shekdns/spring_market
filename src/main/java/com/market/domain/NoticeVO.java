package com.market.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int no_idx;
	private String no_writer;
	private String no_title;
	private String no_semi_title;
	private String no_content;
	private Date regdate;
	private Date updateDate;
	
	private List<NoticeAttachVO> no_attachList;
	
	
}
