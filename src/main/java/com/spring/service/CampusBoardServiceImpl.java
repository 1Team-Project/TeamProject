package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.mapper.CampusBoardAttachMapper;
import com.spring.mapper.CampusBoardMapper;
import com.spring.mapper.CampusReplyMapper;

@Service
public class CampusBoardServiceImpl implements CampusBoardService {

	@Autowired
	private CampusBoardMapper mapper;
	
	@Autowired
	private CampusBoardAttachMapper attachMapper;
	
	@Autowired
	private CampusReplyMapper replyMapper;
	
	@Transactional
	@Override
	public boolean insert(CampusBoardVO vo) {
		// ���� ���
		boolean result = mapper.insert(vo)>0?true:false;
		
		//÷������ ���� Ȯ��
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return result;
		}
		
		// ÷������ ���
		vo.getAttachList().forEach(attach -> {
			attach.setB_no(vo.getB_no());
			attachMapper.insert(attach);
		});
		
		return result;
	}

	@Transactional
	@Override
	public boolean insert_p(CampusBoardVO vo) {
		// ���� ���
		boolean result = mapper.insert(vo)>0?true:false;
		
		return result;
	}
	
	@Transactional
	@Override
	public boolean delete(int bno) {
		
		//��� ����
		replyMapper.deleteAll(bno);
		//÷������ ����
		attachMapper.delete(bno);
		//�Խñ� ����
		return mapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(CampusBoardVO vo) {
		//������ ÷������ ���� ��� ���� �� ����
		attachMapper.delete(vo.getB_no());
		//�Խñ� ����
		boolean modifyResult = mapper.update(vo)>0?true:false;
		//÷������ ����
		if(modifyResult && vo.getAttachList().size()>0) {
			for(CampusAttachFileDTO dto:vo.getAttachList()) {
				dto.setB_no(vo.getB_no());
				attachMapper.insert(dto);
			}
		}

		return modifyResult;
	}

	@Override
	public List<CampusBoardVO> list(CampusCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.list(cri);
	}

	@Override
	public CampusBoardVO view(int bno) {
		// TODO Auto-generated method stub
		return mapper.view(bno);
	}

	@Override
	public int total(CampusCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.totalCnt(cri);
	}

	@Override
	public List<CampusAttachFileDTO> getAttachList(int bno) {
		// TODO Auto-generated method stub
		return attachMapper.findByBno(bno);
	}

	@Override
	public boolean addview(int views, int bno) {
		// TODO Auto-generated method stub
		return mapper.addview(views,bno)>0?true:false;
	}

	@Override
	public boolean replyadd(int bno, int replycnt) {
		// TODO Auto-generated method stub
		return mapper.replyCntUpdate(bno, replycnt)>0?true:false;
	}

	@Override
	public boolean delete_p(int p_number) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<CampusBoardVO> topdate() {
		return mapper.topdate();
	}

	
	
}
