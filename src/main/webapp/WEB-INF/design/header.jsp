<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  	<title>Website menu 07</title>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta name="description" content="">
	  <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
	<!-- 영권 추가 문장 시작 -->
	<link rel="stylesheet" href="/resources/main/css/bootstrap2.min.css">
	<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<sec:csrfMetaTags/>
	<!-- 영권 추가 문장 끝 -->
	</head>
	<!-- 폰트 설정하는 스타일 -->
	<style type="text/css">
		@FONT-FACE {
			font-family: 'naBrush';
			src:url("/resources/main/fonts/BMDOHYEON_ttf.ttf");
		}
/* 		    #footer {  */
/*        clear:both; */
/*        position:relative;  */
/*        width:100%;  */
/*        height:auto; } */
	
</style>
	<body>
	<section class="m-3">
		<!-- 맨 위 관련 (그림, 글씨) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- 클릭시 메인화면으로 이동하게 하는 링크 (텐트 그림) -->
				<a href="/" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">캠퍼스 Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- 아이콘 관련 -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- 각 아이콘 클릭시 이동되는 링크 (login , mypage , cart) -->
						
						
						
						<c:choose>
							<c:when test="${sessionScope.login != null}">
								<a href="#" id="logoutDo" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_login.png"></a>
			    			</c:when>
			    			<c:otherwise>
			    				<a href="/login" class="d-flex align-items-center justify-content-center m-1">
			    					<img src="/resources/main/images/icon_login.png">
			    				</a>
			    			</c:otherwise>
		    			</c:choose>
		    			
		    			
		    			<c:choose>
		    				<c:when test="${sessionScope.login != null}">
								<a href="/loginMypage" class="d-flex align-items-center justify-content-center m-1">
		    						<img src="/resources/main/images/icon_mypage.png"></a>
			    			</c:when>
			    			<c:otherwise>
		    					<a href="/login" class="d-flex align-items-center justify-content-center m-1">
		    						<img src="/resources/main/images/icon_mypage.png">
		    					</a>
		    				</c:otherwise>
		    			</c:choose>
		    			
							<sec:authorize access="isAuthenticated()">
								<a href="/cart?userid=" class="d-flex align-items-center justify-content-center m-1">
								<img src="/resources/main/images/icon_login.png"></a>
			    			</sec:authorize>
			    			<sec:authorize access="isAnonymous()">
			    				<a href="/login" class="d-flex align-items-center justify-content-center m-1">
			    					<img src="/resources/main/images/icon_login.png">
			    				</a>
			    			</sec:authorize>
		    		</p>
	      		</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-primary" >
	    <div class="container-fluid">
	    
		<!-- 카테고리 관련 -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- 카테고리(상품 정보)에 마우스 올리지 않고, 클릭할 때 갈 링크 설정하는 a태그 -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">캠핑 상품</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- 각 카테고리별 이동하는 링크 -->
              	<a class="dropdown-item product-item" href="/product/productlist">전체 상품</a>
              		<c:forEach var="cate" items="${category}">
	           			<a class="dropdown-item clickview" href="${cate.pc_code}">${cate.pc_name} </a>
             		 </c:forEach>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- 카테고리(상품 정보)에 마우스 올리지 않고, 클릭할 때 갈 링크 설정하는 a태그 -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">캠핑장 정보</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- 각 카테고리별 이동하는 링크 -->
					<a class="dropdown-item" href="#">캠핑장 목록</a>
				</div>
				   </li>

				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- 카테고리(상품 정보)에 마우스 올리지 않고, 클릭할 때 갈 링크 설정하는 a태그 -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- 각 카테고리별 이동하는 링크 -->
					<a class="dropdown-item" href="/board/list">통합 게시판</a>
				</div>
				   </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

	</section>
 	<form action="/loginMypage" id="mypageForm" method="post">
<input type="hidden" name="u_userid"  value="${login.u_userid}"/>
<input type="hidden" name="u_password"  value="${login.u_password}"/>


</form>
	
	<!-- 한중 폼 -->
<!-- 		<form action="" method="get" id="actionForm"> -->
<%-- 			<input type="hidden" name="sort" value="${CampusPageVO.cri.sort}" /> --%>
<%-- 			<input type="hidden" name="keyword"value="${CampusPageVO.cri.keyword}" />  --%>
<%-- 			<input type="hidden" name="page" value="${CampusPageVO.cri.page}" /> --%>
<!-- 		</form> -->
		
		<form action="" method="get" id="goForm">
			<input type="hidden" name="sort" value="${CampusProductPageVO.cri.sort}" />
			<input type="hidden" name="page" value="1" />
		</form>
		
		<form action="" method="get" id="productForm">
			<input type="hidden" name="sort" value="${CampusProductPageVO.cri.sort}" />
			<input type="hidden" name="keyword"value="${CampusProductPageVO.cri.keyword}" /> 
			<input type="hidden" name="page" value="1" />
		</form>  


	
	<script>
		let result='${result}';
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 	<script src="/resources/main/js/popper.js"></script>
  	<script src="/resources/main/js/bootstrap.min.js"></script>
 	<script src="/resources/main/js/main.js"></script>
 	<!-- 영권 추가 문장 시작 -->
 	<script src="/resources/main/js/header_yk.js"></script>
 	<!-- 영권 추가 문장 끝 -->