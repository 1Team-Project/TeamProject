<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp" %>
<link rel="stylesheet" href="/resources/main/css/campinglist.css">


    <div id="wrap">
        <div id="container">
            <div id="contents_main">
              

                <!-- 중앙영역 시작 -->
                <div id="titleArea" class="campus camping headcategory ">
                    <h2>
                        <a href="/camp/campinglist">CAMPING</a>
                    </h2>

					<!-- 공백,,, -->
                   <div class="gong"></div>
                    
                    
                  
                    <div id="center_sec">

						
                        <!-- 캠핑장 -->
                        <div class="campus camping allcamping">

                            <div class="campus camping camping-normallist listcamping">

                                <ul class="campList grid3">
								<!--리스트반복~ 주석처리해도 오류나서 뺌-->
                                    <li id="boxid" class="prolist">
                                        <div class="thumbnail">
                                            <div class="prdImg">
                                                <a href="/camp/campingdetail" name="boxname" class="viewpro">
                                                    <img src="/resources/main/images/cresr.jpg" id="camp1" alt=""></a>
                                            </div>
                                        </div>
                                     </li> 
                                     <li id="boxid" class="namelist">
                                        <div class="description">
                                            <div class="camping_name">
                                                <strong class="name"><a href="/camp/campingdetail" class="viewpro">
                                                        <span>캠퍼스 캠핑장</span>
                                                </a></strong>
                                            </div>
                                            <div class="camping_info">
                                                <span class="">인원수제한</span>
                                                <span class="price">성인/아동 포함 4명</span>
                                            </div>        
                                            <div class="camping_price">
                                                <span class="">가격</span>
                                                <span class="price">160000원</span>
                                            </div>
<!--                                             <div class="camping_status">
                                            	<span>잔여자리개수 (예약가능개수/총개수)</span>
                                            </div> -->
                                        </div>
                                     </li>
                                 	 <!-- 구분선-->
                  				 	 <hr>    
									
									<!--리스트반복~ 주석처리해도 오류나서 뺌-->
                                    <!--캠핑장 반복 ~~ -->
                                 
                                </ul>
                            </div>
                        </div>
					


         
		</div>
		<div class="col-md-1"></div>
	</div>
</div>
		<form action="" method="get" id="detailForm">
			<input type="hidden" name="sort" value="${CampusProductPageVO.cri.sort}" />
			<input type="hidden" name="keyword"value="${CampusProductPageVO.cri.keyword}" /> 
			<input type="hidden" name="page" value="${CampusProductPageVO.cri.page}" />
		</form>
     </div>
</div>


<%@include file="../../design/footer.jsp" %>