package com.spring.service;

import java.util.List;

<<<<<<< HEAD
import com.spring.domain.CampusProductVO;

public interface CampusProductService {

	public List<CampusProductVO> productList();
	public List<CampusProductVO> productCategory(String pc_code);
	public List<CampusProductVO> searchProduct(String p_name);
	
	public boolean insertProduct(CampusProductVO vo);
	public boolean deleteProduct(int p_number);
	public boolean updateProduct(int p_price, int p_stock);
}
=======
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductVO;

public interface CampusProductService {

	public List<CampusProductVO> productList();
	public List<CampusProductVO> productCategory(String pc_code);
	public List<CampusProductVO> searchProduct(String p_name);
	
	public CampusProductVO viewProduct(int p_number);
	
	public boolean insertProduct(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob);
	public boolean deleteProduct(int p_number, int b_no);
	public boolean updateProduct(int p_price, int p_stock, int p_number);
}
>>>>>>> refs/remotes/origin/hanjung
