package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CampusProductVO;
import com.spring.mapper.CampusProductMapper;

@Service
public class CampusProductServiceImpl implements CampusProductService {

	@Autowired
	private CampusProductMapper mapper;
	
	@Override
	public List<CampusProductVO> prolist() {
		return mapper.prolist();
	}
	@Override
	public List<CampusProductVO> bestlist() {
		return mapper.bestlist();
	}

	@Override
	public List<CampusProductVO> productCategory(String pc_code) {
		return mapper.productCategory(pc_code);
	}

	@Override
	public List<CampusProductVO> searchProduct(String p_name) {
		return mapper.searchProduct(p_name);
	}
	
	@Override
	public CampusProductVO viewProduct(int p_number) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateProduct(int p_price, int p_stock, int p_number) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProduct(CampusProductVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(int p_number) {
		// TODO Auto-generated method stub
		return 0;
	}


}
