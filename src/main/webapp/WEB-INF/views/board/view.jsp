<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<link rel="stylesheet" href="/resources/main/css/campusBoard.css">
<style>
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/resources/main/images/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .yellow + label {
    background-color: #ffc937;
}
</style>
<section>
<sec:authentication property="principal" var="user"/>
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
				
				<c:if test="${campusVO.b_sort eq '후기'}">
				<div class="rating">
				<div class="warning_msg">해당 상품의 별점</div>
					<input name="b_rating1" id="rating1" value="1" class="rate_radio <c:if test="${campusVO.b_rating >= 1}">yellow</c:if>" title="1점"/><label for="rating1"></label>
					<input name="b_rating2" id="rating2" value="2" class="rate_radio <c:if test="${campusVO.b_rating >= 2}">yellow</c:if>" title="2점"/><label for="rating2"></label>
					<input name="b_rating3" id="rating3" value="3" class="rate_radio <c:if test="${campusVO.b_rating >= 3}">yellow</c:if>" title="3점"/><label for="rating3"></label>
					<input name="b_rating4" id="rating4" value="4" class="rate_radio <c:if test="${campusVO.b_rating >= 4}">yellow</c:if>" title="4점"/><label for="rating4"></label>
					<input name="b_rating5" id="rating5" value="5" class="rate_radio <c:if test="${campusVO.b_rating == 5}">yellow</c:if>" title="5점"/><label for="rating5"></label>
	            </div>
	            </c:if>
	            
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
	  			<sec:authorize access="isAuthenticated()">
	  				<c:if test="${user.username == campusVO.b_writer}">
	  				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button class="btn btn-primary modifybutton" type="button">수정하기</button>
	                </c:if>
	            </sec:authorize>
	            
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button class="btn btn-danger deletebtn" type="button">글 삭제</button>
				</sec:authorize>
					
					<button class="btn btn-green2 listbutton" type="button">목록</button>
				</div>
				</form>
				<hr class="one" />
		</div>

		<!-- 댓글 폼 -->
		<div class="col-md-1"></div>
		<div class="col-md-10 mll10">
			<form action="/board/replyadd" method="post">
				<div class="col-md-8 mll20">
					<sec:authorize access="isAuthenticated()">
						<h5>댓글 작성</h5>
						<textarea class="form-control lineview reply_content_add" cols="30" rows="3" name="r_content"
							style="resize: none"></textarea>
						<button class="btn btn-primary float-end m-1 mr-0 btn-reply-submit" type="submit">댓글 작성</button>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<h5>댓글 작성</h5>
						<textarea class="form-control lineview" cols="30" rows="3" name="r_content"
							style="resize: none" placeholder="로그인 후 작성해 주세요." readonly></textarea>
					</sec:authorize>
					
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-1"></div>
	
	<div class="col-md-1"></div>
	<div class="col-md-10 mll10">
		<hr class="one" />
		
		
		<!-- 댓글 리스트 -->
		<h5 class="mll20">댓글 목록</h5>
		<hr class="one" />

		<div class="col-md-12 replyzone">

		</div>
		
		
		<div class="row">
			<div class="col-md-12">
				<ul class="mypagination justify-content-center">

				</ul>
			</div>
		</div>


		<button class="btn btn-green2 mll20 listbutton" type="button">목록</button>

	</div>
	<div class="col-md-1"></div>

	<div class="col-md-1 margintb20"></div>
	
<form action="" id="operForm" method="get">
	<input type="hidden" name="sort" value="${cri.sort}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="b_no" value="${campusVO.b_no}"/>
</form>

	<form action="/board/removeAdmin" id="deleteForm" method="POST">
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
	let b_no = ${campusVO.b_no};
	
	var replyername = "${user.username}";
	var bno = "${campusVO.b_no}";
	var rpaget = "${campusVO.b_no}";
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(".deletebtn").click(function(){
		
		Swal.fire({
			  title: '<strong>정말 삭제 하시겠습니까?</strong>',
			  icon: 'warning',
			  focusConfirm: false,
			  html:
				    '삭제시 해당 게시글의 모든 정보가 사리지며'+
					'더이상 복구 할 수 없게 됩니다.',
			  showCancelButton: true,
			  confirmButtonColor: '#f89b00',
			  cancelButtonColor: '#78c2ad',
			  cancelButtonText: '창 닫기',
			  confirmButtonText:
			    '삭제'
			}).then((result) => {
				  if (result.isConfirmed) {

						$("#deleteForm").submit();
				  }
			})
		
	})
	
</script>
<script src="/resources/main/js/campusview.js"></script>
<script src="/resources/main/js/campusreply.js"></script>

<%@include file="../../design/footer.jsp"%>