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
<<<<<<< HEAD
	<!-- ���� �߰� ���� ���� -->
	<link rel="stylesheet" href="/resources/main/css/bootstrap2.min.css">
	<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<!-- ���� �߰� ���� �� -->
=======
>>>>>>> branch 'master' of https://github.com/1Team-Project/TeamProject.git
	</head>
	<!-- 폰트 설정하는 스타일 -->
	<style type="text/css">
		@FONT-FACE {
			font-family: 'naBrush';
			src:url("/resources/main/fonts/BMDOHYEON_ttf.ttf");
		}
		    #footer { 
       clear:both;
       position:relative; 
       width:100%; 
       height:auto; }
	/* 1.하단정보 */
    .campus{
      color: white;
    }
    .hoverbold:hover{
      font-weight: bold;
    }
		.optr_link{
      display:none;
      }
		.f_info {
      position:relative;
      width:100%;
      float:left; 
      background:#78c2ad; 
      border-bottom: 1px solid; 
      min-height:90px; 
      z-index:10; 
      }
		.f_info .f_png{
      position:absolute; 
      left:0; 
      width:209px; 
      height:42px; 
      }
		.f_menu {
      padding:35px 0 12px 220px; 
      }
		.f_menu li { 
      display:inline-block; 
    }		
		.f_menu li:first-child{
      background:none;
      }
		.f_menu li a {
       display:inline-block; 
       font-size:15px; 
       color:white; 
       text-decoration:none;
       } 
		.f_menu li.privacy a{
      color:white !important;
      }
		.f_info .f_sns{
      position:absolute; 
      right:0; 
      top:36px;
      list-style: none;
      }
		.f_info .f_sns li{
      float:left; 
      height:21px; 
      text-decoration: none;
      }
		.f_info .f_sns li a{
      font-size:0; 
      line-height:0; 
      float:left;
      }
		.f_info .f_sns li.sns1 a{
      width:22px; 
      height:21px; 
      }
		.f_info .f_sns li.sns2 a{
      width:10px; 
      height:21px; 
      }
		.f_info .f_sns li.sns3 a{
      width:13px; 
      height:21px; 
    }
 
	/* 2.주소 및 사이트링크 */
		.f_link{
      position:relative; 
      width:100%; 
      float:left; 
      background:#78c2ad;  
      padding:30px 0;      
      }
		.f_addr{
      font-size:13px; 
      line-height:22px; 
      color:white; 
      text-align: center;
      }
		.f_addr .f_mail{
      font-size:13px; 
      line-height:22px; 
      color:white !important; 
      text-decoration:none; 
      letter-spacing:0;}
		.f_addr div{
      display:inline-block;
      }
		.copyright{
      clear:both; 
      letter-spacing:0px;
      }
		
	</style>
	<body>
	<section class="m-3">
		<!-- 맨 위 관련 (그림, 글씨) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
<<<<<<< HEAD
				<!-- Ŭ���� ����ȭ������ �̵��ϰ� �ϴ� ��ũ (��Ʈ �׸�) -->
				<a href="/" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
=======
				<!-- 클릭시 메인화면으로 이동하게 하는 링크 (텐트 그림) -->
				<a href="" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
>>>>>>> branch 'master' of https://github.com/1Team-Project/TeamProject.git
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
<<<<<<< HEAD
						<!-- �� ������ Ŭ���� �̵��Ǵ� ��ũ (login , mypage , cart) -->
						
						
						
						<c:choose>
							<c:when test="${sessionScope.login != null}">
								<a href="#" id="logoutDo" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_login.png"></a>
			    			</c:when>
			    			<c:otherwise>
			    				<a href="login" class="d-flex align-items-center justify-content-center m-1">
			    					<img src="/resources/main/images/icon_login.png">
			    				</a>
			    			</c:otherwise>
		    			</c:choose>
		    			
		    			
		    			
=======
						<!-- 각 아이콘 클릭시 이동되는 링크 (login , mypage , cart) -->
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_login.png"></a>
>>>>>>> branch 'master' of https://github.com/1Team-Project/TeamProject.git
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_mypage.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_cart.png"></a>
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
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">상품 정보</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- 각 카테고리별 이동하는 링크 -->
              	<a class="dropdown-item" href="#">카테고리1</a>
                <a class="dropdown-item" href="#">카테고리2</a>
                <a class="dropdown-item" href="#">카테고리3</a>
                <a class="dropdown-item" href="#">카테고리4</a>
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
					<a class="dropdown-item" href="#">통합 게시판</a>
				</div>
				   </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

	</section>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 	<script src="/resources/main/js/popper.js"></script>
  	<script src="/resources/main/js/bootstrap.min.js"></script>
<<<<<<< HEAD
 	<script src="/resources/main/js/main.js"></script>
 	<!-- ���� �߰� ���� ���� -->
  	<script>
 		$(function() {
 			$("#logoutDo").click(function(){
 				var logout = confirm("�α׾ƿ� �Ͻðڽ��ϱ�?");
				if(logout==true){
					alert("�ȳ���������")
					location.href="/logout";
				} else {
					alert("�α����� �����˴ϴ�.")
					return false;
				}
 			});
 		}) 
 	</script>
	<!-- ���� �߰� ���� �� -->
=======
 	<script src="/resources/main/js/main.js"></script>
>>>>>>> branch 'master' of https://github.com/1Team-Project/TeamProject.git
