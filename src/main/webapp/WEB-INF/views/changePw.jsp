<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form id="changeForm" action="" method="post">
		<div class="regist-Form">
			<div class="form-group">
				<h2>비밀번호 변경</h2>
				<p></p>
		  		<label for="u_userid" style="font-family: naBrush">아이디</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_userid" id="u_userid" class="form-control-regist" value="${findId.u_userid}" readonly />
		  		</div>
		    	<i id="u_userid" class="text-info"></i>
				</div>

			<div class="form-group">
		  		<label for="u_password" style="font-family: naBrush">비밀번호</label>
		  		<div class="regist-margin">
		    		<input type="password" name="u_password" id="u_password" class="form-control-regist" placeholder="영문, 숫자 8 ~12자리, 특수문자 !@#$%^&* 사용가능" />
		  		</div>
	    		<i id="u_password" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="confirm_password" style="font-family: naBrush">비밀번호 확인</label>
		  		<div class="regist-margin">
		    		<input type="password" name="new_password" id="new_password" class="form-control-regist" placeholder="영문, 숫자 8 ~12자리, 특수문자 !@#$%^&* 사용가능" />
		  		</div>
	    		<i id="new_password" class="text-info"></i>
			</div>
			

			<div class="form-group">
		  		<button type="button" id="checkPw" class="btn btn-primary" style="font-size:20px">입 력</button>
		  		<button type="reset" class="btn btn-danger" style="font-size:20px" onclick="location.href='/'">취 소</button>
		    </div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
<script>
	$(function(){
		$("#checkPw").click(function(event){

			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
	
			var u_userid = $("#u_userid").val();
			var u_password = $("#u_password").val();
			var new_password = $("#new_password").val();
			$('input[name="u_username"]').val(u_userid);
			var regId = /^[a-zA-Z0-9]{4,12}$/;
			var regPw = /[a-zA-Z0-9!@#$%^&*]{8,12}$/;
	
			
			if(u_userid == '') {
				$('i[id="u_userid"]').html("아이디를 입력하세요");
				$("#u_userid").focus();
				event.preventDefault();
			} else if(!regId.test(u_userid)) {
				$('i[id="u_userid"]').html("아이디를 형식을 확인하세요");
				$("#u_userid").focus();
				event.preventDefault();
	
			} else if(u_password == '') {
				$('i[id="u_password"]').html("비밀번호를 입력하세요");
				$("#u_password").focus();
				event.preventDefault();
			} else if(!regPw.test(u_password)) {
				$('i[id="u_password"]').html("비밀번호를 형식을 확인하세요");
				$("#u_password").focus();
				event.preventDefault();
	
				
			} else if(new_password == '') {
				$('i[id="new_password"]').html("비밀번호를 입력하세요.");
				$("#new_password").focus();
				event.preventDefault();
			} else if(!regPw.test(new_password)) {
				$('i[id="new_password"]').html("비밀번호를 형식을 확인하세요");
				$("#new_password").focus();
				event.preventDefault();
			} else if(u_password != new_password) {
				$('i[id="new_password"]').html("비밀번호가 다릅니다");
				$("#u_password").focus();
				event.preventDefault();
			}
			
			$.ajax({
				url: "/idCheck",
				type: "POST",
				dataType: "json",
				data:{
					u_userid : u_userid,
					u_password : u_password,
					new_password : new_password
				},
				beforeSend:function(xhr){
				   xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				success: function(result){
					if(result){
						$("#changeForm").attr("action", "updatePw").submit();
						alert("비밀번호가 변경되었습니다.");
					} else {
						/* if(confirm("아이디가 없습니다. 가입하시겠습니까?")){
							$("#findUserForm").attr("action", "agree").submit();
						} */
						alert("오류발생")
						return false;
					}
				}
	 		});
			
		});
		
	})
</script>
<%@include file="../design/footer.jsp" %>