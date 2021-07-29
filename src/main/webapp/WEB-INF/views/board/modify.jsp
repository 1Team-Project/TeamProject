<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section hoverthema" style="font-family: naBrush;" onclick="location.href='list'">통합
					게시판</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">글 수정</h3>
			</div>
			<form action="" method="post" role="form">
				<div class="col-md-8 mll20">
					<select name="b_sort" id="sort"
						class="form-control width15 inlinetest">
						<option value="">분류</option>
						<option value="후기" <c:if test="${campusVO.b_sort eq '후기'}">selected</c:if> >후기</option>
						<option value="질문" <c:if test="${campusVO.b_sort eq '질문'}">selected</c:if> >질문</option>
					</select><input type="text"
						class="form-control width70 inlinetest mll10" name="b_title"
						id="campusboard-title" placeholder="제목을 입력해 주세요" value="${campusVO.b_title}"/>
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
					<textarea class="form-control" cols="30" rows="15" id="campusboard-content" name="b_content" 
						style="resize: none" placeholder="내용을 입력해 주세요">${campusVO.b_content}</textarea>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name ="b_writer" value="${campusVO.b_writer}"/>
				<input type="hidden" name="keyword" value="${cri.keyword}" />
				<input type="hidden" name="page" value="${cri.page}" />
				<input type="hidden" name="sort" value="${cri.sort}" />
				<input type="hidden" name ="b_no" value="${campusVO.b_no}"/>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<div class="blacktext">파일 첨부 (jpg/png, 최대 20MB, 최대 3장)</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="campusFile" multiple
								class="form-control" />
						</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
				
	  				<sec:authorize access="isAuthenticated()">
	  				<sec:authentication property="principal" var="user"/>
	  					<c:if test="${user.username == campusVO.b_writer}">
						<button class="btn btn-primary" type="button" data-oper="modify" type="submit">글 수정</button>
						<button class="btn btn-green1" type="button" data-oper="remove" type="submit">삭제</button>
	                	</c:if>
	                </sec:authorize>
					<button class="btn btn-green2" type="button" data-oper="list" type="submit">목록</button>
				</div>
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>
	
	<%-- remove와 list를 위한 폼--%>
	<form action="" id="operForm" method="POST">
		<input type="hidden" name="keyword" value="${cri.keyword}" />
		<input type="hidden" name="page" value="${cri.page}" />
		<input type="hidden" name="sort" value="${cri.sort}" />
		<input type="hidden" name ="b_no" value="${campusVO.b_no}"/>
		<input type="hidden" name ="b_writer" value="${campusVO.b_writer}"/>
		<%-- spring security csrf값 추가 --%>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	</form>
	
</section>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	let b_no = ${campusVO.b_no};
	let catchnum = 0;
</script>

<script src="/resources/main/js/campusmodify.js"></script>
<%@include file="../../design/footer.jsp"%>