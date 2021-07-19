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

<<<<<<< HEAD
	private int replyCnt; //ëŒ“ê¸€ ì „ì²´ ê°œìˆ˜
	private List<CampusReplyVO> list;
=======
	//ÆäÀÌÁö ³ª´©±â¿Í °ü·ÃµÈ Á¤º¸¸¦ ´ã°í ÀÖ´Â °´Ã¼
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private int r_page;
	
	public CampusReplyPageVO(int r_page, int total) {
		this.total = total;
		this.r_page = r_page;
	
		this.endPage = (int)(Math.ceil(r_page/10.0))*10;
		this.startPage = this.endPage-9;
		
		int realEnd = (int)(Math.ceil((total/1.0)/10));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
		
	}
>>>>>>> refs/remotes/origin/hanjung
	
}
