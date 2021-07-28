<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../../design/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/main/css/common.css" rel="stylesheet"
<<<<<<< HEAD
   type="text/css" />
</head>
<body>
   <div class="product_view">

      <div id="productview">
         <div class="innerview">

            <div class="product">
               <img class="photo" src="/resources/main/images/lamp.jpg"
                  alt="상품 대표 사진" />
               <ul>

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
               <strong class="name">${product.p_name}</strong> <span
                  class="name_detail">배터리가 잘 닳지 않는 강력 손전등</span> <input
                  type="hidden" value="${product.p_number}" id="p_number">

            </p>

            <div class="p_info">
               <table>
                  <colgroup>
                     <col style="width: 173px;">
                     <col>
                  </colgroup>

                  <tbody>
                     <tr>
                        <td class="price">
                        <input type="hidden" value="${product.p_price}" name="price">
                        <fmt:formatNumber value="${product.p_price}" pattern="###,###,###"></fmt:formatNumber>
                           <span class="unit">원</span></td>
                     </tr>
                     <tr>
                        <th><img src="/resources/main/images/gift.png">&nbsp;상품코드</th>
                        <td>${product.p_number}</td>
                     </tr>
                     <tr>
                        <th><img src="/resources/main/images/manufacture.png">&nbsp;제조사/공급사</th>
                        <td>${product.p_manufact}</td>
                     </tr>
                     <tr>
                        <th><img src="/resources/main/images/money-bag.png">&nbsp;구매수량</th>
                        <td>
                           <div class="option">
                              <span class="opt">
                                 <button type="button" class="minus">+</button> <input
                                 type="number" readonly="readonly" min="1"
                                 max="${product.p_stock}" class="inp">
                                 <button type="button" class="plus">-</button>
                              </span>
                           </div>
                        </td>
                     </tr>
                     <tr>
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
<%--                            <fmt:formatNumber value="" pattern="###,###,###"></fmt:formatNumber> --%>
                            <input type="text" name="sum" class="subtotal" readonly 
                            style="border:none;">
                           </span>
                           <span class="unit">원</span>
                        </span>
                     </div>

                     <div class="option_btn">
                        <input type="hidden" name="userid" id="userid"
                           value="<sec:authentication property="principal.campusUser.u_userid"/>">
                        <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                        <button type="button" class="btn btn-primary btn-lg"
                           id="btn_cart">장바구니</button>
                        <button type="button" class="btn btn-secondary btn-lg"
                           id="btn_order">구매하기</button>
                     </div>

                     <div class="modal" tabindex="-1">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title">장바구니 알림창</h5>
                                 <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <div class="modal-body">
                                 <p>상품을 담았습니다! 장바구니로 바로 이동하시겠습니까?</p>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal" id="move">이동하기</button>
                                 <button type="button" class="btn btn-primary" id="nomove">
                                      쇼핑 더 하기
                                    </button>
                              </div>
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
                              <p class="descript">Lorem ipsum dolor sit amet
                                 consectetur, adipisicing elit. Molestiae deserunt illo
                                 quaerat officia quia est consequatur dolores corrupti nihil
                                 at eligendi ipsam numquam quasi architecto praesentium,
                                 dolorum labore quas a. Sapiente tenetur molestiae commodi
                                 nobis earum nesciunt. Mollitia, autem molestiae nostrum aut
                                 explicabo asperiores aperiam omnis, iusto pariatur veritatis
                                 magni quibusdam minus nemo necessitatibus debitis iste
                                 accusamus repudiandae atque. Dolores! Pariatur possimus
                                 molestias, consequatur eius ullam soluta ut sint eum minima
                                 id labore voluptatem. Ducimus cum error, temporibus cumque
                                 voluptates nihil? Ipsum optio sed veritatis repellendus sunt
                                 aspernatur in explicabo. Facere, eligendi aliquam fuga nemo
                                 eos consequatur, provident rerum officia beatae inventore et
                                 porro minima aliquid. Placeat beatae facilis voluptatem illo
                                 voluptates saepe rem, optio, architecto facere tempore nihil
                                 aut! Incidunt, molestias quaerat. Assumenda architecto facere
                                 debitis, obcaecati quod distinctio. Dolor, doloremque.
                                 Necessitatibus vero voluptatem sit, dolorem fugiat molestiae
                                 accusantium cumque illum? Consequatur sit autem perferendis.
                                 Voluptate laboriosam quae quas!</p>
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
                                          illo voluptates saepe rem, optio, architecto facere
                                          tempore nihil aut! Incidunt, molestias quaerat. Assumenda
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
   <script>
      var csrfHeaderName = "${_csrf.headerName}";
      var csrfTokenValue = "${_csrf.token}";

      $("#btn_cart").click(function(e) {
         e.preventDefault();

         var p_number = $("#p_number").val();
         var c_count = $(".inp").val();   
         var userid= $("#userid").val();
        
         var data ={
            p_number : p_number,
            c_count : c_count,
            u_userid : userid,
         };

         $.ajax({
            url: "/cart",
            type: "post",
            data: data,
            beforeSend:function(xhr){
               xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
            },
            success: function() {
               var cart = confirm("장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
               if(cart){
                  location.href= "/cart?u_userid="+userid;
               }
             },
               error:function(){
                  alert("카트 담기 실패");
               }
            });
         });
   </script>
</body>
</html>
=======
	type="text/css" />
	
<div class="product_view">

	<div id="productview">
		<div class="innerview">
			<div class="product">
				<img class="photo" src="${vo.urllink}" alt="대표사진"/>
				
			</div>
			

			<p class="p_name">
				<strong class="name">${vo.p_name}</strong> 
				<span class="name_detail">상세설며어어쩌구저쩌구</span>
			</p>

			<div class="p_info">
				<table>
				<colgroup>
						<col style="width: 173px;">	<col>
					</colgroup> 

					<tbody>
				
						
						<tr>
							<td class="price"><fmt:formatNumber value="${vo.p_price}"
									pattern="###,###,###"></fmt:formatNumber></td>
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
									<span class="opt">
										<button type="button" class="minus">+</button> <input
										type="number" readonly="readonly" min="1" max="${vo.p_stock}"
										onfocus="this.blur()" class="inp">
										<button type="button" class="plus">-</button>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/choices.png">&nbsp;${vo.p_option}선택</th>
							<td>
							<select>
									<option value="">${vo.po_option1}</option>
									<option value="">${vo.po_option2}</option>
									<option value="">${vo.po_option3}</option>
						    </select>
							
						<tr>
							<th><img src="/resources/main/images/shipped.png">&nbsp;배송비</th>
							<td>${vo.p_shippingfee}</td>
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
								<span class="unit">원</span>
							</span>
						</div>
						
						<div class="option_btn">
						<input type="hidden" name="p_number" value="${vo.p_number}">
							<button type="button" class="btn btn-primary btn-lg" id="">장바구니</button>
							<button type="button" class="btn btn-secondary btn-lg">구매하기</button>
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
						<ul class="cbcontent justfiy-content-center nav" >
				
							</ul>
						<div class="panel-body">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
						<div class="p_detail_img">
								<p id="mainImg">
									
								</p>
								<script>
									var str="";
								</script>
								<c:forEach var="product" items="${con.attachList}">
								<script>
								
									var uuid = '${product.a_uuid}';
									var path = '${product.a_path}';
									var name = '${product.a_name}';
								
									var imgPath = encodeURIComponent(path+"/"+uuid+"_"+name);									
									
									str+="<p><img src='/display?fileName="+imgPath+"' alt='' class='product_img'/></p>";	
									
								</script>									
								</c:forEach>
								<script>
									console.log(str);
									/*  $(".test").html(str);	*/
									
									var imgArea=document.querySelector("#mainImg");
									imgArea.innerHTML = str;
									
								</script>
								
							
							<div class="description">
								<div class="d_wrapper">
									<strong class="d_title"> <span>${vo.p_name}</span>
										<span class="d_subtitle">[디테일설명같은거 추가?!@!]</span>
									</strong>
									<p class="descript">
										${con.b_content}
									</p>
								
									
								
										<div class="p_reviewbar">
											<h1>
												<span class="rivew">Product's Review</span><br> <span
													class="star">평균 별점 : @계싼하기@</span>
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
												<c:forEach var="r" items="${review}">
												<tbody class="textcenter">
													<tr>
													
														<td>${r.rownum}</td>
														<td>${r.b_sort}</td>
														<td><a href="#" class="blacktext hoverthema">${r.b_title}</a></td>
														<td>${r.b_writer}</td>
														<td>
														
														<c:set var="bsys"><fmt:formatDate pattern="yyyy-MM-dd" value="${r.b_sysdate}"/></c:set>
														<c:choose>
														
															<c:when test="${systest eq bsys}">
																<fmt:formatDate pattern="HH:mm" value="${r.b_sysdate}" timeZone="Asia/Seoul"/>
															</c:when>
															
															<c:otherwise>
																<fmt:formatDate pattern="yyyy-MM-dd" value="${r.b_sysdate}"/>
															</c:otherwise>
															
														</c:choose>
														
														
														</td>
														<td>${r.b_rating }</td>
													
													</tr>
												</tbody>
												</c:forEach>
											</table>
											<div class="row">
												<div class="col-md-12 mb-3">
													<button class="btn btn-primary float-end">글 쓰기</button>
													<button class="btn btn-primary float-end" onclick="location.href='/board/list'">전체 후기 보기</button>
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
														<c:forEach var="q" items="${question}">
															<td>${q.rownum+1}</td>
															<td>${q.b_sort}</td>
															<td><a href="#" class="blacktext hoverthema">${q.b_title}</a></td>
															<td>${q.b_writer}</td>
															<td>
														
																<c:set var="bsys"><fmt:formatDate pattern="yyyy-MM-dd" value="${q.b_sysdate}"/></c:set>
																<c:choose>
																
																	<c:when test="${systest eq bsys}">
																		<fmt:formatDate pattern="HH:mm" value="${q.b_sysdate}" timeZone="Asia/Seoul"/>
																	</c:when>
																	
																	<c:otherwise>
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${q.b_sysdate}"/>
																	</c:otherwise>
																	
																</c:choose>
																
														
														</td>
														</c:forEach>
														</tr>
													</tbody>
												</table>
												<div class="row">
													<div class="col-md-12 mb-3">
														<button class="btn btn-primary float-end" >글 쓰기</button>
														<button class="btn btn-primary float-end" id="btn3" >전체 후기
															보기</button>
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
												<div class="change_info">

												<div><strong>교환 및 반품정보</strong></div>
												<div>교환/반품 기준</div>
												<ul>
													<li>상품 출고 이후 취소 요청 시 상품 회수 후 처리됩니다.</li>	
													<li>교환/반품은 상품 수령일로부터 7일 이내 가능합니다.</li>
													<li>교환/반품 신청 시 CJ대한통운 택배로 회수됩니다.</li>
													<li>단순 변심에 인한 교환/반품 택배비 고객 부담으로 왕복 택배비가 발생합니다. (전자상거래 등에서의 소비자보호에 관한 법률 제18조(청약 철회 등) 9항에 의거 소비자의 사정에 의한 청약 철회 시 택배비 소비자 부담)</li>
													<li>상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.</li>
													<li>불량/오배송 상품의 경우 Q&A 게시판 또는 고객센터로 문의 부탁드립니다.</li>
													<li>교환/환불/기타 문의는 Q&A 게시판 또는 고객센터로 문의 부탁드립니다.</li>
												</ul>
												</div>
												
												<div>교환/반품이 불가한 경우</div>
												<ul>
													<li>단순 변심으로 인한 교환/반품 신청이 상품 수령한 날로부터 7일이 경과한 경우 (상품 불량 제외)</li>
													<li>상품 불량 및 부작용으로 인한 교환/반품 신청은 3개월 이내까지 가능합니다.</li>
													<li>소비자의 사용 또는 과실/부주의로 인하여 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장 훼손은 예외)</li>
													<li>구매한 상품의 구성품이 누락/분실된 경우(세트 상품, 사은품 등)</li>
													<li>기타,"전자상거래 등에서의 소비자 보호에 관한 법률"이 정하는 청약 철회 제한 사유에 해당되는 경우</li>
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
			</div>
		</div>
	</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- <script type= text/javascript> -->
</script>
<script src="/resources/main/js/pdetail.js"></script>
>>>>>>> 13d3bdc1294e1b055c2d20e7ba488f05e095df58
<%@include file="../../design/footer.jsp"%>