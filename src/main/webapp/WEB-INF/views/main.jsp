<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>

<style>
	.boldergreen {
	  border: 4px solid #78c2ad;
	  border-radius: 15px;
	}
	.textcenter {
	  text-align: center;
	}
	.width10 {
	  width: 10%;
	}
	.width20 {
	  width: 20%;
	}
	.width30 {
	  width: 30%;
	}
	.width40 {
	  width: 40%;
	}
	.topmargin10 {
	  margin-top: 10px;
	}
	.topmargin30 {
	  margin-top: 30px;
	}
	.colorthema {
	  background-color: #78c2ad;
	  color: white;
	}
	.margintb20 {
	  margin-top: 20px;
	  margin-bottom: 20px;
	}
	.badgecount {
	  display: inline-block;
	  font-size: 0.8em;
	  line-height: 0;
	  font-weight: 500;
	  color: rgb(94, 94, 94);
	  text-align: center;
	  white-space: nowrap;
	  vertical-align: baseline;
	  margin-left: 7px;
	}
	.blacktext {
	  text-decoration: none;
	  color: rgb(136, 136, 136);
	}
	.hoverthema:hover {
	  color: #78c2ad;
	}
	.hh4 {
	  font-size: 1.5rem;
	}
	.padding5px {
	  padding: 5px;
	}
	.padding6px {
	  padding: 6px;
	}
	.paginate_button {
	  padding: 100px;
	  border: 1px solid red;
	}
	.mypagination {
	  display: -ms-flexbox;
	  display: flex;
	  padding-left: 0;
	  list-style: none;
	}
	.mypage-link {
	  padding: 0.375rem 0.75rem;
	  position: relative;
	  display: block;
	  color: rgb(68, 68, 68);
	  text-decoration: none;
	  background-color: #ffffff;
	  border: 1px solid #78c2ad;
	  margin: 2px;
	}
	.activecolor {
	  background-color: #78c2ad;
	  color: white;
	}
	.mypagination .mypage-item:first-child .mypage-link {
	  border-top-left-radius: 0.6rem;
	  border-bottom-left-radius: 0.6rem;
	}
	.mypagination .mypage-item:last-child .mypage-link {
	  border-top-right-radius: 0.6rem;
	  border-bottom-right-radius: 0.6rem;
	}
	.mypage-link:hover {
	  z-index: 2;
	  color: #fff;
	  background-color: #78c2ad;
	  border-color: #78c2ad;
	}
	.inlinetest {
	  display: inline-block;
	}
	.ml20{
		margin-left: 7%;
	}
</style>
	<div class="container-fluid" style="overflow-x:hidden;">
		<div class="row topmargin30">
			<div class="col-md-12"></div>
			<h3 class="heading-section ml20" style="font-family: naBrush;">즐거운 여행 공간 Camp us</h3>
		</div>
		<div class="row">
		 	<div class="col-md-1"></div>
		  	<div class="col-md-10">
		  		<div class="row">
		  		<!-- main 윗부분 시작 -->
		  			<div class="main_left">
				    	<div class="col-md-12 colorthema hh4 padding6px margintb20"> 추천 상품 </div>
       					<div class="slide_opt">
       						<input type="radio" name="img" id="img1" checked/>
       						<input type="radio" name="img" id="img2"/>
       						<input type="radio" name="img" id="img3"/>
       						<input type="radio" name="img" id="img4"/>
       						<input type="radio" name="img" id="img5"/>
       						<ul class="slide_img">
	        					<li><img src="../../resources/main/images/tent1.jpg"/></li>
	        					<li><img src="../../resources/main/images/tent2.jpg"/></li>
	        					<li><img src="../../resources/main/images/car1.jpg"/></li>
	        					<li><img src="../../resources/main/images/car2.jpg"/></li>
	        					<li><img src="../../resources/main/images/cabin1.jpg"/></li>
	        				</ul>
	        				<div class="slide_btn">
	        					<label for="img1">&nbsp;</label>
	        					<label for="img2">&nbsp;</label>
	        					<label for="img3">&nbsp;</label>
	        					<label for="img4">&nbsp;</label>
	        					<label for="img5">&nbsp;</label>
	        				</div>
            			</div>
		    		</div>
		    		<div class="main_right">
						<div class="col-md-12 colorthema hh4 padding6px margintb20"> 아름다운 캠핑 장소 </div>
       					<div class="slide_opt2">
       						<input type="radio" name="img2" id="img6" checked/>
       						<input type="radio" name="img2" id="img7"/>
       						<input type="radio" name="img2" id="img8"/>
       						<input type="radio" name="img2" id="img9"/>
       						<input type="radio" name="img2" id="img10"/>
       						<ul class="slide_img2">
	        					<li><img src="../../resources/main/images/tent1.jpg"/></li>
	        					<li><img src="../../resources/main/images/tent2.jpg"/></li>
	        					<li><img src="../../resources/main/images/car1.jpg"/></li>
	        					<li><img src="../../resources/main/images/car2.jpg"/></li>
	        					<li><img src="../../resources/main/images/cabin1.jpg"/></li>
	        				</ul>
	        				<div class="slide_btn2">
	        					<label for="img6">&nbsp;</label>
	        					<label for="img7">&nbsp;</label>
	        					<label for="img8">&nbsp;</label>
	        					<label for="img9">&nbsp;</label>
	        					<label for="img10">&nbsp;</label>
	        				</div>
            			</div>
         			</div>
				</div>
		    </div>
			<div class="col-md-1"></div>
		</div>
		<!-- main 윗부분 끝 -->
    	<!-- 게시판 추가중 시작 부분 -->
    	<div class="row">
    		<div class="col-md-1"></div>
    		<div class="col-md-10">
				<div style=" float: right; margin-top: 20px;">
					<form action="" id="main_searchForm">
						<select name="sort">
							<option value="">--------</option>
							<option value="Q">질문</option>
							<option value="R">후기</option>
						</select>
						<!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 한다. -->
						<input type="hidden" name="keyword" value="${CampusPageVO.cri.keyword}"/>
						<input type="hidden" name="page" value="1"/>
						<button type="button" class="btn btn-primary" style="font-size:15px; height: 30px; margin: 2px;">조 회</button>
					</form>
	    		</div>
	    		<table class="table">
	    			<thead>
	    				<tr class="textcenter colorthema" >
	    					<th class="width_list" style="width=3%;">작성일</th>
	    					<th class="width_list" style="width=3%;">분류</th>
	    					<th class="width_list" style="width=80%;">제목</th>
	    					<th class="width_list" style="width=3%;">조회수</th>
	    				</tr>
	    			</thead>
	    			<tbody class="textcenter">
	    				<c:forEach var="vo" items="${mainList}">
	    					<tr>
	    						<td><fmt:formatDate pattern="MM-dd" value="${vo.b_sysdate}"/></td>
	    						<td>${vo.b_sort}</td>
	    						<td>
	    							<a href="${vo.b_no}" class="move" style="text-decoration: none; color: #888;">${vo.b_title}</a>
	    						</td>
	    						<td>${vo.b_views}</td>
	    					</tr>
	    				</c:forEach>
	    			</tbody>
	    		</table>
    		</div>
			<div class="col-md-1"></div>
		</div>
		<!-- 게시판 추가중 끝 부분 -->
	</div>
	<form action="" method="get" id="main_actionForm">
		<input type="hidden" name="sort" value="${CampusPageVO.cri.sort}"/>
		<input type="hidden" name="keyword" value="${CampusPageVO.cri.keyword}"/>
		<!-- <input type="hidden" name="page" value="1" /> -->
	</form>
	<script>
	$(function() {
		// 조회 버튼 클릭 시
		$(".btn-primary").click(function(e) {
			e.preventDefault();
			// 검색 폼 가져오기
			var main_searchForm = $("#main_searchForm");
			// sort 가져오기
			var sort=$("select[name='sort']").val();
			// 검색 처음에는 1page 보여주기
			main_searchForm.find("input[name='page']").val("1");
			main_searchForm.submit();
			
		});

		// 게시글 제목 클릭 시
		$(".move").click(function(e) {
			e.preventDefault(); 
			var main_actionForm = $("#main_actionForm");
			let bnoval = $(this).attr('href');

			$.ajax({
				url: "/board/viewadd",
				type: "POST",
				processData:false,
				contentType: false,
				data: bnoval,
				success: function(result){
					main_actionForm.append("<input type='hidden' name='r_page' value='" + "1" + "'/>");
					main_actionForm.append("<input type='hidden' name='b_views' value='" + result + "'/>");
					main_actionForm.append("<input type='hidden' name='b_no' value='"+ bnoval +"'/>");
					main_actionForm.attr("action", "/board/view");
					main_actionForm.submit();
				}
			});
		});
	})
	</script>
<%@include file="../design/footer.jsp" %>