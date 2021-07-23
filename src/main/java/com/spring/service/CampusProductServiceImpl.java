package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductCategoryVO;
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
	CampusBoardAttachMapper attachMapper;
	
	//전체리스트
	@Override
	public List<CampusProductVO> prolist(CampusCriteria cri) {
		return productmapper.prolist(cri);
	}
	
	//사진불러오기
//	@Override
//	public List<CampusAttachFileDTO> getImg() {
//		return attachMapper.getImg();
//	}
	
	//베스트3리스트
	@Override
	public List<CampusProductVO> bestlist() {
		return productmapper.bestlist();
	}
	
	//카테고리 통한 조회
	@Override
	public List<CampusProductVO> catelist(CampusCriteria cri,String pc_code) {
		return productmapper.catelist(cri,pc_code);
	}

	//개별 상품 조회
	@Override
	public CampusProductVO viewProduct(int p_number) {
		return productmapper.viewProduct(p_number);
	}
	
	
	@Override
	public int total(CampusCriteria cri) {
		return productmapper.totalPro(cri);
	}
	
	
	
	//관리자용
	@Override
	@Transactional
	public boolean insertProduct(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob) {
		
		boolean test1 = productmapper.insertProduct(vo)>0;
		boolean test2 = boardmapper.insert_p(vob)>0;
		boolean test3 = optionmapper.insertProductOption(voo)>0;
		boolean result = false;

		
		//첨부파일 여부 확인
		if(vob.getAttachList()==null || vob.getAttachList().size()<=0) {
			
			if (test1 == test2 == test3) {
				result = true;
			}
			
			return result;
		}
		
		// 첨부파일 등록
		vob.getAttachList().forEach(attach -> {
			attach.setB_no(vob.getB_no());
			
			attachMapper.insert_p(attach.getA_uuid(),attach.getA_path(),attach.getA_name(),1,attach.getB_no(),vo.getP_number());
			
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
	public CampusProductVO detailproduct(int p_number) {
		// TODO Auto-generated method stub
		return productmapper.productdetail(p_number);
	}

	
	@Override
	public List<CampusProductCategoryVO> category(CampusCriteria cri) {
		// TODO Auto-generated method stub
		return productmapper.category(cri);
	}


	@Override
	public List<CampusAttachFileDTO> getAttachList(int p_number) {
		return attachMapper.findByBno(p_number);
	}

	@Override
	public List<CampusProductOptionVO> optionlist(String op_optiontitle) {
		return productmapper.optionlist(op_optiontitle);
	}
	



}