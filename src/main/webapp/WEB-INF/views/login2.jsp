<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="findUserForm" action="" method="post">
		<div class="login-Form">
			<div class="find_ID">
				<div class="col-md-1"></div>
				<h1 class="h1" style="font-family: naBrush">아이디 찾기</h1>
				<div class="login-margin">
					<label for="u_username1" class="sr-only">회원 이름</label>
					<input type="text" id="u_username1" name="u_username1" class="form-control-login" placeholder="이름을 입력해 주세요" />
				</div> 
				<i id="u_username1" class="text-info"></i>
				<div class="login-margin">
					<label for="u_email1" class="sr-only">이메일</label>
					<input type="text" id="u_email1" name="u_email1" class="form-control-login" placeholder="example@gmail.com" />
				</div>
				<div class="login-margin">
					<input type="text" name="u_email_check1" id="u_email_check1" class="form-control-regist" placeholder="인증번호 입력" />
				</div>
				<i id="u_email1" class="text-info"></i>
			</div>
			<div class="login-margin">
				<button type="button" id="chkEmail1" class="btn btn-primary" style="font-size:20px">메일인증</button>
		  		<button type="button" id="chkNum1" class="btn btn-primary" style="font-size:20px">인증번호 확인</button>
				<button class="btn btn-lg btn-primary btn-block" id="findId" type="button">아이디 확인</button>
			</div>
			<div class="chkId">
				<input type="text" id="u_chkId" name="u_chkId" class="form-control-login" placeholder="아이디 : ${findId.u_userid}" readonly />
			</div>
			<br/>
			<br/>
			<div class="find_PW">
				<div class="col-md-1"></div>
				<h1 class="h1" style="font-family: naBrush">비밀번호 변경</h1>
				<div class="login-margin">
					<label for="u_userid2" class="sr-only">로그인 아이디</label>
					<input type="text" id="u_userid2" name="u_userid2" class="form-control-login" placeholder="아이디를 입력해 주세요" />
				</div> 
				<i id="u_userid2" class="text-info"></i>
				<div class="login-margin">
					<label for="u_username2" class="sr-only">회원 이름</label>
					<input type="text" id="u_username2" name="u_username2" class="form-control-login" placeholder="이름을 입력해 주세요" />
				</div> 
				<i id="u_username2" class="text-info"></i>
				<div class="login-margin">
					<label for="u_email2" class="sr-only">이메일</label>
					<input type="text" id="u_email2" name="u_email2" class="form-control-login" placeholder="example@gmail.com" />
				</div>
				<div class="login-margin">
					<input type="text" name="u_email_check2" id="u_email_check2" class="form-control-regist" placeholder="인증번호 입력" />
				</div>
				<i id="u_email2" class="text-info"></i>
				<div class="login-margin">
					<button type="button" id="chkEmail2" class="btn btn-primary" style="font-size:20px">메일인증</button>
			  		<button type="button" id="chkNum2" class="btn btn-primary" style="font-size:20px">인증번호 확인</button>
					<button class="btn btn-lg btn-primary btn-block" id="changePW" type="button">비밀번호 변경</button>
				</div>
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="u_userid" value=""/>
		<input type="hidden" name="u_username" value=""/>
		<input type="hidden" name="u_email" value=""/>
		<button class="btn btn-lg btn-primary btn-block" id="loginRe" type="button">로그인 돌아가기</button>
	</form>
<script>
	$(function(){
		var code = "";
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#loginRe").click(function(){
			location.href="/login";
		});
		
		$("#findId").click(function(event){
			var u_userid;
	 		var u_username =$("#u_username1").val();
	 		var u_email = $("#u_email1").val();
			var u_email_check = $("#u_email_check1").val();
	 		
	 		var regId = /^[a-zA-Z0-9]{4,12}$/;
	 		var regName = /^[가-힝a-zA-Z]{2,}$/;
	 		var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{3,}/i;

			
			if(u_username == '') {
	 			$('i[id="u_username1"]').html("이름을 입력하세요");
	 			$("#u_username1").focus();
	 			return false;
	 		} else if(!regName.test(u_username)) {
	 			$('i[id="u_username1"]').html("이름을 형식을 확인하세요");
	 			$("#u_username1").focus();
	 			return false;
	 		} else if(u_email == '') {
	 			$('i[id="u_email1"]').html("이메일을 입력하세요");
	 			$("#u_email1").focus();
	 			return false;
	 		} else if(!regEmail.test(u_email)) {
	 			$('i[id="u_email1"]').html("이메일 형식을 확인하세요(example@gmail.com)");
	 			$("#u_email1").focus();
	 			return false;
	 		}  else if(u_email_check == '') {
	 			$('i[id="u_email1"]').html("이메일을 인증해주세요");
	 			$("#u_email_check1").focus();
	 			return false;
	 		} else if(u_email_check != code) {
	 			$('i[id="u_email1"]').html("이메일 인증번호를 확인하세요");
	 			return false;
	 		}
			$('input[name="u_username"]').val(u_username);
			$('input[name="u_email"]').val(u_email);
			
			$.ajax({
					url: "/findUser",
					type: "POST",
					dataType: "json",
					data:{
						u_username : u_username,
						u_email : u_email
					},
	 				beforeSend:function(xhr){
						   xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
					},
					success: function(result){
						if(result){
							$("#findUserForm").attr("action", "printId").submit();
								} else {
							if(confirm("아이디가 없습니다. 가입하시겠습니까?")){
								$("#findUserForm").attr("action", "agree").submit();
							}
						}
					}

	 		});
			
		});
		$("#changePW").click(function(event){
			var u_userid = $("#u_userid2").val();
	 		var u_username =$("#u_username2").val();
	 		var u_email = $("#u_email2").val();
			var u_email_check = $("#u_email_check2").val();
	 		
	 		var regId = /^[a-zA-Z0-9]{4,12}$/;
	 		var regName = /^[가-힝a-zA-Z]{2,}$/;
	 		var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{3,}/i;
	 		
			if(u_userid == '') {
	 			$('i[id="u_userid2"]').html("아이디를 입력하세요");
	 			$("#u_userid2").focus();
	 			return false;
	 		} else if(!regId.test(u_userid)) {
	 			$('i[id="u_userid2"]').html("아이디 형식을 확인하세요");
	 			$("#u_userid2").focus();
	 			return false;
	 		} else if(u_username == '') {
	 			$('i[id="u_username2"]').html("이름을 입력하세요");
	 			$("#u_username2").focus();
	 			return false;
	 		} else if(!regName.test(u_username)) {
	 			$('i[id="u_username2"]').html("이름 형식을 확인하세요");
	 			$("#u_username2").focus();
	 			return false;
	 		} else if(u_email == '') {
	 			$('i[id="u_email2"]').html("이메일을 입력하세요");
	 			$("#u_email2").focus();
	 			return false;
	 		} else if(!regEmail.test(u_email)) {
	 			$('i[id="u_email2"]').html("이메일 형식을 확인하세요(example@gmail.com)");
	 			$("#u_email2").focus();
	 			return false;
	 		} else if(u_email_check == '') {
	 			$('i[id="u_email2"]').html("이메일을 인증해주세요");
	 			$("#u_email_check2").focus();
	 			return false;
	 		} else if(u_email_check != code) {
	 			$('i[id="u_email2"]').html("이메일 인증번호를 확인하세요");
	 			return false;
	 		}
	 		
			$('input[name="u_username"]').val(u_username);
			$('input[name="u_email"]').val(u_email);
			$('input[name="u_userid"]').val(u_userid);
			$.ajax({
				url: "/findUserPw",
				type: "POST",
				dataType: "json",
				data:{
					u_userid : u_userid,
					u_username : u_username,
					u_email : u_email
				},
 				beforeSend:function(xhr){
					   xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				success: function(result){
					if(result){
						$("#findUserForm").attr("action", "changePw").submit();
					} else {
						/* if(confirm("아이디가 없습니다. 가입하시겠습니까?")){
							$("#findUserForm").attr("action", "agree").submit();
						} */
						alert("가입 정보를 확인해주세요.")
						return false;
					}
				}
	 		});
	 	});
		

		$("#chkEmail1").click(function(){
			var u_email = $("#u_email1").val();
			var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
			
			var u_email_check = $("#u_email_check1");
			var chkNum = $("#chkNum1");

			alert("이메일 인증 : " + u_email);
			if(u_email == '') {
				$('i[id="u_email1"]').html("이메일 입력하세요");
				return false;
			} else if(!regEmail.test(u_email)) {
				$('i[id="u_email1"]').html("이메일 형식을 확인하세요");
				return false;
			}

			$('input[name="u_email"]').val(u_email);

			$.ajax({
				url: "/chkEmail",
				type: "POST",
				data: $("#findUserForm").serialize(),
				success: function(result){
					if(result==''){
						$('i[id="u_email1"]').html("이메일 미확인");
						return false;
					} else {
						u_email_check.attr("disabled", false);
						chkNum.attr("id", "chkNum_true");
						code = result;
						$('i[id="u_email1"]').html("이메일 확인");
						return false;
					}
				}
			});
			
		});

		$("#chkEmail2").click(function(){
			var u_email = $("#u_email2").val();
			var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
			
			var u_email_check = $("#u_email_check2");
			var chkNum = $("#chkNum2");
			

			alert("이메일 인증 : " + u_email);
			if(u_email == '') {
				$('i[id="u_email2"]').html("이메일 입력하세요");
				return false;
			} else if(!regEmail.test(u_email)) {
				$('i[id="u_email2"]').html("이메일 형식을 확인하세요");
				return false;
			}
			
			$('input[name="u_email"]').val(u_email);
			
			$.ajax({
				url: "/chkEmail",
				type: "POST",
				data: $("#findUserForm").serialize(),
				success: function(result){
					if(result==''){
						$('i[id="u_email2"]').html("이메일 미확인");
						return false;
					} else {
						u_email_check.attr("disabled", false);
						chkNum.attr("id", "chkNum_true");
						code = result;
						$('i[id="u_email2"]').html("이메일 확인");
						return false;
					}
				}
			});
			
		});
		
		$("#u_email_check2").blur(function(){
			var inputCode = $("#u_email_check2").val();
			
			if(inputCode == code){
				$('i[id="u_email2"]').html("인증번호 일치");
				checkResult.html("");
			} else {
				$('i[id="u_email2"]').html("인증번호를 확인해 주세요");
			}
		});
		
		$("#u_email_check2").blur(function(){
			var inputCode = $("#u_email_check2").val();
			
			if(inputCode == code){
				$('i[id="u_email"]').html("인증번호 일치");
				checkResult.html("");
			} else {
				$('i[id="u_email"]').html("인증번호를 확인해 주세요");
			}
		});
	})
</script>
<%@include file="../design/footer.jsp" %>