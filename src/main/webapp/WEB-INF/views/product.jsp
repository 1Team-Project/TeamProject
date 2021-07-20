<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
<style>
        a {
            text-decoration: none;
        }

        /* #titleArea {
            position: relative;
        } */

        /* PRODUCT */
        #titleArea h2 {
            padding: 0 40px 0;
            line-height: 43px;
            font-size: 30px;
            text-align: center;
           
        }
        #titleArea h2 a{
            color: #78c2ad;
        }

        /* Best Seller */
        #bestsellerArea h3 {
            text-align: center;
            padding: 40px 40px 0px;
        }

        /* .listproduct ul {
            margin: -14px 0 0;
            padding: 14px 0 30px;
            text-align: center;
        } */
        
        .listproduct {
            padding: 0;
            background-color: #fff;
        }

        .listproduct [class*="grid"] {
            display: table;
            table-layout: fixed;
            width: 100%;
            box-sizing: border-box;
            padding: 0 7px;
            font-size: 13px;
            line-height: 1.4;
        }

        /* .prdList grid3 {
            text-align: center;
        } */

        .listproduct .prdList grid3 > li {
            display: inline-block;
            width: 50%;
        }

        /*상품 - 상품명, 가격 왼쪽정렬*/
        .listproduct .description {
            margin: 0 7px;
            text-align: left;
        }

        /* .listproduct .description .name {
            word-wrap: break-word;
            margin: 0;
            padding-bottom: 3px;
        } */

        /*상품-리스트*/
        ul li {
            list-style: none;
            /* float: left; */
            display: inline-block;
        }

        /*리스트를 감싼 ul*/
        ul {
            text-align: center;
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }

        /*상품 썸네일*/
        .listproduct .thumbnail {
            position: relative;
            margin: 10px 10px 10px 10px;
        }

        /* 상품 썸네일 이미지 :: 이미지 크기 맞추기 필요 */
        .listproduct .thumbnail a img {
            position: absolute;
            display: block;
            width: 100%;
            height: 100%;
            margin-left: auto;
            margin-right: auto;
        }

        #row div {
            display: table;
            margin-left: auto;
            margin-right: auto;
        }

        /* .prolist {
            text-align: center;
        } */

        /* img {
            border: none;
        } */

         /* 상품 이미지 */
        .prdImg{
            display:block; 
            width:187px; 
            height:255px; 
            margin:0 auto 10px; 
            border:1px solid #ececec;
        }

        /* 구분선 */
        hr{ 
            border-top: 2px dotted #bbb;
        }

        /* 상품명 */
        .description .product_name .name a{
            font-size:14px;
            color:#222222;
        }
        span{
        	color:black;
        }
       #searchProduct{
            padding: 7px 7px;
            text-align: right;
            margin-right: 200px;
        }
       
        
</style>

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
                        <a href="product.html">PRODUCT</a>
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
                                <li id="boxid" class="prolist">
                                    <span>1st</span>
                                    <div class="thumbnail">
                                        <div class="prdImg">
                                            <a href="상품1상세페이지" name="boxname">
                                                <img src="img/루피.jpg" id="bestprod1" alt="상품1"></a>
                                        </div>
                                    </div>
                                    <div class="description">
                                        <div class="product_name">
                                            <strong class="name"><a href="상품1상세페이지" class="">
                                                <span>상품명 :</span>
                                                <span>상품1</span>
                                            </a></strong>
                                        </div>
                                        <div class="product_price">
                                            <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                            <span data-hook="product-item-price-to-pay" class="">$15</span>
                                        </div>
                                    </div>
                                </li>

                                <li id="boxid" class="prolist">
                                    <span>2nd</span>
                                    <div class="thumbnail">
                                        <div class="prdImg">
                                            <a href="상품2상세페이지" name="boxname">
                                                <img src="img/눈물루피.jpg" id="bestprod2" alt="상품2"></a>
                                        </div>
                                    </div>
                                    <div class="description">
                                        <div class="product_name">
                                            <strong class="name"><a href="상품2상세페이지" class="">
                                                <span>상품명 :</span>
                                                <span>상품2</span>
                                            </a></strong>
                                        </div>        
                                        <div class="product_price">
                                            <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                            <span data-hook="product-item-price-to-pay" class="">₩15</span>
                                        </div>
                                    </div>
                                </li>

                                <li id="boxid" class="prolist">
                                    <span>3rd</span>
                                    <div class="thumbnail">
                                        <div class="prdImg">
                                            <a href="상품3상세페이지" name="boxname">
                                                <img src="img/눈물콧물루피.jpg" id="bestprod3" alt="상품3"></a>
                                        </div>
                                    </div>
                                    <div class="description">
                                        <div class="product_name">
                                            <strong class="name"><a href="상품3상세페이지" class="">
                                                <span>상품명 :</span>
                                                <span>상품3</span>
                                            </a></strong>
                                        </div>
                                        <div class="product_price">
                                            <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                            <span data-hook="product-item-price-to-pay" class="">₩15</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!--상품 구분선-->
                    <hr>
                    
                    <!-- 상품 검색창 -->
                    <form action="" id="searchProduct">
					
                        <input type="text" name="keyword" id="keyword" placeholder="상품명 입력" required="" class="form-control">
                        <button type="button" class="btn btn-default">검색</button>
                    

						<input type="text" name="keyword" value="${CampusPageVO.cri.keyword}"/>
                        
                        <!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
                        <input type="hidden" name="pageNum" value="${CampusPageVO.cri.pageNum}"/>
                        <input type="hidden" name="amount" value="${CampusPageVO.cri.amount}"/>
                        
					
					</form>


                    <div id="center_sec">


                        <!-- 상품 -->
                        <div class="campus product allproduct">

                            <div class="campus product product-normallist listproduct">

                                <ul class="prdList grid3">

                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="상품1상세페이지" name="boxname">
                                                    <img src="img/루피.jpg" id="prod1" alt="상품1"></a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <div class="product_name">
                                                <strong class="name"><a href="상품1상세페이지" class="">
                                                        <span>상품명 :</span>
                                                        <span>상품1</span>
                                                </a></strong>
                                            </div>        
                                            <div class="product_price">
                                                <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                                <span data-hook="product-item-price-to-pay" class="">₩15</span>
                                            </div>
                                        </div>
                                    </li>

                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="상품2상세페이지" name="boxname">
                                                    <img src="img/눈물루피.jpg" id="prod2" alt="상품2"></a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <div class="product_name">
                                                <strong class="name"><a href="상품2상세페이지" class="">
                                                        <span>상품명 :</span>
                                                        <span>상품2</span>
                                                </a></strong>
                                            </div>        
                                            <div class="product_price">
                                                <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                                <span data-hook="product-item-price-to-pay" class="">₩15</span>
                                            </div>
                                        </div>
                                    </li>

                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="상품3상세페이지" name="boxname">
                                                    <img src="img/눈물루피.jpg" id="prod2" alt="상품3"></a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <div class="product_name">
                                                <strong class="name"><a href="상품3상세페이지" class="">
                                                        <span>상품명 :</span>
                                                        <span>상품3</span>
                                                </a></strong>
                                            </div>        
                                            <div class="product_price">
                                                <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                                <span data-hook="product-item-price-to-pay" class="">₩15</span>
                                            </div>
                                        </div>
                                    </li>

                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="상품4상세페이지" name="boxname">
                                                    <img src="img/눈물루피.jpg" id="prod2" alt="상품4"></a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <div class="product_name">
                                                <strong class="name"><a href="상품4상세페이지" class="">
                                                        <span>상품명 :</span>
                                                        <span>상품4</span>
                                                </a></strong>
                                            </div>        
                                            <div class="product_price">
                                                <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                                <span data-hook="product-item-price-to-pay" class="">₩15</span>
                                            </div>
                                        </div>
                                    </li>

                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="상품5상세페이지" name="boxname">
                                                    <img src="img/눈물루피.jpg" id="prod2" alt="상품5"></a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <div class="product_name">
                                                <strong class="name"><a href="상품5상세페이지" class="">
                                                        <span>상품명 :</span>
                                                        <span>상품5</span>
                                                </a></strong>
                                            </div>        
                                            <div class="product_price">
                                                <span class="price" data-hook="sr-product-item-price-to-pay">가격</span>
                                                <span data-hook="product-item-price-to-pay" class="">₩15</span>
                                            </div>
                                        </div>
                                    </li>
                                    <!--상품 반복 ~~ -->
                                </ul>
                            </div>
                        </div>



                        <!-- 하단 페이지 넘기기 부분-->
                        <div class="row" id="row">
                            <div class="col-md-12">
                                <ul class="mypagination justify-content-center">
                                    <li class="product-item"><a href="#" class="mypage-link"> << </a></li>
                                    <li class="product-item"><a href="#" class="mypage-link activecolor">1</a></li>
                                    <li class="product-item"><a href="#" class="mypage-link">2</a></li>
                                    <li class="product-item"><a href="#" class="mypage-link">3</a></li>
                                    <li class="product-item"><a href="#" class="mypage-link"> >> </a></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </div>


<%@include file="../design/footer.jsp" %>