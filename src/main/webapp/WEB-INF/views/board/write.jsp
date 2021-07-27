<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>

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
.rating .rate_radio:checked + label {
    background-color: #ffc937;
}
</style>
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
				<h3 class="colorthema margintb20 padding6px">새 글 작성</h3>
			</div>
			<form action="write" method="post" role="form">

	            <div class="rating mll20 ">

	            </div>

				<div class="col-md-8 mll20">
					<select name="b_sort" id="sort"
						class="form-control width15 inlinetest">
						<option value="">선택</option>
						<option value="후기">후기</option>
						<option value="질문">질문</option>
					</select>
					
					<input type="text"
						class="form-control width70 mll10 inlinetest"
						id="campusboard-title" required placeholder="제목을 입력해 주세요" name="b_title"/>
				</div>
				<hr class="one" />
				
				
				<div class="col-md-8 mll20">
					<input type="text" class="form-control width70 inlinetest"
					id="campusboard-pnumber" required placeholder="상품 코드를 입력해 주세요" name="p_number"/>
					<button class="btn btn-primary checkbtn" type="button">상품 체크</button>
				</div>
				<div class="col-md-8 mll20 checkpnumbermsg"></div>
				
				
				<hr class="one" />
				<div class="col-md-8 mll20">
					<textarea class="form-control" cols="30" rows="15" id="campusboard-content" 
						style="resize: none" required placeholder="내용을 입력해 주세요" name="b_content"></textarea>
				</div>
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

					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<sec:authentication property="principal" var="user"/>
					<input type="hidden" name="b_writer" value="${user.username}"/>
					
					
					<button class="btn btn-primary" type="submit">글 작성</button>
					<button class="btn btn-green1" type="reset">초기화</button>
					<button class="btn btn-green2" type="button" onClick="location.href='/board/list'">목록</button>
				</div>
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>
</section>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	let catchnum = 0;
</script>
<script src="/resources/main/js/campuswrite.js"></script>
<%@include file="../../design/footer.jsp"%>