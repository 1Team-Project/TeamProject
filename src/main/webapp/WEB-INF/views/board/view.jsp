<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<link rel="stylesheet" href="/resources/main/css/campusBoard.css">


<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section hoverthema" style="font-family: naBrush" onclick="location.href='list'">통합 게시판
				</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">${campusVO.b_no} 번 글</h3>
			</div>
			<form action="">
				<div class="col-md-8 mll20">
					<span class="hh4">[${campusVO.b_sort}]</span>
					<input type="text"
						class="form-control width70 inlinetest readonlycolor hh4"  
						id="campusboard-title" readonly value="${campusVO.b_title}"/>
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
				
				<ul class="cbcontent justfiy-content-center nav" >
				
				</ul>
				
				<textarea class="form-control readonlycolor margintb20" cols="30" rows="15"
						style="resize: none" readonly >${campusVO.b_content}</textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">

					<div class="">
						<div class="">
							<i class=""></i> 첨부 목록
						</div>
						<div class="panel-body">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
				<div class="bigPictureWrapper">
					<div class="bigPicture"></div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<button class="btn btn-primary modifybutton" type="button">수정하기</button>
					<button class="btn btn-green2 listbutton" type="button">리스트</button>
				</div>
				</form>
				<hr class="one" />
		</div>

		<!-- 댓글 폼 -->
		<div class="col-md-1"></div>
		<div class="col-md-10 mll10">
			<form action="/board/replyadd" method="post">
				<div class="col-md-8 mll20">
								
					<input type="hidden" name = "r_replyer" value="김기기동"/>
					
					<input type="hidden" name="sort" value="${cri.sort}" />
					<input type="hidden" name="keyword" value="${cri.keyword}" />
					<input type="hidden" name="page" value="${cri.page}" />
					<input type="hidden" name="b_no" value="${campusVO.b_no}"/>
					<input type="hidden" name="b_views" value="${campusVO.b_views}"/>
					
					<h5>댓글 작성</h5>
					<textarea class="form-control lineview" cols="30" rows="3" name="r_content"
						style="resize: none"></textarea>
					<button class="btn btn-primary float-end m-1 mr-0" type="submit">댓글 작성</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-1"></div>
	
	<div class="col-md-1"></div>
	<div class="col-md-10 mll10">
		<hr class="one" />
		
		
		<!-- 댓글 리스트 -->

		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="systest"><fmt:formatDate pattern="yyyy-MM-dd" value="${now}"/></c:set>
		<c:forEach var="revo" items="${replyVO}">

			<div class="col-md-8 mll20 margintb20 divreply">
				<h6 class="float-start">${revo.r_replyer}</h6>
				<a href="${revo.r_no}" class="float-end blacktext hoverthema replymodify">[수정]</a>
				<a href="${revo.r_no}" class="float-end blacktext hoverthema replyremove">[삭제]</a>
					
				<c:set var="bsys"><fmt:formatDate pattern="yyyy-MM-dd" value="${revo.r_sysdate}"/></c:set>
				<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">
				<c:choose>
				
					<c:when test="${systest eq bsys}">
						<fmt:formatDate pattern="HH:mm" value="${revo.r_sysdate}" timeZone="Asia/Seoul"/>
					</c:when>
					
					<c:otherwise>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${revo.r_sysdate}"/>
					</c:otherwise>
					
				</c:choose>
				</h7>

				
				<div class="${revo.r_no}_btn"></div>
				<div class="${revo.r_no}_btn_X"></div>
				<textarea class="form-control ${revo.r_no}" cols="30" rows="3" name="r_content"
					style="resize: none" readonly>${revo.r_content}</textarea>
			</div>

		</c:forEach>

		<div class="row">
			<div class="col-md-12">
				<ul class="mypagination justify-content-center">
				
					<c:if test="${campusReplyPageVO.prev}">
						<li class="mypage-item prev"><a href="${campusReplyPageVO.startPage-1}" class="mypage-link"> << </a></li>
					</c:if>	
					
					<c:forEach var="i" begin="${campusReplyPageVO.startPage}" end="${campusReplyPageVO.endPage}">
						<li class="mypage-item"><a href="${i}" class="mypage-link ${r_page==i?'activecolor':''}">${i}</a></li>
					</c:forEach>
					
					<c:if test="${campusReplyPageVO.next}">
						<li class="mypage-item next"><a href="${campusReplyPageVO.endPage+1}" class="mypage-link"> >> </a></li>
					</c:if>	
					
				</ul>
			</div>
		</div>


		<button class="btn btn-green2 mll20 listbutton" type="button">리스트</button>

	</div>
	<div class="col-md-1"></div>

	<div class="col-md-1 margintb20"></div>
	
<form action="" id="operForm" method="get">
	<input type="hidden" name="sort" value="${cri.sort}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="b_no" value="${campusVO.b_no}"/>
</form>
		
<form action="" id="replyForm" method="get">
	<input type="hidden" name="sort" value="${cri.sort}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="b_no" value="${campusVO.b_no}"/>
	<input type="hidden" name="b_views" value="${campusVO.b_views}"/>
	<input type="hidden" name="r_page" value="1"/>
</form>     

					
<form action="" id="replyselfform" method="post">
	<input type="hidden" name="sort" value="${cri.sort}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="b_no" value="${campusVO.b_no}"/>
	<input type="hidden" name="b_views" value="${campusVO.b_views}"/>
	<input type="hidden" name="r_page" value="${r_page}"/>
</form>


</section>
<script>
	let b_no = ${campusVO.b_no};

	$(document).ready(function(){

		if(r_page > 1){
			
			var offset = $(".lineview").offset();
			$('html, body').animate({scrollTop : offset.top}, 0);
		}		
	});
	
</script>
<script src="/resources/main/js/campusview.js"></script>

<%@include file="../../design/footer.jsp"%>