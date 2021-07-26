<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formleave" action="leaveForm" method="post">
	<sec:authentication property="principal" var="user"/>
		<div class="login-Form">
			<h1 class="h1" style="font-family: naBrush">회원 탈퇴</h1>
			<div class="login-margin">
				<label for="u_userid" class="sr-only">로그인</label>
				<input type="text" id="u_userid" name="u_userid" class="form-control-login" value="${user.campusUser.u_userid}" readonly/>
			</div> 
			<div class="login-margin">
				<label for="u_password" class="sr-only">비밀번호</label>
				<input type="password" id="u_password" name="u_password" class="form-control-login" placeholder="비밀번호를 입력해 주세요" />
			</div>
			<div class="login-margin">
				<label> 
					회원탈퇴시 어쩌구저쩌구
				</label>
			</div>
			<button class="btn btn-lg btn-danger btn-block" id="leave" type="button">회원탈퇴</button>
			<button class="btn btn-lg btn-primary btn-block" id="le_cancel"type="button" >취소</button>
			
			<div class="error-message">
				<span>${loginError}</span>
			</div>
		</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	<script>
	$(function(){
		$("#le_cancel").click(function(){
			alert("회원탈퇴를 취소합니다.");
			location.href="/loginMypage";
		});
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";

		$("#leave").click(function(){
			if($("#u_password").val()==""){
				alert("비밀번호를 입력하세요");
				$("#u_password").focus();
				return false;
			}
			$.ajax({
				url: "/pwdCheck",
				type: "POST",
				dataType: "json",
				data:$("#formleave").serialize(),
				beforeSend:function(xhr){
					   xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				success: function(data){
					/* alert(data); */
					if(data == 0){
						alert("비밀번호를 확인하세요");
						return false;
					} else{
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#formleave").submit();
							alert("탈퇴되었습니다.");
						}
					}
				}
			});
		})
	})
	</script>
<%@include file="../design/footer.jsp" %>