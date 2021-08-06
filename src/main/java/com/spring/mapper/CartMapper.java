package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CartListVO;
import com.spring.domain.CartPaymentVO;
import com.spring.domain.CartVO;

public interface CartMapper {
	
	public int addCart(CartVO vo);

	public List<CartListVO> listCart(String u_userid);
	public int delete(List<Integer> checkArr);

	public CartPaymentVO getPayment(@Param("u_userid") String u_userid,@Param("c_cartnumber") int c_cartnumber);
	
	public List<CartPaymentVO> listPayment(String u_userid);
	public int delete(int c_cartnumber);
	public int modifyCart(CartVO vo);
	public int sum(String u_userid);	
	
	public int countCart(@Param("u_userid") String u_userid, @Param("p_number") int p_number);
	
}