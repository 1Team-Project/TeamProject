package com.spring.service;

import java.util.List;

import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;

public interface CartService {
	
	
//	public List<CartVO> cartMoney();
	public boolean addCart(CartVO vo);
	public List<CartListVO> listCart(String u_userid);
	public boolean delete(List<Integer> checkArr);
	//장바구니에 이미 상품 담겨져 있는지 확인
	public int countCart(String u_userid, int p_number);
	
	public boolean findCartProduct(CartVO vo);
	
	
	//장바구니 수량 변경
	public int sum(String u_userid);
	public void update(int c_cartnumber);
	public boolean modifyCart(CartVO vo);
	public boolean updateCart(CartVO vo);

}
