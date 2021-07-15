package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.OrderDetailVO;
import com.spring.mapper.ProductDetailMapper;


@Service
public class ProductDetailServiceImpl implements ProductDetailMapper {
	
	@Autowired ProductDetailMapper mapper;
	
	@Override
	public OrderDetailVO detailproduct(int p_number) {
		return mapper.detailproduct(p_number);
	}

}
