package com.spring.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor

public class CampusReplyPageVO {

	private int replyCnt; //댓글 전체 개수
	private List<CampusReplyVO> list;
	
}
