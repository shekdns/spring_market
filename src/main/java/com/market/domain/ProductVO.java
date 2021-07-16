package com.market.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	
	private int pdid;
	private String pdname;
	private int pdprice;
	private String pdcontent;
	private int pdreviewcnt;
	private int pdhit;
	private Date regdate;
	private Date updateDate;
	private int cacode;
	private String main_img;

	private List<ProductAttachVO> pd_attachList;
}
