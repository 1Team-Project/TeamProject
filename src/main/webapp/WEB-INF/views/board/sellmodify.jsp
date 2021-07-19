<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>
<link rel="stylesheet" href="/resources/main/css/campusBoard.css">

<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section" style="font-family: naBrush;">상품 수정</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">상품 정보 수정</h3>
			</div>
			<form action="">
				<div class="col-md-10"><input type="text"
						class="form-control inlinetest "
						id="campusboard-title" placeholder="제목 입력"/>
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control inlinetest "
						id="campusboard-title" placeholder="상품 이름 입력" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest "
						id="campusboard-title" placeholder="상품 번호 입력" />
				</div>
				<hr class="one" />
				<div class="col-md-8">
				<ul class="nav">
				<li>
					<img src="" class="mainImage" alt="" width="312px" height="312px"/>
				</li>
				<li class="margintb20">
					<img src="" class="subImage1" alt="" width="100px" height="100px"/>
					<img src="" class="subImage2" alt="" width="100px" height="100px"/>
					<img src="" class="subImage3" alt="" width="100px" height="100px"/>
				</li>
				</ul>
					<div class="blacktext">상품 이미지 등록 (맨 처음 사진이 메인사진)</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="uploadFile" multiple
								class="form-control " />
						</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-10"><input type="text"
						class="form-control width70 inlinetest "
						id="campusboard-title" placeholder="상품 가격 입력 (숫자로만)" />
				</div>
				<hr class="one" />
				<div class="col-md-10">
					<label for="campusboard-title " class="label"><h5>옵션
							이름</h5></label> <input type="text"
						class="form-control width70 inlinetest "
						id="campusboard-title" placeholder=" 없을 시 공란" />
					<hr class="one" />


					<div class="col-md-10 mll20 optionadd">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest "
							id="campusboard-option-1" placeholder=" 없을 시 공란" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest "
							id="campusboard-option-2" placeholder=" 없을 시 공란" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest "
							id="campusboard-option-3" placeholder=" 없을 시 공란" />
					</div>


				</div>
				<hr class="one" />
				<div class="col-md-12">
					<h5>설명 내용</h5>
					<textarea class="form-control " cols="50" rows="50"
						style="resize: none" placeholder="설명 내용을 추가해 주세요" ></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8">
					<div class="blacktext">설명에 추가할 파일 (jpg/png)</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="uploadFile" multiple
								class="form-control " />
						</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8">
					<button class="btn btn-primary">글 작성</button>
					<button class="btn btn-green1" type="reset">초기화</button>
					<button class="btn btn-green2" type="reset">리스트</button>
				</div>
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>
</section>

<%@include file="../../design/footer.jsp"%>
