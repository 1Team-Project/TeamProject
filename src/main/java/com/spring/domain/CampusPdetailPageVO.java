package com.spring.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CampusPdetailPageVO {

	private int replyCnt; //댓글 전체 개수
	private List<CampusBoardVO> list;

}

