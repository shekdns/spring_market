package com.market.domain;

import lombok.Data;

@Data
public class CouponAttachVO {

	private String c_uuid;
	private String c_uploadPath;
	private String c_fileName;
	private boolean c_filetype;

	private int c_cp_idx;

}
