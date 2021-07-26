<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../design/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/main/css/cart2.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/main/css/campusBoard.css">
</head>
<body>
	<div class="cart_page">
		<h2 class="cart">장바구니</h2>
	</div>
	<div id="cartItemList" class="cartlist" style="min-height: 561px;">
		<div class="">
			<div class="c_item ">
				<div class="c_select">
					<div class="innerselect">
						<label class="check"> <input type="checkbox" id="checkall"
							checked="">전체선택
						</label> 
						<a href="" class="btn_delete" id="deleteall">전체삭제</a>
						<button type="submit" class="btn_delete" id="delete">선택삭제</button>
						<script>
						$("#delete").click(function () {
							var confirm_val = confirm("정말 삭제하시겠습니까?");

							if (confirm_val) {
								var checkArr = new Array();
								
								console.log($("input[class='checkone']:checked"));

								$("input[class='checkone']:checked").each(function (idx,item) {
									//item.data("cartnum");
									
									var cartNum=$(this).data("cartnum");
									checkArr.push(cartNum);
								});
								
								console.log(checkArr);
								
								$.ajax({
									url: "/delete",
									type: "post",
									data: {
										cartNum:checkArr,
									},
									beforeSend: function (xhr) {   
										xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
									},
									success: function (data) {
										console.log(data);
										alert("장바구니 삭제 성공");
										//.href = "/cart?u_userid="+u_userid;
										//location.href ="/";
										location.reload();
									},
									error: function(){
										alert("장바구니 삭제 실패");
									}
								});
							}
						});
					</script>
					</div>
				</div>
				<div class="box">
					<ul class="list">
						<c:forEach items="${cartlist}" var="CartListVO">
							<li>
								<div class="item">
									<label class="check" for=""> 
									<input type="checkbox" class="checkone"  data-cartnum="${CartListVO.c_cartnumber}"> 
									</label>
									<div class="c_name">
										<div class="innername">
											<a href="#" class="package ">${CartListVO.p_name}</a>
											<div class="info">닳지 않는 손전등</div>
										</div>
									</div>
									<div class="goods">
										<a href="#" class="c_img ">상품이미지</a>
										<div class="price">
											<div class="in_price">
												<span class="selling">
												 <fmt:formatNumber value="${CartListVO.p_price * CartListVO.c_count}" pattern="###,###,###"></fmt:formatNumber>
												</span>
												<span class="unit">원</span>
											</div>
											<div class="stamper count">
												<button type="button" class="btn minus off">감소</button>
												<input type="number" id="stepperCounter" class="num"
													readonly="" value="${CartListVO.c_count}">
												<button type="button" class="btn plus">추가</button>
											</div>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
<!-- 				<div class="c_select"> -->
<!-- 					<div class="inner_select"> -->
					
<!-- 					</div> -->
<!-- 				</div> -->
			<div class="cart_result">
				<div class="innerresult" style="top: 60px;">
					<div class="amount_view">
						<dl class="amount">
							<dt class="tit">결제예정금액</dt>
							<dd class="price">
								<span class="num">
									<fmt:formatNumber value="" pattern="###,###,###"></fmt:formatNumber>
									</span>
									<span class="unit">원</span>
							</dd>
						</dl>
					</div>
					<div class="btn_submit">
						
						<input type="hidden" name="userid" id="userid" value="<sec:authentication property="principal.campusUser.u_userid"/>">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						
						<button type="submit" class="btn btn-primary">구매하기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/product/productlist'">상품 목록보기</button>

					</div>
					<div class="notice">구매하는 물품이 맞는 지 꼭 확인해 주세요!</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script src="/resources/main/js/cart.js"></script>
	<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
</body>
</html>
<%-- <%@include file="../design/footer.jsp"%> --%>