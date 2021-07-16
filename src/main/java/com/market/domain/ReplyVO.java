package com.market.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rno;
	private int r_pdid;
	private String replyer;
	private String reply;
	private Date regDate;
	private Date updateDate;
	
}
