<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>

<!DOCTYPE html>
<html>
<head>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.min.js"></script>
	<link rel="stylesheet" href="sweetalert2.min.css">
	
<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>


	
<form action="/payment/success2" id="success_form" method="post">


	<input type="hidden" name="u_userid" value="${campVO.u_userid}"/>
	<input type="hidden" name="c_name" value="${campVO.c_name}"/>
	<input type="hidden" name="c_nname" value="${campVO.c_nname}"/>
	<input type="hidden" name="c_rsysdate" value="${campVO.c_rsysdate}"/>
	<input type="hidden" name="c_pay" value="${campVO.c_pay}"/>
	<input type="hidden" name="c_area" value="${campVO.c_area}"/>
	
	<input type="hidden" name="c_phone" value="${campVO.c_phone}"/>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

</form>

<form action="/camp/campdetail" id="fail_form" method="get">

	<input type="hidden" name="u_userid" value="${u_userid}"/>
	<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->

</form>


	
<!-- 결제만 해주는 페이지 -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
<script>
$(function(){
	$(document).ready(function() {
	    BootPay.request({
	    	price: ${campVO.c_pay}, //실제 결제되는 가격 [ 총 가격 ]
	    	application_id: "60fb7e1f238684001d0e5285",
	    	name: '${campVO.c_name}', //결제창에서 보여질 이름
	    	pg: 'kakao',
	    	method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
	    	show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
	    	user_info: {
	    		username: '${campVO.c_nname}',
	    		phone: '${campVO.c_phone}'
	    	},
	    	order_id: '${success_code}', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
	    	params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
	    	
	    }).error(function (data) {
	    	//결제 진행시 에러가 발생하면 수행됩니다.
	    	console.log(data);
	    	
			Swal.fire({
				  title: '<strong>결제가 취소되었습니다.</strong>',
				  icon: 'error',
				  allowOutsideClick: false,
				  html:
				    'error : '+data,

				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				}).then((result) => {
					  if (result.isConfirmed) {
					    	var fail_form = $("#fail_form")
					    	
					    	fail_form.submit();
						  }
				})

	    }).cancel(function (data) {
	    	//결제가 취소되면 수행됩니다.
	    	console.log(data);
	    	
			Swal.fire({
				  title: '<strong>결제가 취소되었습니다.</strong>',
				  icon: 'error',
				  allowOutsideClick: false,
				  html:
				    'error : '+data,

				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				}).then((result) => {
					  if (result.isConfirmed) {
					    	var fail_form = $("#fail_form")
					    	
					    	fail_form.submit();
						  }
				})

	    }).ready(function (data) {
	    	// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
	    	console.log(data);
	    }).confirm(function (data) {
	    	//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
	    	//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
	    	console.log(data);
	    	BootPay.transactionConfirm(data);
/* 	    	
	    	var checkForm = $("#success_form").serialize();
	    	console.log("체크폼"+checkForm);
	    	
	 	   	var csrfHeaderName = "${_csrf.headerName}";
	 		var csrfTokenValue = "${_csrf.token}";
	 	    	
 	    	$.ajax({
				url:'/payment/check_data', //도착지
				type:'post',

				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',

				data:checkForm,
				
				success:function(result){
					
					console.log(result);
					
					if (result == 'success'){
						console.log("유효성 검사 통과");						
						BootPay.transactionConfirm(data);
					}else{
						console.log("유효성 검사 실패")
						BootPay.removePaymentWindow();
						
						Swal.fire({
							  title: '<strong>결제가 취소되었습니다.</strong>',
							  icon: 'error',
							  allowOutsideClick: false,
							  html:
							    'error : 재고 부족',

							  focusConfirm: false,
							  confirmButtonColor: '#78c2ad',
							  confirmButtonText:
							    '확인'
							}).then((result) => {
								  if (result.isConfirmed) {
								    	var fail_form = $("#fail_form")
								    	
								    	fail_form.submit();
									  }
							})
					}
					
				}
 
			}); */
			
/* 	    	var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
	    	if (enable) {
	    		BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
	    	} else {
	    		BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
	    	} */
	    }).close(function (data) {
	        // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	        console.log(data);
	        
	    }).done(function (data) {
	    	//결제가 정상적으로 완료되면 수행됩니다
	    	//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
	    	console.log(data);
	    	
			Swal.fire({
				  title: '<strong>결제가 완료되었습니다.</strong>',
				  icon: 'success',
				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				}).then((result) => {
					  if (result.isConfirmed) {
					    	var success_form = $("#success_form")
					    	var da = data.receipt_id;
					    	var str = "<input type='hidden' name='c_content' value='"+da+"'>"
					    	success_form.append(str);
					    	success_form.submit();
						  }
				})
				

	    });
	})
})
    </script>
 
</body>
</html>