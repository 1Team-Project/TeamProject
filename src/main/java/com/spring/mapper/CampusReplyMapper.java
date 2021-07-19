package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusReplyVO;

public interface CampusReplyMapper {

	public int insert(CampusReplyVO reply);
	
	public CampusReplyVO read(int r_no);
	
	public int update(CampusReplyVO reply);
	
	public int delete(int r_no);
	
<<<<<<< HEAD
	//댓글
	public int deleteAll(int bno);
=======
	//���
	public int deleteAll(int b_no);
>>>>>>> refs/remotes/origin/hanjung
	
	
	public int getCountByBno(int b_no);
	
<<<<<<< HEAD
	public List<CampusReplyVO> list(@Param("r_page") int r_page, @Param("b_no") int b_no);
=======
	public List<CampusReplyVO> list(@Param("cri")CampusCriteria cri,@Param("bno")int bno);
	
	// 영권 메인 게시판 10개 보여주기용
	public List<CampusReplyVO> mainList(@Param("cri")CampusCriteria cri,@Param("bno")int bno);
>>>>>>> refs/remotes/origin/youngkwon
}
