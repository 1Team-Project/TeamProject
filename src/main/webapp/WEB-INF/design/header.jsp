<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<!-- øµ±« √ﬂ∞° πÆ¿Â Ω√¿€ -->
	<link rel="stylesheet" href="/resources/main/css/bootstrap2.min.css">
	<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<!-- øµ±« √ﬂ∞° πÆ¿Â ≥° -->
	</head>
	<!-- ∆˘∆Æ º≥¡§«œ¥¬ Ω∫≈∏¿œ -->
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
	/* 1.«œ¥‹¡§∫∏ */
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
 
	/* 2.¡÷º“ π◊ ªÁ¿Ã∆Æ∏µ≈© */
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
		<!-- ∏« ¿ß ∞¸∑√ (±◊∏≤, ±€ææ) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- ≈¨∏ØΩ√ ∏ﬁ¿Œ»≠∏È¿∏∑Œ ¿Ãµø«œ∞‘ «œ¥¬ ∏µ≈© (≈Ÿ∆Æ ±◊∏≤) -->
				<a href="/" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">ƒ∑∆€Ω∫ Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- æ∆¿Ãƒ‹ ∞¸∑√ -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- ∞¢ æ∆¿Ãƒ‹ ≈¨∏ØΩ√ ¿Ãµøµ«¥¬ ∏µ≈© (login , mypage , cart) -->
						
						
						
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
		    			
		    			
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_cart.png"></a>
		    		</p>
	      		</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-primary" >
	    <div class="container-fluid">
	    
		<!-- ƒ´≈◊∞Ì∏Æ ∞¸∑√ -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ªÛ«∞ ¡§∫∏</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
              	<a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ1</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ2</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ3</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ƒ∑«Œ¿Â ¡§∫∏</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
					<a class="dropdown-item" href="#">ƒ∑«Œ¿Â ∏Ò∑œ</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">∞‘Ω√∆«</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
					<a class="dropdown-item" href="/board/list">≈Î«’ ∞‘Ω√∆«</a>
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
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 	<script src="/resources/main/js/popper.js"></script>
  	<script src="/resources/main/js/bootstrap.min.js"></script>
 	<script src="/resources/main/js/main.js"></script>
 	<!-- øµ±« √ﬂ∞° πÆ¿Â Ω√¿€ -->
 	<script src="/resources/main/js/header_yk.js"></script>
 	<!-- øµ±« √ﬂ∞° πÆ¿Â ≥° -->
=======
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
	<script src="/resources/main/js/jquery.min.js"></script>
 	<script src="/resources/main/js/popper.js"></script>
  	<script src="/resources/main/js/bootstrap.min.js"></script>
 	<script src="/resources/main/js/main.js"></script>
	</head>
	<style type="text/css">
		@FONT-FACE {
			font-family: 'naBrush';
			src:url("resources/main/fonts/BMDOHYEON_ttf.ttf");
		}
		    #footer { 
       clear:both;
       position:relative; 
       width:100%; 
       height:auto; }
	
	/* 1.ÔøΩœ¥ÔøΩÔøΩÔøΩÔøΩÔøΩ */
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
 
	/* 2.ÔøΩ÷ºÔøΩ ÔøΩÔøΩ ÔøΩÔøΩÔøΩÔøΩ∆ÆÔøΩÔøΩ≈© */
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
		<!-- ÔøΩÔøΩ ÔøΩÔøΩ ÔøΩÔøΩÔøΩÔøΩ (ÔøΩ◊∏ÔøΩ, ÔøΩ€æÔøΩ) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- ≈¨ÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩÔøΩÔøΩ»≠ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ ÔøΩÃµÔøΩÔøΩœ∞ÔøΩ ÔøΩœ¥ÔøΩ ÔøΩÔøΩ≈© (ÔøΩÔøΩ∆Æ ÔøΩ◊∏ÔøΩ) -->
				<a href="" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">ƒ∑ÔøΩ€ΩÔøΩ Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩÔøΩÔøΩ -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- ÔøΩÔøΩ ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ ≈¨ÔøΩÔøΩÔøΩÔøΩ ÔøΩÃµÔøΩÔøΩ«¥ÔøΩ ÔøΩÔøΩ≈© (login , mypage , cart) -->
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_login.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_mypage.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_cart.png"></a>
		    		</p>
	      		</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-primary" >
	    <div class="container-fluid">
	    
		<!-- ƒ´ÔøΩ◊∞ÔøΩ ÔøΩÔøΩÔøΩÔøΩ -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- ƒ´ÔøΩ◊∞ÔøΩ(ÔøΩÔøΩ«∞ ÔøΩÔøΩÔøΩÔøΩ)ÔøΩÔøΩ ÔøΩÔøΩÔøΩÏΩ∫ ÔøΩ√∏ÔøΩÔøΩÔøΩ ÔøΩ ∞ÔøΩ, ≈¨ÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩ ÔøΩÔøΩ ÔøΩÔøΩ≈© ÔøΩÔøΩÔøΩÔøΩÔøΩœ¥ÔøΩ aÔøΩ¬±ÔøΩ -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ÔøΩÔøΩ«∞ ÔøΩÔøΩÔøΩÔøΩ</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- ÔøΩÔøΩ ƒ´ÔøΩ◊∞ÔøΩÔøΩÔøΩ ÔøΩÃµÔøΩÔøΩœ¥ÔøΩ ÔøΩÔøΩ≈© -->
              	<a class="dropdown-item" href="#">ƒ´ÔøΩ◊∞ÔøΩ1</a>
                <a class="dropdown-item" href="#">ƒ´ÔøΩ◊∞ÔøΩ2</a>
                <a class="dropdown-item" href="#">ƒ´ÔøΩ◊∞ÔøΩ3</a>
                <a class="dropdown-item" href="#">ƒ´ÔøΩ◊∞ÔøΩ4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´ÔøΩ◊∞ÔøΩ(ÔøΩÔøΩ«∞ ÔøΩÔøΩÔøΩÔøΩ)ÔøΩÔøΩ ÔøΩÔøΩÔøΩÏΩ∫ ÔøΩ√∏ÔøΩÔøΩÔøΩ ÔøΩ ∞ÔøΩ, ≈¨ÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩ ÔøΩÔøΩ ÔøΩÔøΩ≈© ÔøΩÔøΩÔøΩÔøΩÔøΩœ¥ÔøΩ aÔøΩ¬±ÔøΩ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ƒ∑ÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩÔøΩÔøΩ</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- ÔøΩÔøΩ ƒ´ÔøΩ◊∞ÔøΩÔøΩÔøΩ ÔøΩÃµÔøΩÔøΩœ¥ÔøΩ ÔøΩÔøΩ≈© -->
					<a class="dropdown-item" href="#">ƒ∑ÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩÔøΩ</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´ÔøΩ◊∞ÔøΩ(ÔøΩÔøΩ«∞ ÔøΩÔøΩÔøΩÔøΩ)ÔøΩÔøΩ ÔøΩÔøΩÔøΩÏΩ∫ ÔøΩ√∏ÔøΩÔøΩÔøΩ ÔøΩ ∞ÔøΩ, ≈¨ÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩ ÔøΩÔøΩ ÔøΩÔøΩ≈© ÔøΩÔøΩÔøΩÔøΩÔøΩœ¥ÔøΩ aÔøΩ¬±ÔøΩ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ÔøΩ‘ΩÔøΩÔøΩÔøΩ</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- ÔøΩÔøΩ ƒ´ÔøΩ◊∞ÔøΩÔøΩÔøΩ ÔøΩÃµÔøΩÔøΩœ¥ÔøΩ ÔøΩÔøΩ≈© -->
					<a class="dropdown-item" href="#">ÔøΩÔøΩÔøΩÔøΩ ÔøΩ‘ΩÔøΩÔøΩÔøΩ</a>
				</div>
				   </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

	</section>
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
	</head>
	<!-- Ìè∞Ìä∏ ÏÑ§Ï†ïÌïòÎäî Ïä§ÌÉÄÏùº -->
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
	/* 1.ÌïòÎã®Ï†ïÎ≥¥ */
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
 
	/* 2.Ï£ºÏÜå Î∞è ÏÇ¨Ïù¥Ìä∏ÎßÅÌÅ¨ */
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
		<!-- Îß® ÏúÑ Í¥ÄÎ†® (Í∑∏Î¶º, Í∏ÄÏî®) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- ÌÅ¥Î¶≠Ïãú Î©îÏù∏ÌôîÎ©¥ÏúºÎ°ú Ïù¥ÎèôÌïòÍ≤å ÌïòÎäî ÎßÅÌÅ¨ (ÌÖêÌä∏ Í∑∏Î¶º) -->
				<a href="" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">Ï∫†ÌçºÏä§ Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- ÏïÑÏù¥ÏΩò Í¥ÄÎ†® -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- Í∞Å ÏïÑÏù¥ÏΩò ÌÅ¥Î¶≠Ïãú Ïù¥ÎèôÎêòÎäî ÎßÅÌÅ¨ (login , mypage , cart) -->
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_login.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_mypage.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_cart.png"></a>
		    		</p>
	      		</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-primary" >
	    <div class="container-fluid">
	    
		<!-- Ïπ¥ÌÖåÍ≥†Î¶¨ Í¥ÄÎ†® -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- Ïπ¥ÌÖåÍ≥†Î¶¨(ÏÉÅÌíà Ï†ïÎ≥¥)Ïóê ÎßàÏö∞Ïä§ Ïò¨Î¶¨ÏßÄ ÏïäÍ≥†, ÌÅ¥Î¶≠Ìï† Îïå Í∞à ÎßÅÌÅ¨ ÏÑ§Ï†ïÌïòÎäî aÌÉúÍ∑∏ -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ÏÉÅÌíà Ï†ïÎ≥¥</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- Í∞Å Ïπ¥ÌÖåÍ≥†Î¶¨Î≥Ñ Ïù¥ÎèôÌïòÎäî ÎßÅÌÅ¨ -->
              	<a class="dropdown-item" href="#">Ïπ¥ÌÖåÍ≥†Î¶¨1</a>
                <a class="dropdown-item" href="#">Ïπ¥ÌÖåÍ≥†Î¶¨2</a>
                <a class="dropdown-item" href="#">Ïπ¥ÌÖåÍ≥†Î¶¨3</a>
                <a class="dropdown-item" href="#">Ïπ¥ÌÖåÍ≥†Î¶¨4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- Ïπ¥ÌÖåÍ≥†Î¶¨(ÏÉÅÌíà Ï†ïÎ≥¥)Ïóê ÎßàÏö∞Ïä§ Ïò¨Î¶¨ÏßÄ ÏïäÍ≥†, ÌÅ¥Î¶≠Ìï† Îïå Í∞à ÎßÅÌÅ¨ ÏÑ§Ï†ïÌïòÎäî aÌÉúÍ∑∏ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ï∫†ÌïëÏû• Ï†ïÎ≥¥</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- Í∞Å Ïπ¥ÌÖåÍ≥†Î¶¨Î≥Ñ Ïù¥ÎèôÌïòÎäî ÎßÅÌÅ¨ -->
					<a class="dropdown-item" href="#">Ï∫†ÌïëÏû• Î™©Î°ù</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- Ïπ¥ÌÖåÍ≥†Î¶¨(ÏÉÅÌíà Ï†ïÎ≥¥)Ïóê ÎßàÏö∞Ïä§ Ïò¨Î¶¨ÏßÄ ÏïäÍ≥†, ÌÅ¥Î¶≠Ìï† Îïå Í∞à ÎßÅÌÅ¨ ÏÑ§Ï†ïÌïòÎäî aÌÉúÍ∑∏ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Í≤åÏãúÌåê</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- Í∞Å Ïπ¥ÌÖåÍ≥†Î¶¨Î≥Ñ Ïù¥ÎèôÌïòÎäî ÎßÅÌÅ¨ -->
					<a class="dropdown-item" href="#">ÌÜµÌï© Í≤åÏãúÌåê</a>
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
 	<script src="/resources/main/js/main.js"></script>

>>>>>>> refs/remotes/origin/seunghyun
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 	<script src="/resources/main/js/popper.js"></script>
  	<script src="/resources/main/js/bootstrap.min.js"></script>
 	<script src="/resources/main/js/main.js"></script> 
	</head>
	<!-- ∆˘∆Æ º≥¡§«œ¥¬ Ω∫≈∏¿œ -->
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
	/* 1.«œ¥‹¡§∫∏ */
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
 
	/* 2.¡÷º“ π◊ ªÁ¿Ã∆Æ∏µ≈© */
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
		<!-- ∏« ¿ß ∞¸∑√ (±◊∏≤, ±€ææ) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- ≈¨∏ØΩ√ ∏ﬁ¿Œ»≠∏È¿∏∑Œ ¿Ãµø«œ∞‘ «œ¥¬ ∏µ≈© (≈Ÿ∆Æ ±◊∏≤) -->
				<a href="" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">ƒ∑∆€Ω∫ Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- æ∆¿Ãƒ‹ ∞¸∑√ -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- ∞¢ æ∆¿Ãƒ‹ ≈¨∏ØΩ√ ¿Ãµøµ«¥¬ ∏µ≈© (login , mypage , cart) -->
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_login.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_mypage.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_cart.png"></a>
		    		</p>
	      		</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-primary" >
	    <div class="container-fluid">
	    
		<!-- ƒ´≈◊∞Ì∏Æ ∞¸∑√ -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ªÛ«∞ ¡§∫∏</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
              	<a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ1</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ2</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ3</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ƒ∑«Œ¿Â ¡§∫∏</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
					<a class="dropdown-item" href="#">ƒ∑«Œ¿Â ∏Ò∑œ</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">∞‘Ω√∆«</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
					<a class="dropdown-item" href="#">≈Î«’ ∞‘Ω√∆«</a>
				</div>
				   </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

	</section>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 	<script src="/resources/main/js/popper.js"></script>
  	<script src="/resources/main/js/bootstrap.min.js"></script>
 	<script src="/resources/main/js/main.js"></script> 
	</head>
	<!-- ∆˘∆Æ º≥¡§«œ¥¬ Ω∫≈∏¿œ -->
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
	/* 1.«œ¥‹¡§∫∏ */
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
 
	/* 2.¡÷º“ π◊ ªÁ¿Ã∆Æ∏µ≈© */
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
		<!-- ∏« ¿ß ∞¸∑√ (±◊∏≤, ±€ææ) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- ≈¨∏ØΩ√ ∏ﬁ¿Œ»≠∏È¿∏∑Œ ¿Ãµø«œ∞‘ «œ¥¬ ∏µ≈© (≈Ÿ∆Æ ±◊∏≤) -->
				<a href="" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">ƒ∑∆€Ω∫ Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- æ∆¿Ãƒ‹ ∞¸∑√ -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- ∞¢ æ∆¿Ãƒ‹ ≈¨∏ØΩ√ ¿Ãµøµ«¥¬ ∏µ≈© (login , mypage , cart) -->
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_login.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_mypage.png"></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center m-1"><img src="/resources/main/images/icon_cart.png"></a>
		    		</p>
	      		</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-primary" >
	    <div class="container-fluid">
	    
		<!-- ƒ´≈◊∞Ì∏Æ ∞¸∑√ -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ªÛ«∞ ¡§∫∏</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
              	<a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ1</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ2</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ3</a>
                <a class="dropdown-item" href="#">ƒ´≈◊∞Ì∏Æ4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ƒ∑«Œ¿Â ¡§∫∏</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
					<a class="dropdown-item" href="#">ƒ∑«Œ¿Â ∏Ò∑œ</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ƒ´≈◊∞Ì∏Æ(ªÛ«∞ ¡§∫∏)ø° ∏∂øÏΩ∫ ø√∏Æ¡ˆ æ ∞Ì, ≈¨∏Ø«“ ∂ß ∞• ∏µ≈© º≥¡§«œ¥¬ a≈¬±◊ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">∞‘Ω√∆«</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- ∞¢ ƒ´≈◊∞Ì∏Æ∫∞ ¿Ãµø«œ¥¬ ∏µ≈© -->
					<a class="dropdown-item" href="#">≈Î«’ ∞‘Ω√∆«</a>
				</div>
				   </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

	</section>
>>>>>>> 5f4d2aa1567ee8a1fc2e12b9ea019d9483c690ca
>>>>>>> refs/remotes/origin/inhwan
