<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp" %>
<link rel="stylesheet" href="/resources/main/css/product.css">


    <div id="wrap">
        <div id="container">
            <div id="contents_main">
                <!--카테고리,,,뭐지,,,,-->
                <!-- <div class="xans-element- xans-product xans-product-menupackage ">
                    <div class="xans-element- xans-product xans-product-headcategory banner ">
                        <p>
                        
                        </p>
                    </div>
                </div> -->

                <!-- 중앙영역 시작 -->
                <div id="titleArea" class="campus product headcategory ">
                    <h2>
                        <a href="/product/product">PRODUCT</a>
                    </h2>


                    <!--best 상품 영역-->

                    <div id="bestsellerArea" class="">
                        <h3>Best Seller</h3>
                    </div>

                    <!-- 이름바꾸기,,,ing~ -->
                    <div id="campus product bestproduct">
                        <div class="campus product product-bestlist listproduct">
                            <ul class="prdList grid3">

                                <!--@@@list id에 추후 db적용@@@-->
                                <c:forEach var="best" items="${bestList}" >
                                <li id="boxid" class="prolist">
                                    <span>${best.rank}</span>
                                    <div class="thumbnail">
                                        <div class="prdImg">
                                            <a href="${best.p_number}" name="boxname" class="viewpro">
                                                <img src="${top.urllink}" id="bestprod1" alt="상품1"></a>
                                        </div>
                                    </div>
                                    <div class="description">
                                        <div class="product_name">
                                            <strong class="name"><a href="${best.p_number}" class="viewpro">
                                                <span>상품명 :</span>
                                                <span>${best.p_name}</span>
                                            </a></strong>
                                        </div>
                                        <div class="product_price">
                                            <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                            <span data-hook="product-item-price-to-pay" class="">${best.p_price}</span>
                                        </div>
                                    </div>
                                </li>
								</c:forEach>
								
                               
                            </ul>
                        </div>
                    </div>

                    <!--상품 구분선-->
                    <hr>
                    
                    <!-- 상품 검색창 -->
                    <form action="search" id="searchProduct">
						<div class="row">
							<div class="col-md-12 mb-3">
								<input type="text" name="keyword" class="width30 boldergreen padding5px blacktext">
								<button class="btn btn-primary" id="searchBtn">검색</button>
								
							</div>
						</div>

						 <!--<input type="text" name="keyword" value="${CampusPageVO.cri.keyword}"/>
                        
                        검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
                        <input type="hidden" name="pageNum" value="${CampusPageVO.cri.pageNum}"/>
                        <input type="hidden" name="amount" value="${CampusPageVO.cri.amount}"/>
                        
					
					</form>


                    <div id="center_sec">

						
                        <!-- 상품 -->
                        <div class="campus product allproduct">

                            <div class="campus product product-normallist listproduct">

                                <ul class="prdList grid3">
									<c:forEach var="pro" items="${prolist}">
                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="${top.b_no}" name="boxname" class="viewpro">
                                                    <img src="${top.urllink}" id="prod1" alt="상품1"></a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <div class="product_name">
                                                <strong class="name"><a href="${product.p_number}" class="viewpro">
                                                        <span>상품명 :</span>
                                                        <span>${product.p_name}</span>
                                                </a></strong>
                                            </div>        
                                            <div class="product_price">
                                                <span data-hook="product-item-price-to-pay" class="">${product.p_price}</span>
                                                <span class="price" data-hook="sr-product-item-price-to-pay"> 원</span>
                                            </div>
                                        </div>
                                    </li>
									</c:forEach>
									
                                    <!--상품 반복 ~~ -->
                                     
                                </ul>
                            </div>
                        </div>



                        <!-- 하단 페이지 넘기기 부분-->
                        <div class="row" id="row">
                            <div class="col-md-12">
                                <ul class="mypagination justify-content-center">
                                   <c:if test="${CampusPageVO.prev}">
										<li class="mypage-item prev"><a href="${CampusPageVO.startPage-1}" class="mypage-link"> << </a></li>
									</c:if>	
									
									<c:forEach var="i" begin="${CampusPageVO.startPage}" end="${CampusPageVO.endPage}">
										<li class="mypage-item"><a href="${i}" class="mypage-link ${CampusPageVO.cri.page==i?'activecolor':''}">${i}</a></li>
									</c:forEach>
									
									<c:if test="${CampusPageVO.next}">
										<li class="mypage-item next"><a href="${CampusPageVO.endPage+1}" class="mypage-link"> >> </a></li>
									</c:if>	
                                </ul>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
		<form action="list" method="get" id="actionForm">	
		<input type="hidden" name="sort" value="${CampusPageVO.cri.sort}" />
		<input type="hidden" name="keyword" value="${CampusPageVO.cri.keyword}" />
		<input type="hidden" name="page" value="${CampusPageVO.cri.page}" />
		
	</form>
        </div>

<script>
	let result='${result}';
</script>
<script src="/resources/main/js/productlist.js"></script>
<%@include file="../../design/footer.jsp" %>