package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

	
	public CampusOrderVO cancel_number(String success_code);
	public int pay_cancel(int o_number);
	public int pay_cancel_detail(int o_number);
	
}