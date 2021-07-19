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
	<!-- ¿µ±Ç Ãß°¡ ¹®Àå ½ÃÀÛ -->
	<link rel="stylesheet" href="/resources/main/css/bootstrap2.min.css">
	<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<!-- ¿µ±Ç Ãß°¡ ¹®Àå ³¡ -->
	</head>
	<!-- ÆùÆ® ¼³Á¤ÇÏ´Â ½ºÅ¸ÀÏ -->
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
	/* 1.ÇÏ´ÜÁ¤º¸ */
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
 
	/* 2.ÁÖ¼Ò ¹× »çÀÌÆ®¸µÅ© */
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
		<!-- ¸Ç À§ °ü·Ã (±×¸², ±Û¾¾) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- Å¬¸¯½Ã ¸ŞÀÎÈ­¸éÀ¸·Î ÀÌµ¿ÇÏ°Ô ÇÏ´Â ¸µÅ© (ÅÙÆ® ±×¸²) -->
				<a href="/" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">Ä·ÆÛ½º Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- ¾ÆÀÌÄÜ °ü·Ã -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- °¢ ¾ÆÀÌÄÜ Å¬¸¯½Ã ÀÌµ¿µÇ´Â ¸µÅ© (login , mypage , cart) -->
						
						
						
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
	    
		<!-- Ä«Å×°í¸® °ü·Ã -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- Ä«Å×°í¸®(»óÇ° Á¤º¸)¿¡ ¸¶¿ì½º ¿Ã¸®Áö ¾Ê°í, Å¬¸¯ÇÒ ¶§ °¥ ¸µÅ© ¼³Á¤ÇÏ´Â aÅÂ±× -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">»óÇ° Á¤º¸</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- °¢ Ä«Å×°í¸®º° ÀÌµ¿ÇÏ´Â ¸µÅ© -->
              	<a class="dropdown-item" href="#">Ä«Å×°í¸®1</a>
                <a class="dropdown-item" href="#">Ä«Å×°í¸®2</a>
                <a class="dropdown-item" href="#">Ä«Å×°í¸®3</a>
                <a class="dropdown-item" href="#">Ä«Å×°í¸®4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- Ä«Å×°í¸®(»óÇ° Á¤º¸)¿¡ ¸¶¿ì½º ¿Ã¸®Áö ¾Ê°í, Å¬¸¯ÇÒ ¶§ °¥ ¸µÅ© ¼³Á¤ÇÏ´Â aÅÂ±× -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ä·ÇÎÀå Á¤º¸</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- °¢ Ä«Å×°í¸®º° ÀÌµ¿ÇÏ´Â ¸µÅ© -->
					<a class="dropdown-item" href="#">Ä·ÇÎÀå ¸ñ·Ï</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- Ä«Å×°í¸®(»óÇ° Á¤º¸)¿¡ ¸¶¿ì½º ¿Ã¸®Áö ¾Ê°í, Å¬¸¯ÇÒ ¶§ °¥ ¸µÅ© ¼³Á¤ÇÏ´Â aÅÂ±× -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">°Ô½ÃÆÇ</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- °¢ Ä«Å×°í¸®º° ÀÌµ¿ÇÏ´Â ¸µÅ© -->
					<a class="dropdown-item" href="/board/list">ÅëÇÕ °Ô½ÃÆÇ</a>
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
 	<!-- ¿µ±Ç Ãß°¡ ¹®Àå ½ÃÀÛ -->
 	<script src="/resources/main/js/header_yk.js"></script>
 	<!-- ¿µ±Ç Ãß°¡ ¹®Àå ³¡ -->
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
	
	/* 1.ï¿½Ï´ï¿½ï¿½ï¿½ï¿½ï¿½ */
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
 
	/* 2.ï¿½Ö¼ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®ï¿½ï¿½Å© */
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
		<!-- ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ (ï¿½×¸ï¿½, ï¿½Û¾ï¿½) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- Å¬ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½È­ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½ï¿½Ï°ï¿½ ï¿½Ï´ï¿½ ï¿½ï¿½Å© (ï¿½ï¿½Æ® ï¿½×¸ï¿½) -->
				<a href="" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">Ä·ï¿½Û½ï¿½ Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ Å¬ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½ï¿½Ç´ï¿½ ï¿½ï¿½Å© (login , mypage , cart) -->
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
	    
		<!-- Ä«ï¿½×°ï¿½ ï¿½ï¿½ï¿½ï¿½ -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- Ä«ï¿½×°ï¿½(ï¿½ï¿½Ç° ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ ï¿½ï¿½ï¿½ì½º ï¿½Ã¸ï¿½ï¿½ï¿½ ï¿½Ê°ï¿½, Å¬ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½Å© ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ aï¿½Â±ï¿½ -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ï¿½ï¿½Ç° ï¿½ï¿½ï¿½ï¿½</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- ï¿½ï¿½ Ä«ï¿½×°ï¿½ï¿½ï¿½ ï¿½Ìµï¿½ï¿½Ï´ï¿½ ï¿½ï¿½Å© -->
              	<a class="dropdown-item" href="#">Ä«ï¿½×°ï¿½1</a>
                <a class="dropdown-item" href="#">Ä«ï¿½×°ï¿½2</a>
                <a class="dropdown-item" href="#">Ä«ï¿½×°ï¿½3</a>
                <a class="dropdown-item" href="#">Ä«ï¿½×°ï¿½4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- Ä«ï¿½×°ï¿½(ï¿½ï¿½Ç° ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ ï¿½ï¿½ï¿½ì½º ï¿½Ã¸ï¿½ï¿½ï¿½ ï¿½Ê°ï¿½, Å¬ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½Å© ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ aï¿½Â±ï¿½ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ä·ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- ï¿½ï¿½ Ä«ï¿½×°ï¿½ï¿½ï¿½ ï¿½Ìµï¿½ï¿½Ï´ï¿½ ï¿½ï¿½Å© -->
					<a class="dropdown-item" href="#">Ä·ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- Ä«ï¿½×°ï¿½(ï¿½ï¿½Ç° ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ ï¿½ï¿½ï¿½ì½º ï¿½Ã¸ï¿½ï¿½ï¿½ ï¿½Ê°ï¿½, Å¬ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½Å© ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ aï¿½Â±ï¿½ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ï¿½Ô½ï¿½ï¿½ï¿½</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- ï¿½ï¿½ Ä«ï¿½×°ï¿½ï¿½ï¿½ ï¿½Ìµï¿½ï¿½Ï´ï¿½ ï¿½ï¿½Å© -->
					<a class="dropdown-item" href="#">ï¿½ï¿½ï¿½ï¿½ ï¿½Ô½ï¿½ï¿½ï¿½</a>
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
	<!-- í°íŠ¸ ì„¤ì •í•˜ëŠ” ìŠ¤íƒ€ì¼ -->
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
	/* 1.í•˜ë‹¨ì •ë³´ */
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
 
	/* 2.ì£¼ì†Œ ë° ì‚¬ì´íŠ¸ë§í¬ */
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
		<!-- ë§¨ ìœ„ ê´€ë ¨ (ê·¸ë¦¼, ê¸€ì”¨) -->
		<div class="container">
			<div class="row justify-content-center mt-5 " >
				<!-- í´ë¦­ì‹œ ë©”ì¸í™”ë©´ìœ¼ë¡œ ì´ë™í•˜ê²Œ í•˜ëŠ” ë§í¬ (í…íŠ¸ ê·¸ë¦¼) -->
				<a href="" class="text-center"><img src="/resources/main/images/header.png" alt=""  ></a>
				<div class="col-md-6 text-center mb-3">
					<h6 class="heading-section" style="font-family: naBrush;">Us Camping</h6>
					<h1 class="heading-section" style="font-family: naBrush">ìº í¼ìŠ¤ Camp us</h1>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">

				<!-- ì•„ì´ì½˜ ê´€ë ¨ -->
				<div class="col-md-12 order-md-last fixed-top">
					<div class="social-media">
		    		<p class="d-md-flex justify-content-end m-2">
						<!-- ê° ì•„ì´ì½˜ í´ë¦­ì‹œ ì´ë™ë˜ëŠ” ë§í¬ (login , mypage , cart) -->
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
	    
		<!-- ì¹´í…Œê³ ë¦¬ ê´€ë ¨ -->
	      <div class="collapse navbar-collapse justify-content-center " id="ftco-nav">
	        <ul class="navbar-nav">

	        	<li class="nav-item dropdown m-6 mb-0 mt-0 ">
				<!-- ì¹´í…Œê³ ë¦¬(ìƒí’ˆ ì •ë³´)ì— ë§ˆìš°ìŠ¤ ì˜¬ë¦¬ì§€ ì•Šê³ , í´ë¦­í•  ë•Œ ê°ˆ ë§í¬ ì„¤ì •í•˜ëŠ” aíƒœê·¸ -->
             	 <a class="nav-link dropdown-toggle " href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ìƒí’ˆ ì •ë³´</a>
             	 <div class="dropdown-menu" aria-labelledby="dropdown01">
				<!-- ê° ì¹´í…Œê³ ë¦¬ë³„ ì´ë™í•˜ëŠ” ë§í¬ -->
              	<a class="dropdown-item" href="#">ì¹´í…Œê³ ë¦¬1</a>
                <a class="dropdown-item" href="#">ì¹´í…Œê³ ë¦¬2</a>
                <a class="dropdown-item" href="#">ì¹´í…Œê³ ë¦¬3</a>
                <a class="dropdown-item" href="#">ì¹´í…Œê³ ë¦¬4</a>
              </div>
           	  </li>

				 <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ì¹´í…Œê³ ë¦¬(ìƒí’ˆ ì •ë³´)ì— ë§ˆìš°ìŠ¤ ì˜¬ë¦¬ì§€ ì•Šê³ , í´ë¦­í•  ë•Œ ê°ˆ ë§í¬ ì„¤ì •í•˜ëŠ” aíƒœê·¸ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ìº í•‘ì¥ ì •ë³´</a>
					<div class="dropdown-menu" aria-labelledby="dropdown02">
					<!-- ê° ì¹´í…Œê³ ë¦¬ë³„ ì´ë™í•˜ëŠ” ë§í¬ -->
					<a class="dropdown-item" href="#">ìº í•‘ì¥ ëª©ë¡</a>
				</div>
				   </li>


				   <li class="nav-item dropdown m-6 mb-0 mt-0">
					<!-- ì¹´í…Œê³ ë¦¬(ìƒí’ˆ ì •ë³´)ì— ë§ˆìš°ìŠ¤ ì˜¬ë¦¬ì§€ ì•Šê³ , í´ë¦­í•  ë•Œ ê°ˆ ë§í¬ ì„¤ì •í•˜ëŠ” aíƒœê·¸ -->
					<a class="nav-link dropdown-toggle " href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ê²Œì‹œíŒ</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
					<!-- ê° ì¹´í…Œê³ ë¦¬ë³„ ì´ë™í•˜ëŠ” ë§í¬ -->
					<a class="dropdown-item" href="#">í†µí•© ê²Œì‹œíŒ</a>
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
