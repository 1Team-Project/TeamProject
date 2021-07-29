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
   	<sec:authentication property="principal" var="user"/>
   	<form id="userManage" action="/userInfo" method="post">
	   	<div class="row">
	   		<div class="col-md-1"></div>
	   		<div class="col-md-10">
				<div style=" float: right; margin-top: 20px;"></div>
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
		   						<td><a class="userInfo" style="text-decoration: none; color: black;" value="${vo.u_userid}">${vo.u_userid}</a></td>
		   						<td>${vo.u_auth}</td>
	   						</tr>
						</c:forEach>
	    			</tbody>
	    		</table>
	   		</div>
			<div class="col-md-1"></div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="u_userid" id="u_userid" value="${vo.u_userid}" />
		</div>
	</form>
<script>
	$(function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$(".userInfo").click(function(){
			var u_userid = $(this).attr('value');
			alert(u_userid);
	 		$.ajax({
				url: "/userCheck",
				type: "POST",
				dataType: "json",
 				data: {
					u_userid : u_userid
				},
				beforeSend:function(xhr){
					   xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				success: function(data){
					if(data == 0){
						alert("조회 실패");
						return false;
					} else{
						alert("조회 성공");
						$('input[name=u_userid]').attr('value', u_userid);
						$("#userManage").submit();
					}
				}
			});
		});
			
	})
</script>
<%@include file="../design/footer.jsp" %>