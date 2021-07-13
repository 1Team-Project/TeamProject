<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">

<div class="container-fluid">
	<div class="row topmargin30">

	<div class="row">
	
		<div class="col-md-1"></div>
		<div class="col-md-10">
					<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section" style="font-family: naBrush;">통합 게시판</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12 colorthema hh4 padding6px margintb20">
				오늘의 화제글</div>
			<div class="row">
				<div class="col-md-12">
					<div class="row textcenter">
						<div class="col-md-4">
							<div class="card">
								<img class="card-img-top"
									src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
								<div class="card-block">
									<h5 class="card-title topmargin10">후기입니다</h5>
									<p class="card-text">안녕하세요 후기입니다...</p>
									<p>
										<a class="btn btn-primary" href="#">자세히 보기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<img class="card-img-top"
									src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg" />
								<div class="card-block">
									<h5 class="card-title topmargin10">리뷰입니다</h5>
									<p class="card-text">이것은 리뷰입니다 리뷰...</p>
									<p>
										<a class="btn btn-primary" href="#">자세히 보기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<img class="card-img-top"
									src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg" />
								<div class="card-block">
									<h5 class="card-title topmargin10">질문입니다</h5>
									<p class="card-text">이것은 질문입니다...</p>
									<p>
										<a class="btn btn-primary" href="#">자세히 보기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2 margintb20"></div>
			</div>
			<table class="table">
				<thead>
					<tr class="textcenter colorthema">
						<th class="width10">번호</th>
						<th class="width10">분류</th>
						<th class="width40">제목</th>
						<th class="width10">글쓴이</th>
						<th class="width20">작성일</th>
						<th class="width10">조회수</th>
					</tr>
				</thead>
				<tbody class="textcenter">
				
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="systest"><fmt:formatDate pattern="yyyy-MM-dd" value="${now}"/></c:set>
					
								
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.b_no}</td>
							<td>${vo.b_sort}</td>
							<td><a href="${vo.b_no}" class="blacktext hoverthema clickview">${vo.b_title}<strong class="badgecount">[${vo.replycnt}]</strong></a>
							<td>${vo.b_writer}</td>
							<td>
							
							<c:set var="bsys"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.b_sysdate}"/></c:set>
							<c:choose>
							
								<c:when test="${systest eq bsys}">
									<fmt:formatDate pattern="HH:mm" value="${vo.b_sysdate}" timeZone="Asia/Seoul"/>
								</c:when>
								
								<c:otherwise>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.b_sysdate}"/>
								</c:otherwise>
								
							</c:choose>

							</td>
							<td>${vo.b_views}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="row">
				<div class="col-md-12 mb-3">
					<select name="" id=""
						class="form-control width10 inlinetest boldergreen">
						<option value="">분류</option>
						<option value="후기">후기</option>
						<option value="질문">질문</option>
					</select> <input type="text"
						class="width30 boldergreen padding5px blacktext" />
					<button class="btn btn-primary">검색</button>
					<button class="btn btn-primary float-end" onclick="location.href='write'">글 쓰기</button>
					<!--<sec:authorize access="isAuthenticated()">-->
                 	<!--</sec:authorize>-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<ul class="mypagination justify-content-center">
					
					<c:if test="${CampusPageVO.prev}">
						<li class="mypage-item prev"><a href="${CampusPageVO.startPage-1}" class="mypage-link"> << </a></li>
					</c:if>	
					
					<c:forEach var="i" begin="${CampusPageVO.startPage}" end="${CampusPageVO.endPage}">
						<li class="mypage-item"><a href="${i}" class="mypage-link ${CampusPageVO.cri.page==i?'activecolor':''}">${i}</a></li>
					</c:forEach>
					
					<c:if test="${CampusPageVO.next}">
						<li class="mypage-item next"><a href="${CampusPageVO.endPage+1}" class="mypage-link"> >> </a></li>
					</c:if>	
					
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
		
	<form action="list" method="get" id="actionForm">	
		<input type="hidden" name="sort" value="${CampusPageVO.cri.sort}" />
		<input type="hidden" name="keyword" value="${CampusPageVO.cri.keyword}" />
		<input type="hidden" name="page" value="${CampusPageVO.cri.page}" />
		
	</form>            
	
	
</div>
<script>
	let result='${result}';

</script>
<script src="/resources/main/js/campuslist.js"></script>
<%@include file="../../design/footer.jsp"%>
