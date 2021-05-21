package com.market.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 기본 페이지 및 검색 관련 클래스
@ToString
@Getter
@Setter
public class Criteria {

	private int pageNum;
	private int amount;
	private int gnrcode;
	
	private String type;
	private String keyword;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		
//		if(!StringUtils.isNumeric(String.valueOf(pageNum)) || pageNum == 0) {
//			this.pageNum = 1;
//		} else {
//			this.pageNum = pageNum;
//		}

		//this.pageNum = (!StringUtils.isNumeric(String.valueOf(pageNum)) || pageNum == 0) ? 10 : pageNum;   
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	public Criteria(int pageNum, int amount, int gnrcode) {
		
//		if(!StringUtils.isNumeric(String.valueOf(pageNum)) || pageNum == 0) {
//			this.pageNum = 1;
//		} else {
//			this.pageNum = pageNum;
//		}

		//this.pageNum = (!StringUtils.isNumeric(String.valueOf(pageNum)) || pageNum == 0) ? 10 : pageNum;   
		this.pageNum = pageNum;
		this.amount = amount;
		this.gnrcode = gnrcode;
	}
	

	

	public String[] getTypeArr() {
    
		return type == null? new String[] {}: type.split("");
	}
	

	
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("gnrcode", this.getGnrcode())
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
	
		return builder.toUriString();
	}
	
}
