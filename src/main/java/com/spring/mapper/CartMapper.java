package com.spring.mapper;

import java.util.List;

import com.spring.domain.CartPaymentVO;
import com.spring.domain.CartVO;

public interface CartMapper {
	
	public int addCart(CartVO vo);
	public List<CartVO> listCart(String u_userid);
	public List<CartPaymentVO> listPayment(String u_userid);
	public int delete(int c_cartnumber);
	public int modifyCart(CartVO vo);
	public int sum(String u_userid);	
}
