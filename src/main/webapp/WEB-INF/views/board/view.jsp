<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<link rel="stylesheet" href="/resources/main/css/campusBoard.css">


<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section" style="font-family: naBrush">통합 게시판
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
					<textarea class="form-control readonlycolor" cols="30" rows="15"
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
					<button class="btn btn-primary">수정하기</button>
					<button class="btn btn-green2 listbutton" type="button">리스트</button>
				</div>
				</form>
				<hr class="one" />
		</div>

		<!-- 댓글 폼 -->
		<div class="col-md-1"></div>
		<div class="col-md-10 mll10">
			<form action="">
				<div class="col-md-8 mll20">
					<h5>댓글 작성</h5>
					<textarea class="form-control" cols="30" rows="3"
						style="resize: none"></textarea>
					<button class="btn btn-primary float-end m-1 mr-0">댓글 작성</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-1"></div>
	</div>
	<div class="col-md-1"></div>
	<div class="col-md-10 mll10">
		<hr class="one" />
		<!-- 댓글 리스트 -->

		<div class="col-md-8 mll20 margintb20">
			<h6 class="float-start">작성자</h6>
			<a href="" class="float-end blacktext hoverthema">[수정]</a> <a href=""
				class="float-end blacktext hoverthema">[삭제]</a>
			<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">2020/07/08</h7>
			<textarea class="form-control" cols="30" rows="3"
				style="resize: none" readonly></textarea>
		</div>

		<div class="col-md-8 mll20 margintb20">
			<h6 class="float-start">작성자</h6>
			<a href="" class="float-end blacktext hoverthema">[수정]</a> <a href=""
				class="float-end blacktext hoverthema">[삭제]</a>
			<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">2020/07/08</h7>
			<textarea class="form-control" cols="30" rows="3"
				style="resize: none" readonly></textarea>
		</div>

		<div class="col-md-8 mll20 margintb20">
			<h6 class="float-start">작성자</h6>
			<a href="" class="float-end blacktext hoverthema">[수정]</a> <a href=""
				class="float-end blacktext hoverthema">[삭제]</a>
			<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">2020/07/08</h7>
			<textarea class="form-control" cols="30" rows="3"
				style="resize: none" readonly></textarea>
		</div>

		<div class="row">
			<div class="col-md-12">
				<ul class="mypagination justify-content-center">
					<li class="mypage-item"><a href="#" class="mypage-link">
							<< </a></li>
					<li class="mypage-item"><a href="#"
						class="mypage-link activecolor">1</a></li>
					<li class="mypage-item"><a href="#" class="mypage-link">2</a>
					</li>
					<li class="mypage-item"><a href="#" class="mypage-link">3</a>
					</li>
					<li class="mypage-item"><a href="#" class="mypage-link">
							>> </a></li>
				</ul>
			</div>
		</div>


		<button class="btn btn-green2 mll20 listbutton" type="button">리스트</button>

	</div>
	<div class="col-md-1"></div>
	</div>
	<div class="col-md-1 margintb20"></div>
	</div>
	
<form action="" id="operForm" method="get">
	<input type="hidden" name="type" value="${cri.sort}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="b_no" value="${vo.b_no}"/>
</form>        
	
</section>

<script src="/resources/main/js/campusview.js"></script>

<%@include file="../../design/footer.jsp"%>