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
				<h3 class="colorthema margintb20 padding6px">상품 수정</h3>
			</div>
			<form action="" method="post" id="operForm">
			
				<div class="col-md-10"> <input type="text"
						class="form-control inlinetest "
						id="campusboard-product-name" readonly value="${campusProductVO.p_name}"/>
				</div>
				
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="p_stock"
						id="campusboard-product-stock" placeholder="재고 입력"  value="${campusProductVO.p_stock}"/>
				</div>
				
				<hr class="one" />
				<div class="col-md-10"><input type="text"
						class="form-control width70 inlinetest " name="p_price"
						id="campusboard-product-price" placeholder="상품 가격 입력 (숫자로만)"  value="${campusProductVO.p_price}"/>
				</div>
				<hr class="one" />
				
				<input type="hidden" name="p_number" value="${campusProductVO.p_number}"/>
				<!-- <input type="hidden" name="b_no" value="${campusBoardVO.b_no}"/> -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button class="btn btn-primary" type="submit" data-oper="modify">수정</button>
				<button class="btn btn-primary" type="submit" data-oper="remove">삭제</button>
				
				<div class="col-md-8 mll20"></div>
				
				<ul class="hidden">
				
				</ul>
				
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>

</section>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/main/js/campus_sellmodify.js"></script>

<%@include file="../../design/footer.jsp"%>
