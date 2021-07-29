package com.spring.mapper;

import java.util.List;

<<<<<<< HEAD
=======
import com.spring.domain.CartListVO;
>>>>>>> refs/remotes/origin/seunghyun
import com.spring.domain.CartPaymentVO;
import com.spring.domain.CartVO;

public interface CartMapper {
	
	public int addCart(CartVO vo);
<<<<<<< HEAD
	public List<CartVO> listCart(String u_userid);
=======
	public List<CartListVO> listCart(String u_userid);
	public int delete(List<Integer> checkArr);
>>>>>>> refs/remotes/origin/seunghyun
	public List<CartPaymentVO> listPayment(String u_userid);
	public int delete(int c_cartnumber);
	public int modifyCart(CartVO vo);
	public int sum(String u_userid);	
}
