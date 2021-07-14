<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formId" action="loginForm" method="post">
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
			<button class="btn btn-lg btn-primary btn-block" id="login" type="submit">로그인</button>
			<button class="btn btn-lg btn-primary btn-block" id="regist">회원가입</button>
			<input type="hidden" name="${u_userid}" value="${u_password}"/>
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
		let error = '${error}';
		if(error){
			alert(error);
			return false;
		}
		
		$("#login").click(function(){
			let error = '${error}';
 			if($("#u_userid").val() == ""){
 				alert("아이디를 입력하세요");
 				$("#u_userid").focus();
 				return false;
 			} else if($("#u_password").val() == ""){
 				alert("비밀번호를 입력하세요");
 				$("#u_password").focus();
 				return false;
 			}
		});

	})

</script>
<%@include file="../design/footer.jsp" %>