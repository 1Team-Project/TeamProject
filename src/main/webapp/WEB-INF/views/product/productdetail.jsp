  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>
<!-- <link rel="stylesheet" href="/resources/main/css/bootstrap.min.css"> -->
<link href="/resources/main/css/common.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="/resources/main/css/campusBoard.css">

<div class="product_view">

	<div id="productview">
		<div class="innerview">
			<div class="product">
				<img class="photo" src="${vo.urllink}" alt="대표사진" />

			</div>


			<p class="p_name">
				<strong class="name">${vo.p_name}</strong> <span class="name_detail">상세 설명</span>
			</p>

			<div class="p_info">
				<table>
					<colgroup>
						<col style="width: 173px;">
						<col>
					</colgroup>

					<tbody>


						<tr>
							<td class="price"><fmt:formatNumber value="${vo.p_price}"
									pattern="###,###,###"></fmt:formatNumber> <input type="hidden"
								value="${vo.p_price}" name="price"></td>
						</tr>

						<tr>
							<th><img src="/resources/main/images/gift.png">&nbsp;상품코드</th>
							<td>${vo.p_number}</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/manufacture.png">&nbsp;제조사/공급사</th>
							<td>${vo.p_manufact}</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/money-bag.png">&nbsp;구매수량</th>
							<td>
								<div class="option">
<!-- 									<span class="opt"> -->
										<button type="button" class="btn minus off">-</button> 
										<input type="number" readonly="readonly" value="1" max="${vo.p_stock}" class="inp" style="border: none; width:30px; height:30px; text-align:center;">
										<button type="button" class="btn plus">+</button>
<!-- 									</span> -->
								</div>
							</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/choices.png">&nbsp;${vo.p_option}선택</th>
							<td><select name="option">
									<option value="${vo.po_option1}" class="option">${vo.po_option1}</option>
									<option value="${vo.po_option2}" class="option">${vo.po_option2}</option>
									<option value="${vo.po_option3}" class="option">${vo.po_option3}</option>
							</select>
						<tr>
							<th><img src="/resources/main/images/shipped.png">&nbsp;배송비</th>
							<td>${vo.p_shippingfee}
							<input type="hidden" value="${vo.p_shippingfee}" name="shipping">
							</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/payment-method.png">&nbsp;배송
								안내</th>
							<td>본 상품은 국내 배송만 가능합니다.</td>
						</tr>
					</tbody>
				</table>

				<div id="cartput">
					<div class="total">
						<div class="price">
							<strong class="tot">총 상품금액 : </strong> <span class="sum">
								<span class="num"> <%--                         <fmt:formatNumber value="${vo.p_price}" pattern="###,###,###"></fmt:formatNumber></span>  --%>
									<input type="text" value="${vo.p_price}"name="sum" class="subtotal" readonly 
									style="border: none; text-align:center; font-weight : 700;">+배송비(${vo.p_shippingfee})<span class="unit">원</span>
							</span>
						</div>

						<div class="option_btn">
							<input type="hidden" id="p_number" value="${vo.p_number}">
							<input type="hidden" name="userid" id="userid"
								value="<sec:authentication property="principal.campusUser.u_userid"/>">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="button" class="btn btn-primary btn-lg"
								id="btn_cart">장바구니</button>
							<button type="button" class="btn btn-secondary btn-lg"
								onclick="location.href='/payment/paymentpage'">구매하기</button>
						</div>

						<div class="p_detail_info">
							<div class="p_detail_bar">
								<ul class="menu">
									<li class="menu1">상품 상세</li>
									<li class="menu2">상품 별점</li>
									<li class="menu3">상품 문의</li>
									<li class="menu4">교환/반품</li>
								</ul>
							</div>
						</div>
						<ul class="cbcontent justfiy-content-center nav">

						</ul>
						<div class="panel-body">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
						<div class="p_detail_img">
							<p id="mainImg"></p>
							<script>
								var str = "";
							</script>
							<c:forEach var="product" items="${con.attachList}">
								<script>
									var uuid = '${product.a_uuid}';
									var path = '${product.a_path}';
									var name = '${product.a_name}';
									var imgPath = encodeURIComponent(path + "/"
											+ uuid + "_" + name);
									str += "<p><img src='/display?fileName="
											+ imgPath
											+ "' alt='' class='product_img'/></p>";
								</script>
							</c:forEach>
							<script>
								console.log(str);
								/*  $(".test").html(str);   */
								var imgArea = document
										.querySelector("#mainImg");
								imgArea.innerHTML = str;
							</script>


							<div class="description">
								<div class="d_wrapper">
									<strong class="d_title"> <span>${vo.p_name}</span> <span
										class="d_subtitle">[디테일설명같은거 추가?!@!]</span>
									</strong>
									<p class="descript">${con.b_content}</p>

									<div class="p_reviewbar">
										<h1>
											<span class="rivew">Product's Review</span><br> <span
												class="star">평균 별점 : <input type="text" class="avg"
												readonly style="border: none; width: 30; height: 30;"></span>
										</h1>
										<div class="row">
											<div class="col-md-10"></div>
											<div class="col-md-2 margintb20"></div>
										</div>
										<table class="table" id="tbody1">
											<thead>
												<tr class="textcenter colorthema">
													<th class="width10">번호</th>
													<th class="width10">분류</th>
													<th class="width40">제목</th>
													<th class="width10">글쓴이</th>
													<th class="width20">작성일</th>
													<th class="width10">평점</th>
												</tr>
											</thead>
<%-- 											<c:set var="total" value="0" /> --%>
											<c:forEach var="r" items="${review}" varStatus="status">
												<tbody class="textcenter1">
													<tr>
														<td>${status.count}</td>
														<td>${r.b_sort}</td>
														<td><a href="${r.b_no}"
															class="blacktext hoverthema clickview">${r.b_title}</a></td>
														<td>${r.b_writer}</td>
														<td><c:set var="bsys">
																<fmt:formatDate pattern="yyyy-MM-dd"
																	value="${r.b_sysdate}" />
															</c:set> <c:choose>

																<c:when test="${systest eq bsys}">
																	<fmt:formatDate pattern="HH:mm" value="${r.b_sysdate}"
																		timeZone="Asia/Seoul" />
																</c:when>

																<c:otherwise>
																	<fmt:formatDate pattern="yyyy-MM-dd"
																		value="${r.b_sysdate}" />
																</c:otherwise>

															</c:choose></td>
														<td>${r.b_rating}</td>

													</tr>
												</tbody>
<%-- 												<c:set var="total" value="${(total + r.b_rating)}" /> --%>
											</c:forEach>
<%-- 											<c:out value="${total}" /> --%>
										</table>
										<div class="row">
											<div class="col-md-12 mb-3">
												<button class="btn btn-primary float-end"
													onclick="location.href='/board/write'">글 쓰기</button>
												<button class="btn btn-primary float-end"
													onclick="location.href='/board/list'">전체 후기 보기</button>
											</div>
										</div>
										<!-- 페이지 선택 버튼 -->
										<div class="row">
											<div class="col-md-12">
												<ul class="mypagination justify-content-center">

													<c:if test="${CampusPageVO.prev}">
														<li class="mypage-item prev"><a
															href="${CampusPageVO.startPage-1}" class="mypage-link">
																<< </a></li>
													</c:if>

													<c:forEach var="i" begin="${CampusPageVO.startPage}"
														end="${CampusPageVO.endPage}">
														<li class="mypage-item"><a href="${i}"
															class="mypage-link ${CampusPageVO.cri.page==i?'activecolor':''}">${i}</a></li>
													</c:forEach>

													<c:if test="${CampusPageVO.next}">
														<li class="mypage-item next"><a
															href="${CampusPageVO.endPage+1}" class="mypage-link">
																>> </a></li>
													</c:if>

												</ul>
											</div>
										</div>
										<div class="col-md-1"></div>
										<div class="p_qna">
											<h1>
												<span class="qna_tit"> Q&A </span><br> <span
													class="qna_subtit"> 상품 문의를 남겨주세요!</span>
											</h1>
											<div class="row">
												<div class="col-md-10"></div>
												<div class="col-md-2 margintb20"></div>
											</div>
											<table class="table">
												<thead>
													<tr class="textcenter colorthema">
														<th class="width10">번호</th>
														<th class="width10">분류</th>
														<th class="width40">제목</th>
														<th class="width10">글쓴이</th>
														<th class="width20">작성일</th>
													</tr>
												</thead>
												<tbody class="textcenter" id="tbody">
													<c:forEach var="q" items="${question}" varStatus="status">
														<tr>
															<td>${status.count}</td>
															<td>${q.b_sort}</td>
															<td><a href="${q.b_no}"
																class="blacktext hoverthema clickview">${q.b_title}</a></td>
															<td>${q.b_writer}</td>
															<td><c:set var="bsys">
																	<fmt:formatDate pattern="yyyy-MM-dd"
																		value="${q.b_sysdate}" />
																</c:set> <c:choose>

																	<c:when test="${systest eq bsys}">
																		<fmt:formatDate pattern="HH:mm" value="${q.b_sysdate}"
																			timeZone="Asia/Seoul" />
																	</c:when>

																	<c:otherwise>
																		<fmt:formatDate pattern="yyyy-MM-dd"
																			value="${q.b_sysdate}" />
																	</c:otherwise>

																</c:choose></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<div class="row">
												<div class="col-md-12 mb-3">
													<button class="btn btn-primary float-end">글 쓰기</button>
													<button class="btn btn-primary float-end" id="btn3">전체
														후기 보기</button>
												</div>
											</div>
											<!-- 페이지 선택 버튼 -->
											<div class="row">
												<div class="col-md-12">
													<ul class="mypagination justify-content-center">

														<c:if test="${CampusPageVO.prev}">
															<li class="mypage-item prev"><a
																href="${CampusPageVO.startPage-1}" class="mypage-link">
																	<< </a></li>
														</c:if>

														<c:forEach var="i" begin="${CampusPageVO.startPage}"
															end="${CampusPageVO.endPage}">
															<li class="mypage-item"><a href="${i}"
																class="mypage-link ${CampusPageVO.cri.page==i?'activecolor':''}">${i}</a></li>
														</c:forEach>

														<c:if test="${CampusPageVO.next}">
															<li class="mypage-item next"><a
																href="${CampusPageVO.endPage+1}" class="mypage-link">
																	>> </a></li>
														</c:if>

													</ul>
												</div>
											</div>
											<div class="change_info">

												<div>
													<strong>교환 및 반품정보</strong>
												</div>
												<div>교환/반품 기준</div>
												<ul>
													<li>상품 출고 이후 취소 요청 시 상품 회수 후 처리됩니다.</li>
													<li>교환/반품은 상품 수령일로부터 7일 이내 가능합니다.</li>
													<li>교환/반품 신청 시 CJ대한통운 택배로 회수됩니다.</li>
													<li>단순 변심에 인한 교환/반품 택배비 고객 부담으로 왕복 택배비가 발생합니다. (전자상거래
														등에서의 소비자보호에 관한 법률 제18조(청약 철회 등) 9항에 의거 소비자의 사정에 의한 청약 철회 시
														택배비 소비자 부담)</li>
													<li>상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.</li>
													<li>불량/오배송 상품의 경우 Q&A 게시판 또는 고객센터로 문의 부탁드립니다.</li>
													<li>교환/환불/기타 문의는 Q&A 게시판 또는 고객센터로 문의 부탁드립니다.</li>
												</ul>
											</div>

											<div>교환/반품이 불가한 경우</div>
											<ul>
												<li>단순 변심으로 인한 교환/반품 신청이 상품 수령한 날로부터 7일이 경과한 경우 (상품 불량
													제외)</li>
												<li>상품 불량 및 부작용으로 인한 교환/반품 신청은 3개월 이내까지 가능합니다.</li>
												<li>소비자의 사용 또는 과실/부주의로 인하여 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한
													포장 훼손은 예외)</li>
												<li>구매한 상품의 구성품이 누락/분실된 경우(세트 상품, 사은품 등)</li>
												<li>기타,"전자상거래 등에서의 소비자 보호에 관한 법률"이 정하는 청약 철회 제한 사유에
													해당되는 경우</li>
											</ul>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>

<form action="list" method="get" id="actionForm1">
	<input type="hidden" name="sort" value="${cri.sort}" /> <input
		type="hidden" name="keyword" value="${cri.keyword}" /> <input
		type="hidden" name="page" value="${cri.page}" />
</form>


</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- <script type= text/javascript> -->
</script>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	$("#btn_cart").click(function(e) {
		e.preventDefault();
		var p_number = $("#p_number").val();
		var c_count = $(".inp").val();
		var userid = $("#userid").val();
		var option = $("select[name='option']").val();
		var data = {
			p_number : p_number,
			c_count : c_count,
			u_userid : userid,
			c_option : option
		};
		$.ajax({
			url : "/cart",
			type : "post",
			data : data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function() {
				var cart = confirm("장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
				if (cart) {
					location.href = "/cart?u_userid=" + userid;
				}
			},
			error : function() {
				alert("카트 담기 실패");
			}
		});
	});
</script>
<script src="/resources/main/js/pdetail.js"></script>
<%@include file="../../design/footer.jsp"%>