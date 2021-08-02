<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="" action="" method="post">
		<div class="login-Form">
			<div class="find_ID">
				<div class="col-md-1"></div>
				<h1 class="h1" style="font-family: naBrush">아이디 찾기</h1>
				<div class="login-margin">
					<label for="u_username" class="sr-only">회원 이름</label>
					<input type="text" id="u_username" name="u_username" class="form-control-login" placeholder="이름 입력해 주세요" />
				</div> 
				<i id="u_username" class="text-info"></i>
				<div class="login-margin">
					<label for="u_phone" class="sr-only">전화번호</label>
					<input type="text" id="u_phone" name="u_phone" class="form-control-login" placeholder="전화번호를 입력해 주세요" />
				</div>
				<i id="u_phone" class="text-info"></i>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="findId">아이디 확인</button>
			<br/>
			<br/>
			<div class="find_PW">
				<div class="col-md-1"></div>
				<h1 class="h1" style="font-family: naBrush">비밀번호 변경</h1>
				<div class="login-margin">
					<label for="u_userid" class="sr-only">로그인 아이디</label>
					<input type="text" id="u_userid" name="u_userid" class="form-control-login" placeholder="아이디를 입력해 주세요" />
				</div> 
				<i id="u_userid" class="text-info"></i>
				<div class="login-margin">
					<label for="u_username" class="sr-only">회원 이름</label>
					<input type="text" id="u_username" name="u_username" class="form-control-login" placeholder="이름 입력해 주세요" />
				</div> 
				<i id="u_username" class="text-info"></i>
				<div class="login-margin">
					<label for="u_phone" class="sr-only">전화번호</label>
					<input type="text" id="u_phone" name="u_phone" class="form-control-login" placeholder="전화번호를 입력해 주세요" />
				</div>
				<i id="u_phone" class="text-info"></i>
				<div class="login-margin">
					<button class="btn btn-lg btn-primary btn-block" id="certify">번호 인증</button>
				</div>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="changePW">비밀번호 변경</button>
		</div>
	</form>
<script>
	$(function(){
		$("#findId").click(function(event){
	 		var u_username =$("#u_username").val();
	 		var u_phone = $("#u_phone").val();
	 		
	 		var regId = /^[a-zA-Z0-9]{4,12}$/;
	 		var regName = /^[가-힝a-zA-Z]{2,}$/;
	 		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	 		
			if(u_username == '') {
	 			$('i[id="u_username"]').html("이름을 입력하세요");
	 			$("#u_username").focus();
	 			event.preventDefault();
	 		} else if(!regName.test(u_username)) {
	 			$('i[id="u_username"]').html("이름을 형식을 확인하세요");
	 			$("#u_username").focus();
	 			event.preventDefault();
	 		} else if(u_phone == '') {
	 			$('i[id="u_phone"]').html("전화번호를 입력하세요");
	 			$("#u_phone").focus();
	 			event.preventDefault();
	 		} else if(!regPhone.test(u_phone)) {
	 			$('i[id="u_phone"]').html("전화번호 형식을 확인하세요(000-0000-0000)");
	 			$("#u_phone").focus();
	 			event.preventDefault();
	 		}

/*  			$.ajax({
				url: "/pwdCheck",
				type: "POST",
				dataType: "json",
				data:$("#modifyForm").serialize(),
				beforeSend:function(xhr){
					   xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success: function(result){
					if(result== 0){
						alert("현재 비밀번호를 확인하세요");
						return false;
					} else {
						$("#modifyForm").submit();
						alert("정보 수정이 완료되었습니다..");
					}
				}
			}); */
	 	});
		$("#changePW").click(function(event){
			var u_userid = $("#u_userid").val();
	 		var u_username =$("#u_username").val();
	 		var u_phone = $("#u_phone").val();
	 		
	 		var regId = /^[a-zA-Z0-9]{4,12}$/;
	 		var regName = /^[가-힝a-zA-Z]{2,}$/;
	 		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	 		
			if(u_userid == '') {
	 			$('i[id="u_userid"]').html("아이디를 입력하세요");
	 			$("#u_userid").focus();
	 			event.preventDefault();
	 		} else if(!regId.test(u_userid)) {
	 			$('i[id="u_userid"]').html("아이디 형식을 확인하세요");
	 			$("#u_userid").focus();
	 			event.preventDefault();
	 		} else if(u_username == '') {
	 			$('i[id="u_username"]').html("이름을 입력하세요");
	 			$("#u_username").focus();
	 			event.preventDefault();
	 		} else if(!regName.test(u_username)) {
	 			$('i[id="u_username"]').html("이름 형식을 확인하세요");
	 			$("#u_username").focus();
	 			event.preventDefault();
	 		} else if(u_phone == '') {
	 			$('i[id="u_phone"]').html("전화번호를 입력하세요");
	 			$("#u_phone").focus();
	 			event.preventDefault();
	 		} else if(!regPhone.test(u_phone)) {
	 			$('i[id="u_phone"]').html("전화번호 형식을 확인하세요(000-0000-0000)");
	 			$("#u_phone").focus();
	 			event.preventDefault();
	 		}

/*  			$.ajax({
				url: "/pwdCheck",
				type: "POST",
				dataType: "json",
				data:$("#modifyForm").serialize(),
				beforeSend:function(xhr){
					   xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success: function(result){
					if(result== 0){
						alert("현재 비밀번호를 확인하세요");
						return false;
					} else {
						$("#modifyForm").submit();
						alert("정보 수정이 완료되었습니다..");
					}
				}
			}); */
	 	});
	})
</script>
<%@include file="../design/footer.jsp" %>