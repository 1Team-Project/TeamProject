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
		  		<label for="u_address" style="font-family: naBrush">등   급</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_address" id="u_address" class="form-control-regist" value="${userA.u_auth}" readonly/>
		  		</div>
	    		<i id="u_address" class="text-info"></i>
			</div>
			
			<div class="form-group">
	            <button type="button" id="mo_update"class="btn btn-info">회원정보수정</button>
	            <button type="button" id="mo_cancel" class="btn btn-warning">취 소</button>
	            <button type="button" id="mo_leaveCo"class="btn btn-secondary">회원 강제 탈퇴</button>
		    </div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
<script>
	$(function(){
		$("#mo_cancel").click(function(){
			alert("정보 수정을 취소합니다.");
			location.href="/loginMypage";
		});
		
	 	$("#mo_leaveCo").click(function(){
	 		$("#adminModify").submit();
		});
	 	
	 	$("#mo_update").click(function(event){
 	 		var u_password = $("#u_password").val();
	 		var new_password = $("#new_password").val();
	 		var confirm_password = $("#confirm_password").val();
	 		var u_email = $("#u_email").val();
	 		var u_phone = $("#u_phone").val();
	 		var u_address = $("#u_address").val();
	 		
	 		var regPw = /[a-zA-Z0-9!@#$%^&*]{8,12}$/;
	 		var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
	 		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	 		var regAdd = /[가-힝]{2,}$/;
	 		
	 		if(u_email == '') {
	 			$('i[id="u_email"]').html("이메일을 입력하세요");
	 			$("#u_email").focus();
	 			event.preventDefault();
	 		} else if(!regEmail.test(u_email)) {
	 			$('i[id="u_email"]').html("이메일 형식을 확인하세요");
	 			$("#u_email").focus();
	 			event.preventDefault();
	 		} else if(u_phone == '') {
	 			$('i[id="u_phone"]').html("전화번호를 입력하세요");
	 			$("#u_phone").focus();
	 			event.preventDefault();
	 		} else if(!regPhone.test(u_phone)) {
	 			$('i[id="u_phone"]').html("전화번호 형식을 확인하세요(000-0000-0000)");
	 			$("#u_phone").focus();
	 			event.preventDefault();
	 		} else if(u_address == '') {
	 			$('i[id="u_address"]').html("주소를 입력하세요");
	 			$("#u_address").focus();
	 			event.preventDefault();
	 		} else if(!regAdd.test(u_address)) {
	 			$('i[id="u_address"]').html("주소를 2자리이상 입력하세요");
	 			$("#u_address").focus();
	 			event.preventDefault();
	 		}
 			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
 			$.ajax({
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
			});
	 	});
	 })

</script>
<%@include file="../design/footer.jsp" %>