<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formId" action="loginForm" method="post">
		<div class="login-Form">
			<h1 class="h1" style="font-family: naBrush">로그인</h1>
			<div class="login-margin">
				<label for="userid" class="sr-only">로그인 아이디</label>
				<input type="text" id="userid" name="userid" class="form-control-login" placeholder="아이디를 입력해 주세요" />
			</div> 
			<div class="login-margin">
				<label for="password" class="sr-only">비밀번호</label>
				<input type="password" id="password" name="password" class="form-control-login" placeholder="비밀번호를 입력해 주세요" />
			</div>
			<div class="login-margin">
				<label> 
					<input type="checkbox" name="remember-me"> 로그인 기억하기
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="login" type="submit">로그인</button>
			<button class="btn btn-lg btn-primary btn-block" id="regist">회원가입</button>
			<input type="hidden" name="${userid}" value="${password}"/>
			<div class="error-message">
				<span>${loginError}</span>
			</div>
		</div>
	</form>
<script>
	$(function(){
		/* 회원가입 버튼 누르면 페이지 이동 */
		$("#regist").click(function(){
			$("#formId").attr("action", "agree");
		});
		
		/* 로그인 버튼 관련 */
 		$("#login").click(function(){
 			if($("#userid").val() == ""){
 				alert("아이디를 입력하세요");
 				$("#userid").focus();
 				return false;
 			} else if($("#password").val() == ""){
 				alert("비밀번호를 입력하세요")
 				$("#password").focus();
 				return false;
			}
 		});
	})
</script>
<%@include file="../design/footer.jsp" %>