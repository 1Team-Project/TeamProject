package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductVO;
import com.spring.mapper.CampusBoardAttachMapper;
import com.spring.mapper.CampusBoardMapper;
import com.spring.mapper.CampusProductMapper;
import com.spring.mapper.OptionMapper;
@Service
public class CampusProductServiceImpl implements CampusProductService {

	@Autowired
	CampusProductMapper productmapper;
	
	@Autowired
	CampusBoardMapper boardmapper;
	
	@Autowired
	OptionMapper optionmapper;
	
	@Autowired
	private CampusBoardAttachMapper attachMapper;
	
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
	@Transactional
	public boolean insertProduct(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob) {
		
		boolean test1 = productmapper.insertProduct(vo)>0;
		boolean test2 = boardmapper.insert_p(vob)>0;
		boolean test3 = optionmapper.insertProductOption(voo)>0;
		boolean result = false;

		
		//÷������ ���� Ȯ��
		if(vob.getAttachList()==null || vob.getAttachList().size()<=0) {
			
			if (test1 == test2 == test3) {
				result = true;
			}
			
			return result;
		}
		
		// ÷������ ���
		vob.getAttachList().forEach(attach -> {
			attach.setB_no(vob.getB_no());
			attachMapper.insert(attach);
		});

		return result;
		
		
	}

	@Override
	@Transactional
	public boolean deleteProduct(int p_number, int b_no) {
		
		boolean test1 = optionmapper.deleteProductOption(p_number)>0;
		boolean test2 = boardmapper.delete_p(p_number)>0;
		boolean test3 = productmapper.deleteProduct(p_number)>0;
		boolean test4 = attachMapper.delete(b_no)>0;
		boolean result = false;

		
		if (test1 == test2 == test3 == test4) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateProduct(int p_price, int p_stock, int p_number) {
		// TODO Auto-generated method stub
		return productmapper.updateProduct(p_price, p_stock, p_number)>0?true:false;
	}

	@Override
	public CampusProductVO viewProduct(int p_number) {
		// TODO Auto-generated method stub
		return productmapper.viewProduct(p_number);
	}

	@Override
	public CampusProductVO detailproduct(int p_number) {
		// TODO Auto-generated method stub
		return productmapper.productdetail(p_number);
	}

}