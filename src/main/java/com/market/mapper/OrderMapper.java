package com.market.mapper;

import com.market.domain.OrderDetailVO;
import com.market.domain.OrderVO;

public interface OrderMapper {
	
	//order
	public Integer insert_order(OrderVO order);
	
	
	//order detail
	public Integer insert_order_detail(OrderDetailVO order_detail);
	
	
	
	
}
