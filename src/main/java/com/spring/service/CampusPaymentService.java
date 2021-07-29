package com.spring.service;

import java.util.List;

import com.spring.domain.CampusOrderDetailVO;
import com.spring.domain.CampusOrderVO;

public interface CampusPaymentService {

	public boolean cart_delete(String u_userid, int o_number);
	public boolean payment_delete(int o_number);
	public boolean payment_delete2(int o_number);
	
	
	public List<CampusOrderVO> listpaymentselect(String u_userid);
	public List<CampusOrderDetailVO> listpaymentselectdetail(int o_number);
	public boolean payment_add(CampusOrderVO vo, List<CampusOrderDetailVO> list);
	public boolean payment_detail_add(CampusOrderDetailVO vo);

	
}
