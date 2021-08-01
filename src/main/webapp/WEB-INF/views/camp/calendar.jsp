<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>

<!-- fullcalender -->
<link href='/resources/main/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src='/resources/main/fullcalendar-5.9.0/lib/main.js'></script>
<!--  <script src="/resources/main/js/gcal.js" type="text/javascript"></script>-->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
</script>
<script type="text/javascript">
	jQuery(document)
			.ready(
					function() {
						jQuery("#calendar")
								.fullCalendar(
										{
											header : {
												left : "prev",
												center : "title, month",
												right : "next"
											},
											lang : "ko",
											editable : true,
											eventLimit : true,
											googleCalendarApiKey : "AIzaSyCg0PD8H71-0PruOX_43yU0-Xxdn_whFFM" // Google API KEY
											,
											eventSources : [
											// 대한민국의 공휴일
											{
												googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
												className : "koHolidays",
												color : "#FF0000",
												textColor : "#FFFFFF"
											} ],
											loading : function(bool) {
												jQuery("#loading").toggle(bool);
											}
										});
					});
</script>


<div class="campingpage">
<h3>캠핑장 예약</h3>

<div id="calendar"></div>

<div class="camping">
	<div class="camping seat">
		<a href="#">캠핑장 장소 설명</a>
	</div>
	<div class="reservation">
		<div>
			<div class="d-flex justify-content-between flex-column"
				style="border-bottom: 1px solid rgb(235, 237, 243);">
				<div data-toggle="modal" data-target="#siteGroupModal"
					class="mb-2 pointer">
					<div
						class="bgi-no-repeat bgi-size-cover rounded min-h-180px w-100 image-dynamic-ratio"
						style="background-position: center center; background-image: url(&quot;https://img.campingtalk.me/camp/3512/16230538403759944_S.jpg&quot;);">
					</div>
					<div class="pt-4">
						<div class="d-flex pb-9">
							<div class="d-flex flex-column flex-grow-1">
								<span class="text-dark-75 font-weight-bolder font-size-h4 mb-2"><span>캠핑장
										이름</span></span> <span class="text-dark-75 font-weight-bold font-size-lg"><span>옵션설명</span></span>
								<span class="text-dark-75 font-weight-bold font-size-lg"><span>인원수</span></span>
								<span class="text-dark-75 font-weight-bold font-size-lg"><span>잔여
										자리?수</span></span>
							</div>
							<div class="font-size-h6 font-weight-bolder text-right">
								<div
									class="text-dark-75 font-weight-bolder font-size-h4 text-right mb-2">
									<span>가격 얼마얼마</span>
									<!---->
								</div>
								<span class="text-success"
									style="min-width: 125px; white-space: nowrap; display: inline-block;">예약여부
									Y/N</span> <span><button type="button" class="btn btn-primary">예약하기</button></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="change_info">

	<div>
		<strong>예약 및 취소정보</strong>
	</div>
	<div>
		<ul>
			<li>예약취소는 구매한 사이트 "MYPAGE" 혹은 "예약확인/취소"에서 가능합니다.</li>
			<li>취소수수료는 예약시점과는 무관하게 '입실일로부터 남은 날짜' 기준으로 부과됩니다. 신중한 예약바랍니다.</li>
			<li>예약 이용일 변경 불가합니다. (취소수수료 확인 후) 기존 예약건 취소 및 재예약하셔야 합니다.</li>
			<li>중복예약 취소, 업체 요청에 의한 취소, 법령에 의한 취소 등은 반드시 고객센터(070-000-0000)또는 해당 숙소를 통하여 도움을 받으십시오.</li>
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

<%@include file="../../design/footer.jsp"%>