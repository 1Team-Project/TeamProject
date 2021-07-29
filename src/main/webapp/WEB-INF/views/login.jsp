<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formId" action="/loginForm" method="post">
		<div class="login-Form">
			<h1 class="h1" style="font-family: naBrush">로그인</h1>
			<div class="login-margin">
				<label for="u_userid" class="sr-only">로그인 아이디</label>
				<input type="text" id="u_userid" name="u_userid" class="form-control-login" placeholder="아이디를 입력해 주세요" />
			</div> 
			<div class="login-margin">
				<label for="u_password" class="sr-only">비밀번호</label>
				<input type="password" id="u_password" name="u_password" class="form-control-login" placeholder="비밀번호를 입력해 주세요" />
			</div>
	 		<div class="login-margin">
				<label> 
					<input type="checkbox" name="remember-me"> 로그인 기억하기
				</label>
			</div>
			<div class="error-message" style="color: red; margin-bottom: 10px;">
				<span>${LoginFailMessage}</span>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="find">
				<a href="login2" style="text-decoration: none; color: #888;">아이디 / 비밀번호 찾기</a>
				<p></p>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="login" type="submit">로그인</button>
			<button class="btn btn-lg btn-primary btn-block" id="regist">회원가입</button>
		</div>
	</form>
<script src="/resources/main/js/register_yk.js"></script>
<%@include file="../design/footer.jsp" %>