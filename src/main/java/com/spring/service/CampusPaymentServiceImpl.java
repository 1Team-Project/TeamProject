package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.CampusOrderDetailVO;
import com.spring.domain.CampusOrderVO;
import com.spring.mapper.CampusPaymentMapper;

@Service
public class CampusPaymentServiceImpl implements CampusPaymentService {

	@Autowired
	private CampusPaymentMapper mapper;
	
	
	@Override
	@Transactional
	public boolean cart_delete(String u_userid, int o_number, List<CampusOrderDetailVO> list) {

		boolean result = false;
		
		//if(mapper.payment_delete(o_number)>0?true:false) {
			//boolean check2 = mapper.payment_delete2(o_number)>0?true:false;
		
			for(CampusOrderDetailVO vo:list) {
				mapper.cart_delete(u_userid,vo.getC_cartnumber());
				
				result = true;
			}
		
		
			
			//if(check1 == true && check2 == true) {
				//result = true;
			//}
			
		//}
		
		return result;
	}

	@Override
	public boolean payment_delete(int o_number) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean payment_delete2(int o_number) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional
	public boolean payment_add(CampusOrderVO vo, List<CampusOrderDetailVO> list) {
		
		boolean result = false;
		
		if(mapper.payment_add(vo)>0?true:false) {			

			for(CampusOrderDetailVO vod:list) {
				CampusOrderVO o_numbers = mapper.o_number(vo.getO_ordercode());
				int o_number = o_numbers.getO_number();
				vod.setO_number(o_number);
				mapper.payment_detail_add(vod);
			}
			
			result = true;			
			
		}
		return result;
			
	}
		
	@Override
	public boolean payment_detail_add(CampusOrderDetailVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<CampusOrderVO> listpaymentselect(String u_userid) {
		
		return mapper.listpaymentselect(u_userid);
	}

	@Override
	public List<CampusOrderDetailVO> listpaymentselectdetail(int o_number) {
		// TODO Auto-generated method stub
		return mapper.listpaymentselectdetail(o_number);
	}

	@Override
	public CampusOrderVO cancel_number(String success_code) {

		return mapper.cancel_number(success_code);
	}

	@Override
	@Transactional
	public boolean pay_cancel(int o_number) {

		boolean result = false;
		
		if(mapper.pay_cancel_detail(o_number)>0?true:false) {
			
			result = mapper.pay_cancel(o_number)>0?true:false;
		}
		
		return result;
	}

	@Override
	public boolean pay_cancel_detail(int o_number) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean stock_change(int p_stock, int p_number) {
		// TODO Auto-generated method stub
		return mapper.stock_change(p_stock, p_number)>0?true:false;
	}

	@Override
	public boolean stock_change_plus(int p_stock, int p_number) {
		// TODO Auto-generated method stub
		return mapper.stock_change_plus(p_stock, p_number)>0?true:false;
	}

	@Override
	public List<CampusOrderDetailVO> orderdetaillist(String u_userid) {
		// TODO Auto-generated method stub
		return mapper.orderdetaillist(u_userid);
	}

}