<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

<!-- <button class="btn btn-primary boot_click" type="button">클릭</button>
 -->
<%-- 	<c:set var="i" value="0" />
	<c:forEach var="vo" items="${list}">
	
		<c:set var="item_name_${i}" value="${vo.p_name}"/>
		<c:set var="item_count_${i}" value="${vo.c_count}"/>
		<c:set var="item_number_${i}" value="${vo.p_number}"/>
		<c:set var="item_price_${i}" value="${vo.price}"/>
		<c:set var="item_option_${i}" value="${vo.c_count}"/>
		
		<c:set var="i" value="${i+1}"/>

	</c:forEach> --%>
	
<form action="/payment/success" id="success_form" method="post">

	<c:set var="i" value="0" />
	<c:forEach var="vo" items="${list}">
	
		<input type="hidden" id="product_code" name="cartVO[${i}].p_number" value="${vo.p_number}"/>
		<input type="hidden" id="product_name" name="cartVO[${i}].p_name" value="${vo.p_name}"/>
		<input type="hidden" id="product_money" name="cartVO[${i}].money" value="${vo.money}"/>
		<input type="hidden" id="product_price" name="cartVO[${i}].p_price" value="${vo.p_price}"/>
		<input type="hidden" id="product_count" name="cartVO[${i}].c_count" value="${vo.c_count}"/>
		
		<input type="hidden" id="product_option_name" name="cartVO[${i}].po_option_vo" value="test"/>
	
		<c:set var="i" value="${i+1}"/>
	
	</c:forEach>
	
	<input type="hidden" name="u_userid" value="${u_userid}"/>
	<input type="hidden" name="o_name" value="${total_name}"/>
	<input type="hidden" name="o_address1" value="${order.o_address1}"/>
	<input type="hidden" name="o_address2" value="${order.o_address2}"/>
	<input type="hidden" name="o_address3" value="${order.o_address3}"/>
	<input type="hidden" name="o_address4" value="${order.o_address4}"/>
	<input type="hidden" name="o_phone" value="${order.o_phone}"/>
	<input type="hidden" name="o_ordercode" value="${success_code}"/>
	
	<input type="hidden" name="total_count" value="${total_count}"/>
	<input type="hidden" name="total_pay" value="${total_pay}"/>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

</form>

<form action="/payment/paymentpage" id="fail_form" method="get">

	<input type="hidden" name="u_userid" value="${u_userid}"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

</form>


	
<!-- 결제만 해주는 페이지 -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
    <script>
$(function(){
	$(document).ready(function() {
	    BootPay.request({
	    	price: ${total_pay}, //실제 결제되는 가격 [ 총 가격 ]
	    	application_id: "60fb7e1f238684001d0e5285",
	    	name: '${total_name}', //결제창에서 보여질 이름
	    	pg: 'kakao',
	    	method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
	    	show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
	    	user_info: {
	    		username: '${order.o_name}',
	    		addr: '${address}',
	    		phone: '${order.o_phone}'
	    	},
	    	order_id: '${success_code}', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
	    	params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
	    	
	    }).error(function (data) {
	    	//결제 진행시 에러가 발생하면 수행됩니다.
	    	console.log(data);
	    	
	    	alert("결제 도중 오류가 발생하였습니다. error : "+data);
	    	
	    	var fail_form = $("#fail_form")
	    	
	    	fail_form.submit();
	    	
	    }).cancel(function (data) {
	    	//결제가 취소되면 수행됩니다.
	    	console.log(data);
	    	
	    	alert("결제가 취소되었습니다. error : "+data);
	    	
	    	var fail_form = $("#fail_form")
	    	
	    	fail_form.submit();
	    	
	    }).ready(function (data) {
	    	// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
	    	console.log(data);
	    }).confirm(function (data) {
	    	//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
	    	//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
	    	console.log(data);
	    	var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
	    	if (enable) {
	    		BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
	    	} else {
	    		BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
	    	}
	    	
	    }).close(function (data) {
	        // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	        console.log(data);
	        
	    }).done(function (data) {
	    	//결제가 정상적으로 완료되면 수행됩니다
	    	//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
	    	console.log(data);
	    	
	    	alert("결제에 성공하셨습니다.");
	    	var success_form = $("#success_form")
	    	
	    	success_form.submit();
	    });
	})
})

    </script>
 
</body>
</html>
