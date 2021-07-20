package com.spring.service;

import java.util.List;

import com.spring.domain.CartVO;

public interface CartService {
	
	public boolean addCart(CartVO vo);
	public List<CartVO> listCart(String u_userid);
	public boolean delete(int c_cartnumber);
	public boolean modifyCart(CartVO vo);
	public boolean sum(String u_userid);

}
