<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../design/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/main/css/cart2.css" rel="stylesheet">
</head>
<body>
	<div class="cart_page">
		<h2 class="cart">장바구니</h2>
	</div>
	<form>
		<div id="cartItemList" class="cartlist" style="min-height: 561px;">
			<div class="">
				<div class="c_item ">
					<div class="c_select">
						<div class="innerselect">
							<label class="check">
							<input type="checkbox" name="checkAll" checked="">
								<span class="icon"></span>
								전체선택(1/1)
								</label>
								<a href="#none" class="btn_delete">선택삭제</a>
						</div>
					</div>
					<div class="box">
						<ul class="list">
							<li>
							   <div class="item">
									<label class="check" for="">
										<input type="checkbox" id="" name="" checked="">
										<span class="icon"></span>
										</label>
									<div class="c_name">
										<div class="innername">
											<a href="#" class="package ">강력 손전등</a>
											<div class="info">닳지 않는 손전등</div>
										</div>
									</div>
									<div class="goods">
										<a href="#" class="c_img ">상품이미지</a>
										<div class="price">
											<div class="in_price">
												<span class="selling">15,000<span class="unit">원</span></span>
												<p class="noti"></p>
											</div>
											<div class="stamper count">
												<button type="button" class="btn minus off">감소</button>
												<input type="number" id="stepperCounter" class="num" readonly="" value="1">
												<button type="button" class="btn plus">추가</button>
											</div>
										</div>
									</div>
									<button type="button" class="btn_delete" data-type="cold">상품 삭제</button>
								</div></li>
						</ul>
					</div>
					<div class="c_select">
						<div class="inner_select">
							<label class="check">
							<input type="checkbox" name="checkAll" checked="">
							<span class="ico"></span>전체선택 (1/1)</label>
							<a href="#none" class="btn_delete">선택삭제</a>
						</div>
					</div>
				</div>
				<div class="cart_result">
					<div class="innerresult" style="top: 60px;">
						<div class="cart_delivery">
							<h3 class="addr">배송지</h3>
							<div class="address">
								<span class="put_addr">배송지를</span><br>입력해주세요!<a href="#" class="btn default">
								<span class="icon"></span>
									주소 검색</a>
							</div>
						</div>
						<div class="amount_view">
							<dl class="amount">
								<dt class="tit">결제예정금액</dt>
								<dd class="price">
									<span class="num">15,000</span><span class="unit">원</span>
								</dd>
							</dl>
						</div>
						<div class="btn_submit">
							<button type="submit" class="btn btn-primary">구매하기</button>
						</div>
						<div class="notice">
						구매하는 물품이 맞는 지 꼭 확인해 주세요!
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="/resources/main/js/cart.js"></script>
</body>
</html>
<%@include file="../design/footer.jsp"%>