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
		// 새글 등록
		boolean result = mapper.insert(vo)>0?true:false;
		
		//첨부파일 여부 확인
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return result;
		}
		
		// 첨부파일 등록
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
		
		//댓글 삭제
		replyMapper.deleteAll(bno);
		//첨부파일 삭제
		attachMapper.delete(bno);
		//게시글 삭제
		return mapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(CampusBoardVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		attachMapper.delete(vo.getB_no());
		//게시글 수정
		boolean modifyResult = mapper.update(vo)>0?true:false;
		//첨부파일 삽입
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
<<<<<<< HEAD
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
=======
	public List<CampusBoardVO> mainList(CampusCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.mainList(cri);
>>>>>>> refs/remotes/origin/youngkwon
	}

	
	
}
