package com.market.domain;

import lombok.Data;

@Data
public class ProductAttachVO {
	
	private String pd_uuid;
	private String pd_uploadPath;
	private String pd_fileName;
	private boolean pd_filetype;
	private int pdid;
	

	
}
