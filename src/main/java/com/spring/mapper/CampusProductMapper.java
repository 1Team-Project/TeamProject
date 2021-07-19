package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusProductVO;
import com.spring.domain.OrderDetailVO;

public interface CampusProductMapper {

	public List<CampusProductVO> productList();
	public List<CampusProductVO> productCategory(@Param("pc_code") String pc_code);
	public List<CampusProductVO> searchProduct(@Param("p_name") String p_name);
	
<<<<<<< HEAD
	public int insertProduct(CampusProductVO vo);
	public int deleteProduct(int p_number);
	public int updateProduct(@Param("p_price") int p_price,@Param("p_stock") int p_stock);

}


=======
	public CampusProductVO viewProduct(int p_number);
	
	public int insertProduct(CampusProductVO vo);
	public int deleteProduct(int p_number);
	public int updateProduct(@Param("p_price") int p_price,@Param("p_stock") int p_stock,@Param("p_number") int p_number);
	
	public CampusProductVO productdetail(int p_number);

}
>>>>>>> refs/remotes/origin/hanjung
