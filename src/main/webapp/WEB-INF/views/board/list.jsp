<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<div class="container-fluid">
	<div class="row topmargin30">

	<div class="row">
	
		<div class="col-md-1"></div>
		<div class="col-md-10">
				<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section hoverthema" style="font-family: naBrush;" onclick="location.href='list'">통합 게시판</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12 colorthema hh4 padding6px margintb20">
				오늘의 화제글</div>
			<div class="row">
				<div class="col-md-12">
					<div class="row textcenter">

					
					<c:forEach var="toooop" items="${CampusTopVO}">
						<div class="col-md-4">
							<div class="card">
								<img class="card-img-top"
									src="${toooop.urllink}" style="width:100%; height:200px"/>
								<div class="card-block">
									<h5 class="card-title topmargin10">${toooop.b_title_10}</h5>
									<p class="card-text">${toooop.b_content_15}</p>
									<c:if test="${toooop.rank != 999}">
									<p>
										<a class="btn btn-primary clickview" href="${toooop.b_no}">자세히 보기</a>
									</p>
									</c:if>
									<c:if test="${toooop.rank == 999}">
									<p>
										<a class="btn btn-primary" href="#">자세히 보기</a>
									</p>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
			
						
					</div>
				</div>
			</div>

			<div class="row margintb20">
				<div class="col-md-6"><button class="btn btn-primary paddinglr btncenter btnclick" id="Review">후기 게시판</button></div>
				<div class="col-md-6"><button class="btn btn-primary paddinglr btncenter" id="QNA">질문 게시판</button></div>
			</div>
			<table class="table">
				<thead>
					<tr class="textcenter colorthema">
						<th class="width10">번호</th>
						<th class="width10">분류</th>
						<th class="width20">상품명</th>
						<th class="width30">제목</th>
						<th class="width10">글쓴이</th>
						<th class="width10">작성일</th>
						<th class="width10">조회수</th>
					</tr>
				</thead>
				<tbody class="textcenter listzone">
				
<%-- 					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="systest"><fmt:formatDate pattern="yyyy-MM-dd" value="${now}"/></c:set>
					
								
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.b_no}</td>
							<td>${vo.b_sort}</td>
							<td>${vo.p_name}</td>
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
					</c:forEach> --%>

				</tbody>
			</table>
			<div class="row">
				<div class="col-md-12 mb-3">
				
                <form action="" id="searchForm" class="">
					<select name="sort" id="" class="form-control width10 inlinetest boldergreen">
						<option value="">----</option>
						<option value="제목"<c:out value="${pageVO.cri.sort=='제목'?'selected':''}"/>>제목</option>
						<option value="내용"<c:out value="${pageVO.cri.sort=='내용'?'selected':''}"/>>내용</option>
						<option value="작성자"<c:out value="${pageVO.cri.sort=='작성자'?'selected':''}"/>>작성자</option>
						<option value="상품명"<c:out value="${pageVO.cri.sort=='상품명'?'selected':''}"/>>상품명</option>
					</select>
					<input type="text" name="keyword" class="width40 boldergreen padding5px blacktext keyword" value="${pageVO.cri.keyword}"/>
					<input type="hidden" name="page" value="${pageVO.cri.page}"/>
					<button class="btn btn-primary searchbutton" type="submit">검색</button>
               </form>
               		<sec:authorize access="isAuthenticated()">
					<button class="btn btn-primary float-end" onclick="location.href='write'">글 쓰기</button>
					
						<sec:authentication property="principal" var="user"/>
						<input type="hidden" id="userid" value="${user.username}"/>
					
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<input type="hidden" id="isAdmin" value="true"/>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<input type="hidden" id="isAdmin" value="false"/>
					</sec:authorize>
				</div>
			</div>
			
			<!-- 페이지 선택 버튼 -->
			<div class="row">
				<div class="col-md-12">
					<ul class="mypagination justify-content-center">
					
<%-- 					<c:if test="${CampusPageVO.prev}">
						<li class="mypage-item prev"><a href="${CampusPageVO.startPage-1}" class="mypage-link"> << </a></li>
					</c:if>	
					
					<c:forEach var="i" begin="${CampusPageVO.startPage}" end="${CampusPageVO.endPage}">
						<li class="mypage-item"><a href="${i}" class="mypage-link ${CampusPageVO.cri.page==i?'activecolor':''}">${i}</a></li>
					</c:forEach>
					
					<c:if test="${CampusPageVO.next}">
						<li class="mypage-item next"><a href="${CampusPageVO.endPage+1}" class="mypage-link"> >> </a></li>
					</c:if>	
					 --%>
					 
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>
	
	<form action="list" method="get" id="actionForm">	
		<input type="hidden" name="sort" value="${CampusPageVO.cri.sort}" />
		<input type="hidden" name="keyword" value="${CampusPageVO.cri.keyword}" />
		<input type="hidden" name="page" value="${CampusPageVO.cri.page}" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>            
	
	
</div>
<script>
	var result='${result}';
	
	var isAdmin = $("#isAdmin").val();
	var userid = $("#userid").val();
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/main/js/campuslist_ajax.js"></script>
<script src="/resources/main/js/campuslist.js"></script>
<%@include file="../../design/footer.jsp"%>
© 2021 GitHub, Inc.