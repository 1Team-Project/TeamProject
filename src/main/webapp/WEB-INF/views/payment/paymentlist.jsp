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
			
				<form action="/" method="post">
			
				<hr class="one" />
				<div class="col-md-12"><h3 class="heading-section" style="font-family: naBrush;">결제 현황 페이지</h3></div>
				<hr class="one" />
				
				<div class="col-md-12 colorthema hh4 padding6px margintb20">결제 정보</div>
				
				
				<table class="table product">
					<thead>
						<tr class="textcenter colorthema">
							<th class="width20">결제 완료 상품 0개</th>
							<th class="width30">상품 설명</th>
							<th class="width10">총 수량</th>
							<th class="width20">결제 금액</th>
							<th class="width20">결제 취소</th>
						</tr>
					</thead>
					<tbody class="textcenter">
					<c:set var ="i" value="0"/>
					<c:forEach var="vo" items="${list}">
					<!-- 상품 리스트 반복되는 부분 -->
						<tr>
							<td>
								<img src="${vo.cartimg}" alt="" class="size200"/>
							</td>
							<td class="textmiddle"><b>${vo.p_name}</b>
								<div>${option}</div>
							</td>
							<td class="textmiddle">총 ${total_count}개</td>
							<td class="textmiddle">총 ${total_pay}원</td>
							<td class="textmiddle"><button class="btn btn-primary cancel_btn">취소</button></td>
							
						</tr>

					</c:forEach>

					</tbody>
				</table>

				<div class="col-md-12 textright margintb20"><h3>총 결제된 금액 : ${total_pay}원</h3></div>

				<button class="btn btn-primary float-end">메인으로 돌아가기</button>
				
				<!-- 유저정보 : 아이디, 주소, 전화번호, 이메일 -->
				<sec:authentication property="principal" var="user"/>
				<input type="hidden" id="id" name="u_userid" value="${user.username}"/>
				<input type="hidden" id="total_pay" name="total_pay" value="${total_pay}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<!-- <button type = "submit" class="btn btn-primary">submit</button> -->
				
			</form>
			</div>
			<div class="col-md-1"></div>

		</div>
	</div>
	
</div>
</body>

<!-- <script src="/resources/main/js/campuslist.js"></script> -->

<%@include file="../../design/footer.jsp"%>