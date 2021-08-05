<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
/* 1.하단정보 */
    #footer{
	height:42px;
	position:relative;
	width:100%;
	transform:translateY(1000%);
}
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
    <div class="row2">
    <footer id="footer">
      <div class="f_info">
        <div class="layout">
          <div class="f_png col-md-2 float-left">
            <img src="/resources/main/images/tent.png" width="100" height="80"/>
            <span class="campus" style="font-family: naBrush;">Camp us</span>
          </div>
          <ul class="f_menu row justify-content-center">
            <li class="privacy col-md-4 hoverbold">
              <a href="">회사 소개</a>
            </li>
            <li class="col-md-4 hoverbold">
              <a href="">개인정보약관</a>
            </li>
            <li class="col-md-4 hoverbold">
              <a href="">문의 게시판</a>
            </li>
          </ul>
          <ul class="f_sns col-md-2 float-end">
            <li class="m-2 md-0 mt-0 mr-0">
              <a href="https://www.instagram.com/" target="_blank" title="CampUs 공식 인스타그램 바로가기"><img src="/resources/main/images/insta.png" width="20" height="20">CampUs 공식 인스타</a>
            </li>
            <li class="m-2 md-0 mt-0 mr-0">
              <a href="https://ko-kr.facebook.com/" target="_blank" title="CampUs 공식 페이스북 바로가기"><img src="/resources/main/images/facebook.png" width="20" height="20">CampUs 공식 페이스북</a>
            </li>
            <li class="m-2 md-0 mt-0 mr-0">
              <a href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0" target="_blank" title="CampUs 공식 블로그 바로가기"><img src="/resources/main/images/blog.png" width="20" height="20">CampUs 공식 블로그</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="f_link">
        <div class="layout">
          <!--하단주소-->
          <div class="f_addr">
            <address class="addr m-2">
              <div>서울특별시 종로구 코아빌딩 5층</div>
              <div>TEL : 02-000-0000 (상담시간 : 평일 09:30~18:30)</div>
              <div> EMAIL :
                <a href="mailto:CampUs@gmail.com" class="f_mail">CampUs@gmail.com</a>
              </div>
            </address>
            <p class="copyright m-2">
              Copyrights(c) 2021 <span>KOREA CAMPUS ORGANIZATION</span>
               ALL RIGHTS RESERVED.
            </p>
          </div>
          </div>
         </div>
    </footer>
    </div>
</section>
</body>
</html>
