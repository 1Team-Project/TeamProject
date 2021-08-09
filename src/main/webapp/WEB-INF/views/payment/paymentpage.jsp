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
			
				<form action="/payment/kakaoPay" method="post">
			
				<hr class="one" />
				<div class="col-md-12"><h3 class="heading-section" style="font-family: naBrush;">상품 결제 페이지</h3></div>
				<hr class="one" />
				
				<div class="col-md-12 colorthema hh4 padding6px margintb20">주문 정보</div>
				
				
				<table class="table product">
					<thead>
						<tr class="textcenter colorthema">
							<th class="width20">주문 상품</th>
							<th class="width30">상품 설명</th>
							<th class="width10">수량</th>
							<th class="width20">상품 금액</th>
							<th class="width20">배송비</th>
						</tr>
					</thead>
					<tbody class="textcenter">
					<c:set var ="i" value="0"/>
					<c:forEach var="p_vo" items="${campusCartVO}">
					<!-- 상품 리스트 반복되는 부분 -->
						<tr>
							<td>
								<img src="${p_vo.cartimg}" alt="" class="size200"/>
							</td>
							<td class="textmiddle"><b>${p_vo.p_name}</b>
								<div>옵션 : ${p_vo.c_option}</div>
							</td>
							<td class="textmiddle">${p_vo.c_count}개</td>
							<td class="textmiddle">${p_vo.money}원</td>
							<td class="textmiddle">${p_vo.p_shippingfee}</td>
							
						</tr>
							<input type="hidden" id="product_code" name="cartVO[${i}].p_number" value="${p_vo.p_number}"/>
							<input type="hidden" id="product_name" name="cartVO[${i}].p_name" value="${p_vo.p_name}"/>
							<input type="hidden" id="product_money" name="cartVO[${i}].money" value="${p_vo.money}"/>
							<input type="hidden" id="product_price" name="cartVO[${i}].p_price" value="${p_vo.p_price}"/>
							<input type="hidden" id="product_count" name="cartVO[${i}].c_count" value="${p_vo.c_count}"/>
							<input type="hidden" id="product_count" name="cartVO[${i}].c_cartnumber" value="${p_vo.c_cartnumber}"/>
							<input type="hidden" id="product_option_name" name="cartVO[${i}].c_option" value="${p_vo.c_option}"/>
							<c:set var = "i" value="${i+1}"/>
							
					</c:forEach>

					</tbody>
				</table>

				<div class="col-md-12 textright margintb20"><h3>총 결제 금액 : ${total_pay}원</h3><h5>(택배비 : ${total_parcel})</h5></div>

				<div class="col-md-12 colorthema hh4 padding6px margintb20">배송지 정보</div>

				<div class="col-md-12 bottommargin10 mll10">
					<input name="o_name" type="text" class="form-control width60" placeholder="받는 분 이름을 입력해 주세요" required <c:if test = "${campusCartVO == null}">readonly</c:if> />
				</div>
				<div class="col-md-12 bottommargin10 mll10">
					<input name="o_phone" type="text" class="form-control width60" placeholder="받는 분 연락처를 입력해 주세요" required <c:if test = "${campusCartVO == null}">readonly</c:if> />
				</div>
				<div class="col-md-12 row bottommargin10 mll10 topmmargin30">

					<input name="o_address1" type="text" class="form-control width40" id="sample6_postcode" placeholder="우편번호" required <c:if test = "${campusCartVO == null}">readonly</c:if> />
					<button type="button" class="btn btn-primary inlinetest mll5 width14" onclick="sample6_execDaumPostcode()">주소 찾기</button>

				</div>
				<div class="col-md-12 bottommargin10 mll10">
					<input name="o_address2" type="text" class="form-control width60" placeholder="주소" id="sample6_address" required <c:if test = "${campusCartVO == null}">readonly</c:if> />
				</div>
				<div class="col-md-12 bottommargin10 mll10">
					<input name="o_address3" type="text" class="form-control width60" placeholder="참고항목" id="sample6_extraAddress" <c:if test = "${campusCartVO == null}">readonly</c:if> />
				</div>
				<div class="col-md-12 bottommargin30 mll10">
					<input name="o_address4" type="text" class="form-control width60 inlinetest" placeholder="상세주소" id="sample6_detailAddress" required <c:if test = "${campusCartVO == null}">readonly</c:if> />
				</div>

				
				<hr class="one margintb40" />
				
				<div class="col-md-12 textright margintb20"><h3>총 결제 금액 : ${total_pay}원</h3><h5>(택배비 : ${total_parcel})</h5></div>
								
				<hr class="one margintb40" />
				
				<div class="margintb20"><h4>결제 방법 선택</h4></div>
				카카오페이<button class="btn kakao-btn" type="submit"><img src="/resources/main/images/payment_icon_yellow_medium.png" alt="" /></button>
				
				<hr class="one margintb40" />
				
<!-- 				<div class="margintb20"><h4>결제 방법 선택</h4></div>
				카카오페이<button class="btn kakaobtn"><img src="/resources/main/images/payment_icon_yellow_medium.png" alt="" /></button>
				 -->
				 
				<button class="btn btn-primary float-end"  onclick="location.href='/'">메인으로 돌아가기</button>
				
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<!-- <script src="/resources/main/js/campuslist.js"></script> -->
<script src="/resources/main/js/kakaopay.js"></script>
<script src="/resources/main/js/kakaopay2.js"></script>
<%@include file="../../design/footer.jsp"%>