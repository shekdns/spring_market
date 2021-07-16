package com.market.domain;

import lombok.Data;

@Data
public class NoticeAttachVO {
	
	private String no_uuid;
	private String no_uploadPath;
	private String no_fileName;
	private boolean no_filetype;
	
	private int no_idx;
	
}
