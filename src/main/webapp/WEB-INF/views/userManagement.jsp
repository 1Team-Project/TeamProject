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
   	<!-- 게시판 추가중 시작 부분 -->
   	<div class="row">
   		<div class="col-md-1"></div>
   		<div class="col-md-10">
			<div style=" float: right; margin-top: 20px;">
    		</div>
    		<table class="table">
    			<thead>
    				<tr class="textcenter colorthema" >
    					<th class="width_list" style="width=5%;">회원 ID</th>
    					<th class="width_list" style="width=5%;">등   급</th>					
    				</tr>
    			</thead>
    			<tbody class="textcenter">
    				<c:forEach var="vo" items="${userAuth}">
    					<tr>
    						<td><a href>${vo.u_userid}</a></td>
    						<td><a href>${vo.u_auth}</a></td>
    					</tr>
   					</c:forEach>
    			</tbody>
    		</table>
   		</div>
		<div class="col-md-1"></div>
	</div>
	<!-- 게시판 추가중 끝 부분 -->
	<form action="list" method="get" id="mainActionForm">	
		<input type="hidden" name="sort" value="${CampusPageVO.cri.sort}" />
		<input type="hidden" name="keyword" value="${CampusPageVO.cri.keyword}" />
		<input type="hidden" name="page" value="1" />
		<input type="hidden" name="r_page" value="1"/>
	</form>            
	<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
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

	})
	
	
	</script>
<script src="/resources/main/js/main.js"></script>
<%@include file="../design/footer.jsp" %>