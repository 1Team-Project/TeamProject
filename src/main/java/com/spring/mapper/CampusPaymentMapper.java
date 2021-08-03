package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusCampingjangVO;
import com.spring.domain.CampusOrderDetailVO;
import com.spring.domain.CampusOrderVO;

public interface CampusPaymentMapper {
	
	public int cart_delete(@Param("u_userid") String u_userid,@Param("c_cartnumber") int c_cartnumber);
	public int payment_delete(int o_number);
	public int payment_delete2(int o_number);
	
	public CampusOrderVO o_number(String o_ordercode);
	public List<CampusOrderVO> listpaymentselect(String u_userid);
	public List<CampusOrderDetailVO> listpaymentselectdetail(int o_number);
	
	public int payment_add(CampusOrderVO vo);
	public int payment_detail_add(CampusOrderDetailVO vo);

	public int stock_change(@Param("p_stock")int p_stock, @Param("p_number")int p_number);
	public int stock_change_plus(@Param("p_stock")int p_stock, @Param("p_number")int p_number);
	
	public CampusOrderVO cancel_number(String success_code);
	public int pay_cancel(int o_number);
	public int pay_cancel_detail(int o_number);
	
	public int payment_camping_add(CampusCampingjangVO vo);
	public int payment_camping_delete(String success_code);
	public List<CampusCampingjangVO> payment_camping_view(String u_userid);
	public CampusCampingjangVO payment_camping_view_one(@Param("c_rsysdate") String c_rsysdate, @Param("c_area") int c_area);
}