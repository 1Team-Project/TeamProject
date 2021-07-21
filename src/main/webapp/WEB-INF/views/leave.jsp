<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formleave" action="leaveForm" method="post">
		<div class="login-Form">
			<h1 class="h1" style="font-family: naBrush">회원 탈퇴</h1>
			<div class="login-margin">
				<label for="u_userid" class="sr-only">로그인</label>
				<input type="text" id="u_userid" name="u_userid" class="form-control-login" value="${login.u_userid}" readonly/>
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
			<button class="btn btn-lg btn-danger btn-block" id="leave" type="submit">회원탈퇴</button>
			<button class="btn btn-lg btn-primary btn-block" id="cancel">취소</button>
			
			<div class="error-message">
				<span>${loginError}</span>
			</div>
		</div>
	</form>

<%@include file="../design/footer.jsp" %>