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
					<label for="u_phone1" class="sr-only">전화번호</label>
					<input type="text" id="u_phone1" name="u_phone1" class="form-control-login" placeholder="전화번호를 입력해 주세요" />
				</div>
				<i id="u_phone1" class="text-info"></i>
			</div>
			<div class="login-margin">
				<button class="btn btn-lg btn-primary btn-block" id="certify1" type="button">번호 인증</button>
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
					<label for="u_phone2" class="sr-only">전화번호</label>
					<input type="text" id="u_phone2" name="u_phone2" class="form-control-login" placeholder="전화번호를 입력해 주세요(000-0000-0000)" />
				</div>
				<i id="u_phone2" class="text-info"></i>
				<div class="login-margin">
					<button class="btn btn-lg btn-primary btn-block" id="certify2" type="button">번호 인증</button>
					<button class="btn btn-lg btn-primary btn-block" id="changePW" type="button">비밀번호 변경</button>
				</div>
<%-- 				<div class="chkPw">
					<input type="text" id="u_chkPw" name="u_chkPw" class="form-control-login" placeholder="아이디 : ${findPw.u_password}" readonly />
				</div> --%>
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="u_userid" value=""/>
		<input type="hidden" name="u_username" value=""/>
		<input type="hidden" name="u_phone" value=""/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button class="btn btn-lg btn-primary btn-block" id="loginRe" type="button">로그인 돌아가기</button>
	</form>
<script>
	$(function(){
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#loginRe").click(function(){
			location.href="/login";
		});
		
		$("#findId").click(function(event){
			var u_userid;
	 		var u_username =$("#u_username1").val();
	 		var u_phone = $("#u_phone1").val();
	 		
	 		var regId = /^[a-zA-Z0-9]{4,12}$/;
	 		var regName = /^[가-힝a-zA-Z]{2,}$/;
	 		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;

			
			if(u_username == '') {
	 			$('i[id="u_username1"]').html("이름을 입력하세요");
	 			$("#u_username1").focus();
	 			return false;
	 		} else if(!regName.test(u_username)) {
	 			$('i[id="u_username1"]').html("이름을 형식을 확인하세요");
	 			$("#u_username1").focus();
	 			return false;
	 		} else if(u_phone == '') {
	 			$('i[id="u_phone1"]').html("전화번호를 입력하세요");
	 			$("#u_phone1").focus();
	 			return false;
	 		} else if(!regPhone.test(u_phone)) {
	 			$('i[id="u_phone1"]').html("전화번호 형식을 확인하세요(000-0000-0000)");
	 			$("#u_phone1").focus();
	 			return false;
	 		} 
			$('input[name="u_username"]').val(u_username);
			$('input[name="u_phone"]').val(u_phone);
			
			$.ajax({
					url: "/findUser",
					type: "POST",
					dataType: "json",
					data:{
						u_username : u_username,
						u_phone : u_phone
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
	 		var u_phone = $("#u_phone2").val();
	 		
	 		var regId = /^[a-zA-Z0-9]{4,12}$/;
	 		var regName = /^[가-힝a-zA-Z]{2,}$/;
	 		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	 		
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
	 		} else if(u_phone == '') {
	 			$('i[id="u_phone2"]').html("전화번호를 입력하세요");
	 			$("#u_phone2").focus();
	 			return false;
	 		} else if(!regPhone.test(u_phone)) {
	 			$('i[id="u_phone2"]').html("전화번호 형식을 확인하세요(000-0000-0000)");
	 			$("#u_phone2").focus();
	 			return false;
	 		}
	 		
			$('input[name="u_username"]').val(u_username);
			$('input[name="u_phone"]').val(u_phone);
			$('input[name="u_userid"]').val(u_userid);
			$.ajax({
				url: "/findUserPw",
				type: "POST",
				dataType: "json",
				data:{
					u_userid : u_userid,
					u_username : u_username,
					u_phone : u_phone
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
	})
</script>
<%@include file="../design/footer.jsp" %>