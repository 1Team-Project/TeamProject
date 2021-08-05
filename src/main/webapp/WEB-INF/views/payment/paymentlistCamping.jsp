<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>
<div class="container-fluid">
	<div class="row topmargin30">
		<div class="row">
			<div class="col-md-1"></div>
			
			
			
			<div class="col-md-10">

				<hr class="one" />
				<div class="col-md-12"><h3 class="heading-section" style="font-family: naBrush;">결제 현황 페이지</h3></div>
				<hr class="one" />
				
				<div class="col-md-12 colorthema hh4 padding6px margintb20">결제 정보</div>
				
				
				<table class="table product">
					<thead>
						<tr class="textcenter colorthema">
							<th class="width20">예약 정보</th>
							<th class="width20">이름</th>
							<th class="width10">자리</th>
							<th class="width20">예약일</th>
							<th class="width20">결제 금액</th>
							<th class="width10">결제 취소</th>
						</tr>
					</thead>
					<tbody class="textcenter">
					<c:set var ="i" value="0"/>
					<c:forEach var="vo" items="${list}">
					<!-- 상품 리스트 반복되는 부분 -->
						<tr>
							<td>
								<img src="/resources/main/images/camp.jpg" alt="" class="size200"/>
							</td>
							<td class="textmiddle"><b>${vo.c_name}</b>
							</td>
							<td class="textmiddle">${vo.c_area}번</td>
							<td class="textmiddle">${vo.c_rsysdate}</td>
							<td class="textmiddle ${vo.c_content}">총 ${vo.c_pay}원</td>
							<td class="textmiddle"><a class="btn btn-primary cancel_btn" href="${vo.c_content}">취소</a></td>
	
						</tr>
					</c:forEach>

					</tbody>
				</table>

				<div class="col-md-12 textright margintb20"><h3>총 결제된 금액 : ${total_pay}원</h3></div>

				<button class="btn btn-primary float-end"  onclick="location.href='/'">메인으로 돌아가기</button>
				
				<!-- 유저정보 : 아이디, 주소, 전화번호, 이메일 -->
				
				<sec:authentication property="principal" var="user"/>
				
				<form action="/payment/paycancel2" id ="cancel_form" method="post">
					<input type="hidden" id="id" name="u_userid" value="${user.username}"/>				
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
				
				<input type="hidden" id="total_pay" name="total_pay" value="${vo.c_pay}"/>
				
				<!-- <button type = "submit" class="btn btn-primary">submit</button> -->
				

			</div>
			<div class="col-md-1"></div>

		</div>
	</div>
	
</div>
</body>
<script src="/resources/main/js/paymentlist2.js"></script>
<script>
	var userid = ${user.username};
</script>
<!-- <script src="/resources/main/js/campuslist.js"></script> -->

<%@include file="../../design/footer.jsp"%>