<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../design/header.jsp"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="/resources/main/css/cart2.css" rel="stylesheet">
</head>
<body>
	<div class="cart_page">
		<h2 class="cart">��ٱ���</h2>
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
								��ü����(1/1)
								</label>
								<a href="#none" class="btn_delete">���û���</a>
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
											<a href="#" class="package ">���� ������</a>
											<div class="info">���� �ʴ� ������</div>
										</div>
									</div>
									<div class="goods">
										<a href="#" class="c_img ">��ǰ�̹���</a>
										<div class="price">
											<div class="in_price">
												<span class="selling">15,000<span class="unit">��</span></span>
												<p class="noti"></p>
											</div>
											<div class="stamper count">
												<button type="button" class="btn minus off">����</button>
												<input type="number" id="stepperCounter" class="num" readonly="" value="1">
												<button type="button" class="btn plus">�߰�</button>
											</div>
										</div>
									</div>
									<button type="button" class="btn_delete" data-type="cold">��ǰ ����</button>
								</div></li>
						</ul>
					</div>
					<div class="c_select">
						<div class="inner_select">
							<label class="check">
							<input type="checkbox" name="checkAll" checked="">
							<span class="ico"></span>��ü���� (1/1)</label>
							<a href="#none" class="btn_delete">���û���</a>
						</div>
					</div>
				</div>
				<div class="cart_result">
					<div class="innerresult" style="top: 60px;">
						<div class="cart_delivery">
							<h3 class="addr">�����</h3>
							<div class="address">
								<span class="put_addr">�������</span><br>�Է����ּ���!<a href="#" class="btn default">
								<span class="icon"></span>
									�ּ� �˻�</a>
							</div>
						</div>
						<div class="amount_view">
							<dl class="amount">
								<dt class="tit">���������ݾ�</dt>
								<dd class="price">
									<span class="num">15,000</span><span class="unit">��</span>
								</dd>
							</dl>
						</div>
						<div class="btn_submit">
							<button type="submit" class="btn btn-primary">�����ϱ�</button>
						</div>
						<div class="notice">
						�����ϴ� ��ǰ�� �´� �� �� Ȯ���� �ּ���!
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