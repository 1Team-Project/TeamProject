<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>
<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
<link href="/resources/main/css/common.css" rel="stylesheet"
	type="text/css" />

<div class="product_view">

	<div id="productview">
		<div class="innerview">

			<div class="product">
				<img class="photo" src="/resources/main/images/lamp.jpg"
					alt="상품 대표 사진" />
				<ul>

					
					<c:forEach var="vo" items="vo">
						<li class="small_img">
							<a href=""> 
							<img src="" alt=""></a>
						</li>
					</c:forEach>
						
					

					<li class="small_img"><a
						href="/resources/main/images/lamp.jpg"> <img
							src="/resources/main/images/lamp.jpg" alt="손전등 상세 사진1"></a></li>
					<li><a href="/resources/main/images/lamp5.png"> <img
							src="/resources/main/images/lamp5.png" alt="손전등 상세 사진2"></a></li>
					<li><a href="/resources/main/images/lamp2.jpg"> <img
							src="/resources/main/images/lamp2.jpg" alt="손전등 상세 사진3"></a></li>
					<li><a href="/resources/main/images/lamp3.jpg"><img
							src="/resources/main/images/lamp3.jpg" alt="손전등 상세 사진4"></a></li>

				</ul>
			</div>

			<p class="p_name">

				<strong class="name">${vo.p_name}</strong> 
				<span class="name_detail">배터리가
					잘 닳지 않는 강력 손전등</span>

				<strong class="name">${product.p_name}</strong> <span
					class="name_detail">배터리가 잘 닳지 않는 강력 손전등</span>

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
									pattern="###,###,###"></fmt:formatNumber></td>

							<td class="price"><fmt:formatNumber
									value="${product.p_price}" pattern="###,###,###"></fmt:formatNumber>
								<span class="unit">원</span></td>

						</tr>
						<tr>
							<th><img src="/resources/main/images/gift.png">&nbsp;상품코드</th>
							<td>${vo.p_number}</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/manufacture.png">&nbsp;제조사/공급사</th>

							<td>${vo.p_manufact}</td>

							<td>${product.p_manufact}</td>

						</tr>
						<tr>
							<th><img src="/resources/main/images/money-bag.png">&nbsp;구매수량</th>
							<td>
								<div class="option">
									<span class="opt">
										<button type="button" class="minus">+</button> <input
										type="number" readonly="readonly" min="1" max="${vo.p_stock}"
										onfocus="this.blur()" class="inp">

										type="number" readonly="readonly" min="1"
										max="${product.p_stock}" onfocus="this.blur()" class="inp">

										<button type="button" class="plus">-</button>
									</span>
								</div>
							</td>
						</tr>
						<tr>

							<th><img src="/resources/main/images/choices.png">&nbsp;${vo.p_option}선택</th>
							<td>
							<select>
								
									<option value="">${vo.p_option}</option>
						     	
							
						<tr>
							<th><img src="/resources/main/images/shipped.png">&nbsp;배송비</th>
							<td>무료배송</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/payment-method.png">&nbsp;배송
								안내</th>
							<td>본 상품은 국내 배송만 가능합니다.</td>
						</tr>

							<th><img src="/resources/main/images/choices.png">&nbsp;옵션선택</th>
							<td><select>
									<c:forEach begin="" end="" var="i">
										<option value="${i}">${i}</option>
										<option value="${i}">${i}</option>
										<option value="${i}">${i}</option>
										<option value="${i}">${i}</option>
									</c:forEach>

									<tr>
										<th><img src="/resources/main/images/shipped.png">&nbsp;배송비</th>
										<td>무료배송</td>
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

							<strong class="tot">총 상품금액 : </strong>
							 <span class="sum">
								<span class="num">
								<fmt:formatNumber value="${vo.p_price}" pattern="###,###,###"></fmt:formatNumber></span> 

							<strong class="tot">총 상품금액 : </strong> <span class="sum">
								<span class="num"> <fmt:formatNumber
										value="${product.p_price}" pattern="###,###,###"></fmt:formatNumber></span>

								<span class="unit">원</span>
							</span>
						</div>

						<div class="option_btn">

						<input type="hidden" name="p_number" value="${vo.p_number}">
							<button type="button" class="btn btn-primary btn-lg" id="">장바구니</button>
							<button type="button" class="btn btn-secondary btn-lg">구매하기</button>
=======
							<form role="form" method="post">
								<input type="hidden" id="p_number" value="${product.p_number}">
<%-- 								<input type="hidden" id="p_name" value="${product.p_number}"> --%>
<%-- 								<input type="hidden" id="p_price" value="${product.p_number}"> --%>
<%-- 								<input type="hidden" id="p_number" value="${product.p_number}"> --%>
							</form>
							<button type="button" class="btn btn-primary btn-lg" id="btn_cart">장바구니</button>
							<button type="button" class="btn btn-secondary btn-lg" id="btn_order">구매하기</button>
						</div>

						<!-- 모달창 -->
						<div class="modal" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">장바구니 담기</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>상품을 담았습니다!</p>
									</div>
<!-- 									<div class="modal-footer"> -->
<!-- <!-- 										<button type="button" class="btn btn-secondary" id="btnmodal" --> 
<!-- 											data-dismiss="modal">장바구니로</button> -->
<!-- <!-- 										<button type="button" class="btn btn-primary" id="btnmodal2"></button> --> 
<!-- 									</div> -->
								</div>
							</div>

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

						<div class="p_detail_img">
							<p class="main_img">
								<img src="/resources/main/images/lamp.jpg">
							</p>
							<div class="description">
								<div class="d_wrapper">
									<strong class="d_title"> <span>다시 돌아온 강력 손전등!!</span>
										<span class="d_subtitle">[오랜 시간 지속 가능]</span>
									</strong>
									<p class="descript">Lorem ipsum dolor sit amet consectetur,
										adipisicing elit. Molestiae deserunt illo quaerat officia quia
										est consequatur dolores corrupti nihil at eligendi ipsam
										numquam quasi architecto praesentium, dolorum labore quas a.
										Sapiente tenetur molestiae commodi nobis earum nesciunt.
										Mollitia, autem molestiae nostrum aut explicabo asperiores
										aperiam omnis, iusto pariatur veritatis magni quibusdam minus
										nemo necessitatibus debitis iste accusamus repudiandae atque.
										Dolores! Pariatur possimus molestias, consequatur eius ullam
										soluta ut sint eum minima id labore voluptatem. Ducimus cum
										error, temporibus cumque voluptates nihil? Ipsum optio sed
										veritatis repellendus sunt aspernatur in explicabo. Facere,
										eligendi aliquam fuga nemo eos consequatur, provident rerum
										officia beatae inventore et porro minima aliquid. Placeat
										beatae facilis voluptatem illo voluptates saepe rem, optio,
										architecto facere tempore nihil aut! Incidunt, molestias
										quaerat. Assumenda architecto facere debitis, obcaecati quod
										distinctio. Dolor, doloremque. Necessitatibus vero voluptatem
										sit, dolorem fugiat molestiae accusantium cumque illum?
										Consequatur sit autem perferendis. Voluptate laboriosam quae
										quas!</p>
									<p class="descript_img1">
										<img src="/resources/main/images/lamp2.jpg">
									</p>
									<p class="descript_img2">
										<img src="/resources/main/images/lamp3.jpg">
									</p>
									<p class="descript_img3">
										<img src="/resources/main/images/tent.png">
									</p>
									<div class="when_use">
										<h1>
											<span class="campustip"> Camp Us's Tip!</span><br> <span
												class="tipkor"> 상품 활용 팁!</span>
										</h1>
										<div class="tip_info">
											<span class="tip_icon"> <img
												src="/resources/main/images/camp.png">
											</span> <span class="tip_icon"> <img
												src="/resources/main/images/moon.png">
											</span> <span class="tip_icon"> <img
												src="/resources/main/images/thumb.png">
											</span>
										</div>
										<div class="tip_detail">
											<span class="detail1">텐트 안에 손전등 걸기 가능 &nbsp;</span> <span
												class="detail2">어두운 실외에서 사용 가능 &nbsp;</span> <span
												class="detail3">많은 사람들의 추천템!</span>
										</div>
										<div class="tip_detail2">
											<span class="">손전등 뒤에 고리가 달려있어 달아두기 가능</span> <span class="">발광력
												좋음</span> <span class="">가장 인기가 좋은 제품</span>
										</div>
										<div class="size_info">
											<h1 class="size">
												<span class="size_title">상품 사이즈</span> <span class="p_size"><img
													src="/resources/main/images/lamp5.png"></span> <span
													class="p_size"><img
													src="/resources/main/images/lamp5.png"></span>
											</h1>
										</div>
										<div class="p_reviewbar">
											<h1>
												<span class="rivew">Product's Review</span><br> <span
													class="star">해당 상품의 별점을 알려드립니다!</span>
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
														<th class="width10">평점</th>
													</tr>
												</thead>
												<tbody class="textcenter">
													<tr>
														<td>5</td>
														<td>후기</td>
														<td><a href="#" class="blacktext hoverthema">안녕하세요
																후기입니다<strong class="badgecount">[1]</strong>
														</a></td>
														<td>홍길동</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>4</td>
														<td>후기</td>
														<td><a href="#" class="blacktext hoverthema">안녕하세요
																후기입니다<strong class="badgecount">[1]</strong>
														</a></td>
														<td>홍길동</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>3</td>
														<td>질문</td>
														<td><a href="#" class="blacktext hoverthema">안녕하세요
																질문입니다<strong class="badgecount">[1]</strong>
														</a></td>
														<td>홍길동</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>2</td>
														<td>후기</td>
														<td><a href="#" class="blacktext hoverthema">안녕하세요
																후기입니다<strong class="badgecount">[1]</strong>
														</a></td>
														<td>홍길동</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>1</td>
														<td>질문</td>
														<td><a href="#" class="blacktext hoverthema">안녕하세요
																질문입니다<strong class="badgecount">[1]</strong>
														</a></td>
														<td>홍길동</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
												</tbody>
											</table>
											<div class="row">
												<div class="col-md-12 mb-3">
													<button class="btn btn-primary float-end">글 쓰기</button>
													<button class="btn btn-primary float-end"
														onclick="location.href='/board/list'">전체 후기 보기</button>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<ul class="mypagination justify-content-center">
														<li class="mypage-item"><a href="#"
															class="mypage-link"> << </a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link activecolor">1</a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link">2</a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link">3</a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link"> >> </a></li>
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
															<th class="width10">조회수</th>
														</tr>
													</thead>
													<tbody class="textcenter">
														<tr>
															<td>5</td>
															<td>후기</td>
															<td><a href="#" class="blacktext hoverthema">안녕하세요
																	후기입니다<strong class="badgecount">[1]</strong>
															</a></td>
															<td>홍길동</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>4</td>
															<td>후기</td>
															<td><a href="#" class="blacktext hoverthema">안녕하세요
																	후기입니다<strong class="badgecount">[1]</strong>
															</a></td>
															<td>홍길동</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>3</td>
															<td>질문</td>
															<td><a href="#" class="blacktext hoverthema">안녕하세요
																	질문입니다<strong class="badgecount">[1]</strong>
															</a></td>
															<td>홍길동</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>2</td>
															<td>후기</td>
															<td><a href="#" class="blacktext hoverthema">안녕하세요
																	후기입니다<strong class="badgecount">[1]</strong>
															</a></td>
															<td>홍길동</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>1</td>
															<td>질문</td>
															<td><a href="#" class="blacktext hoverthema">안녕하세요
																	질문입니다<strong class="badgecount">[1]</strong>
															</a></td>
															<td>홍길동</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
													</tbody>
												</table>
												<div class="row">
													<div class="col-md-12 mb-3">
														<button class="btn btn-primary float-end">글 쓰기</button>
														<button class="btn btn-primary float-end" id="btn3">전체
															후기 보기</button>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<ul class="mypagination justify-content-center">
															<li class="mypage-item"><a href="#"
																class="mypage-link"> << </a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link activecolor">1</a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link">2</a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link">3</a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link"> >> </a></li>
														</ul>
													</div>
												</div>
												<div class="change_info">adipisicing elit. Molestiae
													deserunt illo quaerat officia quia est consequatur dolores
													corrupti nihil at eligendi ipsam numquam quasi architecto
													praesentium, dolorum labore quas a. Sapiente tenetur
													molestiae commodi nobis earum nesciunt. Mollitia, autem
													molestiae nostrum aut explicabo asperiores aperiam omnis,
													iusto pariatur veritatis magni quibusdam minus nemo
													necessitatibus debitis iste accusamus repudiandae atque.
													Dolores! Pariatur possimus molestias, consequatur eius
													ullam soluta ut sint eum minima id labore voluptatem.
													Ducimus cum error, temporibus cumque voluptates nihil?
													Ipsum optio sed veritatis repellendus sunt aspernatur in
													explicabo. Facere, eligendi aliquam fuga nemo eos
													consequatur, provident rerum officia beatae inventore et
													porro minima aliquid. Placeat beatae facilis voluptatem
													illo voluptates saepe rem, optio, architecto facere tempore
													nihil aut! Incidunt, molestias quaerat. Assumenda
													architecto facere debitis, obcaecati quod distinctio.
													Dolor, doloremque. Necessitatibus vero voluptatem sit,
													dolorem fugiat molestiae accusantium cumque illum?
													Consequatur sit autem perferendis. Voluptate laboriosam
													quae</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- <script type= text/javascript> -->
<script src="/resources/main/js/pdetail.js"></script>
<%@include file="../../design/footer.jsp"%>