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


                    
                    
                    <!-- 상품 검색창 -->
                         <form action="" id="searchProduct">
						<div class="row">
							<div class="col-md-12 mb-3">
							<select name="sort" id="" class="form-control width10 inlinetest boldergreen">
									<option value="">분류</option>
									<option value="상품명"<c:out value="${pageVO.cri.sort=='상품명'?'selected':''}"/>>상품명</option>
									<option value="제조사"<c:out value="${pageVO.cri.sort=='제조사'?'selected':''}"/>>제조사</option>
							</select> 
								<input type="text" name="keyword" class="width30 boldergreen padding5px blacktext">
								<input type="hidden" name="page" value="${pageVO.cri.page}"/>
								<button class="btn btn-primary searchbutton" id="searchBtn" type="submit">검색</button>
								
							</div>
						</div>

                        
					</form>


                    <div id="center_sec">

						
                        <!-- 상품 -->
                        <div class="campus product allproduct">

                            <div class="campus product product-normallist listproduct">

                                <ul class="prdList grid3">
									<c:forEach var="cate" items="${catelist}">
                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="${cate.b_no}" name="boxname" class="viewpro">
                                                    <img src="${cate.urllink}" id="prod1" alt="${cate.p_number}"></a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <div class="product_name">
                                                <strong class="name"><a href="${cate.p_number}" class="viewpro">
                                                        <span>상품명 :</span>
                                                        <span>${cate.p_name}</span>
                                                </a></strong>
                                            </div>        
                                            <div class="product_price">
                                                <span data-hook="product-item-price-to-pay" class="">${cate.p_price}</span>
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
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
		
</script>
<script src="/resources/main/js/catelist.js"></script>
<%@include file="../../design/footer.jsp" %>