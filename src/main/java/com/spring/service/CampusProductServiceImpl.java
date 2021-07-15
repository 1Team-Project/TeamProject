package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.CampusProductVO;
@Service
public class CampusProductServiceImpl implements CampusProductService {

	@Override
	public List<CampusProductVO> productList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CampusProductVO> productCategory(String pc_code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CampusProductVO> searchProduct(String p_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertProduct(CampusProductVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteProduct(int p_number) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateProduct(int p_price, int p_stock) {
		// TODO Auto-generated method stub
		return false;
	}

}
