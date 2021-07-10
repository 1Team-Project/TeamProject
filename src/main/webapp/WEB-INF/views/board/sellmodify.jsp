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
				<h3 class="heading-section" style="font-family: naBrush;">상품 등록</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">새 상품 등록</h3>
			</div>
			<form action="">
				<div class="col-md-10 mll20">
					<label for="campusboard-title " class="label"><h5>
							제 목</h5></label> <input type="text"
						class="form-control width70 inlinetest boldergreen"
						id="campusboard-title" />
				</div>
				<hr class="one" />
				<div class="col-md-10 mll20">
					<label for="campusboard-title " class="label"><h5>상품
							이름</h5></label> <input type="text"
						class="form-control width70 inlinetest boldergreen"
						id="campusboard-title" />
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<div class="blacktext">상품 이미지 등록</div>
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
				<div class="col-md-10 mll20">
					<label for="campusboard-title " class="label"><h5>가
							격</h5></label> <input type="text"
						class="form-control width70 inlinetest boldergreen"
						id="campusboard-title" />
				</div>
				<hr class="one" />
				<div class="col-md-10 mll20">
					<label for="campusboard-title " class="label"><h5>옵션
							이름</h5></label> <input type="text"
						class="form-control width70 inlinetest boldergreen"
						id="campusboard-title" placeholder=" 없을 시 공란" />
					<hr class="one" />


					<div class="col-md-10 mll20 optionadd">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest boldergreen"
							id="campusboard-option-1" placeholder=" 없을 시 공란" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest boldergreen"
							id="campusboard-option-2" placeholder=" 없을 시 공란" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest boldergreen"
							id="campusboard-option-3" placeholder=" 없을 시 공란" />
					</div>


				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<h5>설명 내용</h5>
					<textarea class="form-control boldergreen" cols="30" rows="15"
						style="resize: none"></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<div class="blacktext">설명에 추가할 파일 등록</div>
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
