package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusReplyVO;
import com.spring.mapper.CampusReplyMapper;


@Service
public class CampusReplyServiceImpl implements CampusReplyService {

	@Autowired
	private CampusReplyMapper replyMapper;
	
	@Override
	public CampusReplyVO read(int rno) {
		CampusReplyVO vo = replyMapper.read(rno);
		return vo;
	}

	@Override
	public boolean insert(CampusReplyVO reply) {
		// TODO Auto-generated method stub
		return replyMapper.insert(reply)>0?true:false;
	}

	@Override
	public boolean update(CampusReplyVO reply) {
		// TODO Auto-generated method stub
		return replyMapper.update(reply)>0?true:false;
	}

	@Override
	public boolean delete(int rno) {
		// TODO Auto-generated method stub
		return replyMapper.delete(rno)>0?true:false;
	}

	@Override
	public boolean deleteAll(int bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getCountByBno(int b_no) {
		// TODO Auto-generated method stub
		return replyMapper.getCountByBno(b_no);
	}

	@Override
	public List<CampusReplyVO> list(int r_page, int b_no) {

		return replyMapper.list(r_page, b_no);
	}

}
