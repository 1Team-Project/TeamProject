<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">

<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section" style="font-family: naBrush;">통합
					게시판</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">글 수정</h3>
			</div>
			<form action="">
				<div class="col-md-8 mll20">
					<select name="form-select" id=""
						class="form-control width15 inlinetest boldergreen">
						<option value="">분류</option>
						<option value="후기">후기</option>
						<option value="질문">질문</option>
					</select> <label for="campusboard-title " class="label"><h5>
							제 목</h5></label> <input type="text"
						class="form-control width70 inlinetest boldergreen"
						id="campusboard-title" />
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
					<h5>내용</h5>
					<textarea class="form-control boldergreen" cols="30" rows="15"
						style="resize: none"></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<div class="blacktext">파일 첨부</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="uploadFile" multiple
								class="form-control boldergreen" />
						</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<button class="btn btn-primary">글 수정</button>
					<button class="btn btn-green1" type="reset">삭제</button>
					<button class="btn btn-green2" type="reset">리스트</button>
				</div>
		</div>
		</form>
	</div>
	<div class="col-md-1 margintb20"></div>
	</div>
</section>



<%@include file="../../design/footer.jsp"%>