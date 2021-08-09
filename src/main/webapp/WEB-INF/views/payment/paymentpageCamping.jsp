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
			
				<form action="/payment/kakaoPay2" method="post">
			
				<hr class="one" />
				<div class="col-md-12"><h3 class="heading-section" style="font-family: naBrush;">상품 결제 페이지</h3></div>
				<hr class="one" />

				<div class="col-md-12 colorthema hh4 padding6px margintb20">예약 정보</div>
				
				<table class="table camping">
					<thead>
						<tr class="textcenter colorthema">
							<th class="width20">예약 정보</th>
							<th class="width30">캠핑장 이름</th>
							<th class="width10">장소</th>
							<th class="width20">예약 날짜</th>
							<th class="width20">예약 비용</th>
						</tr>
					</thead>
					<tbody class="textcenter">
					
						<tr>
							<td>
								<img src="/resources/main/images/creser.jpg" alt="" class="size200"/>
							</td>
							<td class="textmiddle"><b>캠퍼스 캠핑장</b>
							</td>
							<td class="textmiddle">${campVO.c_area}번 자리</td>
							<td class="textmiddle">${campVO.c_rsysdate}</td>
							<td class="textmiddle">160000원</td>
						</tr>

					</tbody>
				</table>

				<div class="col-md-12 textright margintb20"><h3>총 결제 금액 : 160000원</h3></div>
				
				<hr class="one"  />
				
				
				<div class="col-md-12 colorthema hh4 padding6px margintb20">예약자 정보</div>
				
				<div class="col-md-12 bottommargin10 mll10">
					<input type="text" name="c_nname" class="form-control width60" placeholder="예약자 이름을 입력해 주세요" />
				</div>
				<div class="col-md-12 bottommargin10 mll10">
					<input type="text" name="c_phone" class="form-control width60" placeholder="예약자 연락처를 입력해 주세요"/>
				</div>
				
				
				<hr class="one margintb40" />
				
				<div class="col-md-12 textright margintb20"><h3>총 결제 금액 : 160000원</h3><h5>(택배비 : ${total_parcel})</h5></div>
								
				<hr class="one margintb40" />
				
				<div class="margintb20"><h4>결제 방법 선택</h4></div>
				카카오페이<button class="btn kakao-btn" type="submit"><img src="/resources/main/images/payment_icon_yellow_medium.png" alt="" /></button>
				
				<hr class="one margintb40" />
				
<!-- 				<div class="margintb20"><h4>결제 방법 선택</h4></div>
				카카오페이<button class="btn kakaobtn"><img src="/resources/main/images/payment_icon_yellow_medium.png" alt="" /></button>
				 -->
				 
				<button class="btn btn-primary float-end" onclick="location.href='/'">메인으로 돌아가기</button>
				
				<!-- 유저정보 : 아이디, 주소, 전화번호, 이메일 -->
				<sec:authentication property="principal" var="user"/>
				<input type="hidden" id="id" name="u_userid" value="${user.username}"/>
				<input type="hidden" id="total_pay" name="c_pay" value='160000'/>
				<input type="hidden" id="rsysdate" name="c_rsysdate" value='${campVO.c_rsysdate}'/>
				<input type="hidden" id="area" name="c_area" value='${campVO.c_area}'/>
				<input type="hidden" id="name" name="c_name" value='캠퍼스 캠핑장'/>
				
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<!-- <button type = "submit" class="btn btn-primary">submit</button> -->
				
			</form>
			</div>
			<div class="col-md-1"></div>

		</div>
	</div>
	
</div>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- <script src="/resources/main/js/campuslist.js"></script> -->
<script src="/resources/main/js/kakaopay.js"></script>
<script src="/resources/main/js/kakaopay2.js"></script>
<%@include file="../../design/footer.jsp"%>