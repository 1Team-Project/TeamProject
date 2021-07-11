<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form action="regist2" method="post">
		<div class="regist-Form">
			<div class="form-group">
		  		<label for="userid" style="font-family: naBrush">아이디</label>
		  		<div class="regist-margin">
		    		<input type="text" name="userid" id="userid" class="form-control-regist" placeholder="영문, 숫자 4 ~12자리" />
		    		<small id="userid" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="pass1" style="font-family: naBrush">비밀번호</label>
		  		<div class="regist-margin">
		    		<input type="password" name="password" id="password" class="form-control-regist" placeholder="영문, 숫자 8 ~12자리, 특수문자 !@#$%^&* 사용가능" />
		    		<small id="password" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="pass2" style="font-family: naBrush">비밀번호 확인</label>
		  		<div class="regist-margin">
		    		<input type="password" name="confirm_password" id="confirm_password" class="form-control-regist" placeholder="영문, 숫자 8 ~12자리, 특수문자 !@#$%^&* 사용가능" />
		    		<small id="confirm_password" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="username" style="font-family: naBrush">이    름</label>
		  		<div class="regist-margin">
		    		<input type="text" name="username" id="username" class="form-control-regist" placeholder="이름을 입력하세요" />
		    		<small id="username" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="email" style="font-family: naBrush">이메일</label>
		  		<div class="regist-margin">
		    		<input type="text" name="email" id="email" class="form-control-regist" placeholder="example@gmail.com" />
		    		<small id="email" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="phone" style="font-family: naBrush">전화번호</label>
		  		<div class="regist-margin">
		    		<input type="text" name="phone" id="phone" class="form-control-regist" placeholder="전화번호를 입력하세요" />
		    		<small id="phone" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="address" style="font-family: naBrush">주    소</label>
		  		<div class="regist-margin">
		    		<input type="text" name="address" id="address" class="form-control-regist" placeholder="주소를 입력하세요" />
		    		<small id="address" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<button type="submit" id="signup" class="btn btn-primary" style="font-size:20px">입 력</button>
		  		<button type="reset" class="btn btn-danger" style="font-size:20px" onclick="location.href='/'">취 소</button>
		    </div>
	    </div>
	</form>
<script>
	/* 자바스크립트로 회원가입 양식 제작 */
	var signup = document.getElementById("signup");

 	signup.addEventListener("click", function() {
//	signup.onclick = function() {
		var userid = document.getElementById("userid");
		var password = document.getElementById("password");
		var confirm_password = document.getElementById("confirm_password");
		var username = document.getElementById("username");
		var email = document.getElementById("email");
		var phone = document.getElementById("phone");
		var address = document.getElementById("address");
		
		var regId = /^[a-zA-Z0-9]{4,12}$/;
		var regPw = /[a-zA-Z0-9!@#$%^&*]{8,12}$/;
		var regName = /^[가-힝a-zA-Z]{2,}$/;
		var regEmail = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.]a-z0-9]{2,}/i;
		var regPhone = /[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		var regAdd = /[가-힝]{2,}$/;
		
		if(userid.value == '') {
			alert("아이디를 입력하세요");
			userid.focus();
			event.preventDefault();
		} else if(!regId.test(userid.value)) {
			alert("아이디를 형식을 확인하세요");
			userid.focus();
			event.preventDefault();
 		} else if(password.value == '') {
			alert("비밀번호를 입력하세요");
			password.focus();
			event.preventDefault();
		} else if(!regPw.test(password.value)) {
			alert("비밀번호를 형식을 확인하세요");
			password.focus();
			event.preventDefault();
		} else if(confirm_password.value == '') {
			alert("비밀번호를 입력하세요");
			confirm_password.focus();
			event.preventDefault();
		} else if(!regPw.test(confirm_password.value)) {
			alert("비밀번호를 형식을 확인하세요");
			confirm_password.focus();
			event.preventDefault();
		} else if(password.value != confirm_password.value) {
			alert("비밀번호가 다릅니다");
			password.focus();
			event.preventDefault();
		} else if(username.value == '') {
			alert("이름을 입력하세요");
			username.focus();
			event.preventDefault();
		} else if(!regName.test(username.value)) {
			alert("이름 형식을 확인하세요");
			username.focus();
			event.preventDefault();
		} else if(email.value == '') {
			alert("이메일을 입력하세요");
			email.focus();
			event.preventDefault();
		} else if(!regEmail.test(email.value)) {
			alert("이메일 형식을 확인하세요");
			email.focus();
			event.preventDefault();
		} else if(phone.value == '') {
			alert("전화번호를 입력하세요");
			phone.focus();
			event.preventDefault();
		} else if(!regEmail.test(phone.value)) {
			alert("전화번호 형식을 확인하세요");
			phone.focus();
			event.preventDefault();
		} else if(address.value == '') {
			alert("주소를 입력하세요");
			address.focus();
			event.preventDefault();
		} else if(!regAdd.test(address.value)) {
			alert("전화번호 형식을 확인하세요");
			address.focus();
			event.preventDefault();
		} 
	})
</script>
<%@include file="../design/footer.jsp" %>
