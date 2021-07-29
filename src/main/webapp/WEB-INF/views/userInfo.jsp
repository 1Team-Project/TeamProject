<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<sec:authentication property="principal" var="user"/>
	<form id="adminModify" action="/leave" method="post">
		<div class="regist-Form">
			<div class="form-group">
				<h2>회원 정보 확인</h2>
				<p></p>
		  		<label for="u_userid" style="font-family: naBrush">아이디</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_userid" id="u_userid" class="form-control-regist" value="${userS.u_userid}" readonly/>
		  		</div>
		    	<i id="u_userid" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="u_username" style="font-family: naBrush">이    름</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_username" id="u_username" class="form-control-regist" value="${userS.u_username}" readonly/>
		  		</div>
	    		<i id="u_username" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="u_email" style="font-family: naBrush">이메일</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_email" id="u_email" class="form-control-regist" value="${userS.u_email}" readonly/>
		  		</div>
	    		<i id="u_email" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="u_phone" style="font-family: naBrush">전화번호</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_phone" id="u_phone" class="form-control-regist" value="${userS.u_phone}" readonly/>
		  		</div>
	    		<i id="u_phone" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="u_address" style="font-family: naBrush">주    소</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_address" id="u_address" class="form-control-regist" value="${userS.u_address}" readonly/>
		  		</div>
	    		<i id="u_address" class="text-info"></i>
			</div>
			
 			<div class="form-group">
		  		<label for="u_auth" style="font-family: naBrush">등   급</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_auth" id="u_auth" class="form-control-regist" value="${userA.u_auth}" readonly/>
		  		</div>
	    		<i id="u_auth" class="text-info"></i>
			</div>
	  		<select name="u_auth_select" id="u_auth_select">
				<option value="">등급 변경</option>
				<option value="ROLE_ADMIN">ROLE_ADMIN</option>
				<option value="ROLE_USER">ROLE_USER</option>
	  			<input type="hidden" name="authChange" id="u_auth" value="">
			</select>
			<div class="form-group">
	            <button type="button" id="mo_auth_update"class="btn btn-info">회원등급변경</button>
	            <button type="button" id="mo_cancel" class="btn btn-warning">취 소</button>
	            <button type="button" id="mo_leaveCo"class="btn btn-secondary">회원 강제 탈퇴</button>
		    </div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
<script>
	$(function(){
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#mo_cancel").click(function(){
			alert("정보 수정을 취소합니다.");
			location.href="/loginMypage";
		});
		
	 	$("#mo_leaveCo").click(function(){
	 		$("#adminModify").submit();
		});
	 	
	 	$("#mo_auth_update").click(function(event){
	 		var u_auth = $("#u_auth").val();
	 		var select = $("select[name='u_auth_select']").val();
	 		if(u_auth==select){
	 			alert("현재 등급입니다.");
	 			return false;
	 		}
	 		
	 		$("input[id='u_auth']").attr('value', select);
	 		
			$.ajax({
				url: "/authCheck",
				type: "POST",
				dataType: "json",
				data:$("#adminModify").serialize(),
				beforeSend:function(xhr){
					   xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				success: function(data){
					if(data){
						if(confirm("권한을 변경합니다.")){
					 		$("#adminModify").attr("action", "/authUpdate").submit();
					 		alert("변경되었습니다.");
						} else{
							alert("에러 발생");
							return false;
						}
					}
				}
			});

	 	});
 	 		
	 })

</script>
<%@include file="../design/footer.jsp" %>