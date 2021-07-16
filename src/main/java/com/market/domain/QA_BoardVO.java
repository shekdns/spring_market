package com.market.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QA_BoardVO {
	
	private int qa_idx;
	private String userid;
	private String qa_pw;
	private String qa_title;
	private String qa_content;
	private String qa_file;
	private Date regdate;
	private Date updatedate;
	private int qa_locked;
	private int qa_hit;
	private int thread;
	private int depth;
	private int group_num;
	private String re_userid;
	private String re_regdate;
	private String re_updatedate;
	
}
