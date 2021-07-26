package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;
import com.spring.mapper.CartMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Override
	public boolean addCart(CartVO vo) {
		log.info("카트" +vo);
		return mapper.addCart(vo) > 0 ? true:false;
	}

	@Override
	public List<CartListVO> listCart(String u_userid) {
		// TODO Auto-generated method stub
		return mapper.listCart(u_userid);
	}

	@Override
	public boolean delete(List<Integer> checkArr) {
		// TODO Auto-generated method stub
		//int result = mapper.delete(checkArr);
		
		return mapper.delete(checkArr) > 0? true:false;
	}

	@Override
	public boolean modifyCart(CartVO vo) {
		// TODO Auto-generated method stub
		return mapper.modifyCart(vo) > 0 ? true:false;
	}

	@Override
	public int sum(String u_userid) {
		// TODO Auto-generated method stub
		return mapper.sum(u_userid);
	}

//	@Override
//	public List<CartVO> cartMoney() {
//		// TODO Auto-generated method stub
//		return null;
//	}



	@Override
	public int countCart(String u_userid, int p_number) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void update(int c_cartnumber) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean updateCart(CartVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

}
