package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductVO;
import com.spring.mapper.CampusProductMapper;

@Service
public class CampusProductServiceImpl implements CampusProductService {

	@Autowired
	private CampusProductMapper mapper;
	
	@Override
	public List<CampusProductVO> prolist(CampusCriteria cri) {
		return mapper.prolist(cri);
	}
	@Override
	public List<CampusProductVO> bestlist() {
		return mapper.bestlist();
	}

	@Override
	public List<CampusProductVO> catelist(String pc_code) {
		return mapper.catelist(pc_code);
	}

	@Override
	public List<CampusProductVO> searchProduct(String p_name) {
		return mapper.searchProduct(p_name);
	}
	
	@Override
	public CampusProductVO viewProduct(int p_number) {
		return mapper.viewProduct(p_number);
	}
	@Override
	public int total(CampusCriteria cri) {
		return mapper.totalPro(cri);
	}
	

	
	


}
