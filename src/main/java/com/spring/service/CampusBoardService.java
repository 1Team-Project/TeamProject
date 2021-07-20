package com.spring.service;

import java.util.List;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;

public interface CampusBoardService {

	public boolean insert(CampusBoardVO vo);
	public boolean insert_p(CampusBoardVO vo);
	public boolean delete(int bno);
	public boolean delete_p(int p_number);
	public boolean update(CampusBoardVO vo);
	public List<CampusBoardVO> list(CampusCriteria cri);	
	public CampusBoardVO view(int bno);
	public int total(CampusCriteria cri);
	public boolean addview(int views, int bno);
	public boolean replyadd(int bno, int replycnt);
	public List<CampusBoardVO> topdate();
	
	public List<CampusAttachFileDTO> getAttachList(int bno);
	
	// 영권 메인 게시판 10개 보여주기용
	public List<CampusBoardVO> mainList(CampusCriteria cri);
}
