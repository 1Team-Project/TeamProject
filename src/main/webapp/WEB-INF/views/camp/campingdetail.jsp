<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>
<link rel="stylesheet" href="/resources/main/css/campingdetail.css">
<!--  <script src="./jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<link href="/resources/main/air-datepicker/dist/css/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker css -->
<script src="/resources/main/air-datepicker/dist/js/datepicker.js"></script>
<!-- Air datepicker js -->
<script src="/resources/main/air-datepicker/dist/js/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->


<div id="titleArea" class="">
	<h3>캠핑장 예약</h3>
	<div class="container">
		<!-- 캠핑장 사진..? -->
		<div class="camping">
			<img src="/resources/main/images/camp.jpg" class="camping">
					<p class="name">캠퍼스 캠핑장</p>
					<p class="detail">바로 앞에 계곡이 있고 접근이 쉬운 캠핑장 입니다!</p>
		</div>
		<div class="camp reservation">
			<img src="/resources/main/images/campinglist.jpg" class="loc">
		</div>

		<div class="camp select">
			<p class="title">자리를 선택해 주세요!</p>
			<section>
				<!-- 캠핑장 자리 이미지,,,가 배경이고 그러면 좋을텐데,,,,, -->
				<table border="1" cellspacing="0" width="200" height="300">
					<tr>
						<td id="s1" width="33%" align="center"><input type="checkbox"
							id="sNo" value="1"> 1</td>
						<td id="s2" align="center"><input type="checkbox" id="sNo"
							value="2"> 2</td>
						<td id="s3" align="center"><input type="checkbox" id="sNo"
							value="3"> 3</td>
					</tr>
					<tr>
						<td id="s4" width="33%" align="center"><input type="checkbox"
							id="sNo" value="4"> 4</td>
						<td id="s5" align="center"><input type="checkbox" id="sNo"
							value="5"> 5</td>
						<td id="s6" align="center"><input type="checkbox" id="sNo"
							value="6"> 6</td>
					</tr>
				</table>
			</section>
		</div>
	</div>

	<!-- 	   캘린더 날짜선택 -->
	<div class="calendar">
		<span><strong>날짜 선택</strong></span> <input type="text" id="datepicker">
	</div>


	<!-- 	<!-- 캠핑장 자리/구역 예약부분 -->
	<div class="people">
		<div class="form-group row mb-1">
			<div class="col-12">
				<div
					class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
					<span
						class="input-group-addon bootstrap-touchspin-prefix input-group-prepend"><span
						class="input-group-text">성인</span></span> <span
						class="input-group-btn input-group-prepend"><button
							type="button" class="btn btn-primary bootstrap-touchspin-down">-</button></span>
					<input type="text" class=""> <span
						class="input-group-btn input-group-append"><button
							type="button" class="btn btn-primary bootstrap-touchspin-up">+</button></span>
				</div>
			</div>
		</div>
		<div class="form-group row mb-1">
			<div class="col-12">
				<div
					class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
					<span
						class="input-group-addon bootstrap-touchspin-prefix input-group-prepend"><span
						class="input-group-text">아동</span></span> <span
						class="input-group-btn input-group-prepend"><button
							type="button" class="btn btn-primary bootstrap-touchspin-down">-</button></span>
					<input type="text" class=""> <span
						class="input-group-btn input-group-append"><button
							type="button" class="btn btn-primary bootstrap-touchspin-up">+</button></span>
				</div>
			</div>
		</div>
		<div class="reserv">
			<button type="button" class="btn btn-primary btn-lg">예약하기</button>
		</div>
	</div>

	<!-- 	<!-- 공백,,,2,, -->
	<!-- 	<div class="gong2"></div> -->

	<!-- 	<!-- 하단에 예약 및 취소정보 -->
	<div class="change_info">
		<div>
			<strong>예약 및 취소정보</strong>
		</div>
		<div>
			<ul>
				<li>예약취소는 구매한 사이트 "MYPAGE" 혹은 "예약확인"에서 가능합니다.</li>
				<li>취소수수료는 예약시점과는 무관하게 '입실일로부터 남은 날짜' 기준으로 부과됩니다. 신중한 예약바랍니다.</li>
				<li>예약 이용일 변경 불가합니다. (취소수수료 확인 후) 기존 예약건 취소 및 재예약하셔야 합니다.</li>
				<li>중복예약 취소, 업체 요청에 의한 취소, 법령에 의한 취소 등은 반드시
					고객센터(070-000-0000)또는 해당 숙소를 통하여 도움을 받으십시오.</li>
				<li>미성년자는 예약이 불가하며, 보호자 동반 없이 이용 불가합니다.</li>
			</ul>
			<ul>
				<li class="nobulletTitle">※ 기상 상황 및 코로나 등 전염병 관련 예약 취소 안내</li>
				<li>우천으로 인한 환불 및 날짜 변경 불가합니다.</li>
				<li>천재지변 또는 기상악화 시, 현장(캠핑장/펜션)상황과 정책에 따라 당일 오전 현장 판단하에 연기 또는 취소
					결정됩니다.</li>
				<li>코로나 등 전염병 관련 예약 취소는 병원/행정기관 등 유관기관에서 발급한 '예약자 본인 확인 가능한 증빙
					서류 제출 시' 업체와 협의 후 가능합니다.</li>
				<li>사전 협의 없이 예약자가 직접 예약 취소 시 환불 규정에 따라 환불되며, 결제업체(결제수단)의 정책에 따라
					취소수수료 환불이 불가할 수 있습니다.</li>
			</ul>
			<ul>
				<li>취소 시 결제금액에서 취소수수료를 제외한 금액이 환불되며, 취소수수료는 총 결제금액 기준으로 책정됩니다.</li>
				<li>취소 신청 후 간편결제 사업자 또는 은행/신용카드사에 따라 환불 절차에 일정 시간이 소요됩니다.</li>
				<li>영업일 기준(토/일/공휴일 제외)으로 실시간 계좌이체 2~3일, 신용카드 3~5일 소요됩니다.</li>
				<li>환불 관련 자세한 문의는 고객센터(070-000-0000)로 문의하시기 바랍니다.</li>
			</ul>
		</div>
	</div>
</div>
<script>
	$("#datepicker").datepicker({
		language : 'ko'
	});
</script>

<%@include file="../../design/footer.jsp"%>