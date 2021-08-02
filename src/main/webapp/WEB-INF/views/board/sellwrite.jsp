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
				<h3 class="heading-section" style="font-family: naBrush;">상품 등록</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">새 상품 등록</h3>
			</div>
			<form action="" method="post">
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control inlinetest " name="p_name"
						id="campusboard-product-name" placeholder="상품 이름 입력" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="p_numbers"
						id="campusboard-product-code" placeholder="상품 번호 입력" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="pc_code"
						id="campusboard-product-pccode" placeholder="카테고리 번호 입력" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="p_stock"
						id="campusboard-product-stock" placeholder="재고 입력" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="p_manufact"
						id="campusboard-product-stock" placeholder="제조사 입력" />
				</div>
				<hr class="one" />
				<div class="col-md-8">

					<div class="blacktext">상품 이미지 등록</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="campusFile" multiple
								class="form-control " />
						</div>
						<div class="uploadResult resultpage1">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-10"><input type="text"
						class="form-control width70 inlinetest " name="p_price"
						id="campusboard-product-price" placeholder="상품 가격 입력 (숫자로만)" />
				</div>
				<hr class="one" />
				<div class="col-md-10">
					<label for="campusboard-title " class="label"><h5>옵션
							이름</h5></label> <input type="text"
						class="form-control width70 inlinetest " name="po_optiontitle"
						id="campusboard-product-optiontitle" placeholder=" 없을 시 공란" />
					<hr class="one" />


					<div class="col-md-10 mll20 optionadd">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest " name="po_option1"
							id="campusboard-product-option-1" placeholder=" 없을 시 공란" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest " name="po_option2"
							id="campusboard-product-ption-2" placeholder=" 없을 시 공란" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>옵션
							</h5></label> <input type="text"
							class="form-control width70 inlinetest " name="po_option3"
							id="campusboard-product-option-3" placeholder=" 없을 시 공란" />
					</div>


				</div>
				<hr class="one" />
				<div class="col-md-12">
					<h5>설명 내용</h5>
					<textarea class="form-control " cols="50" rows="50" id ="campusboard-product-content" name="b_content"
						style="resize: none" placeholder="설명 내용을 추가해 주세요" ></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8">
					<div class="blacktext">설명에 추가할 파일 등록 (jpg/png)</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="uploadFile" multiple
								class="form-control " />
						</div>
						<div class="uploadResult resultpage2">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20"></div>
				<sec:authentication property="principal" var="user"/>
				<input type="hidden" name="b_writer" value="${user.username}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button class="btn btn-primary" type="submit">등록</button>
				
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>

</section>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/main/js/campus_sellwrite.js"></script>


<%@include file="../../design/footer.jsp"%>