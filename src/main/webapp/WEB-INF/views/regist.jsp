<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form action="/regist2" method="post">
		<div class="regist-Form">
			<div class="form-group">
		  		<label for="u_userid" style="font-family: naBrush">���̵�</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_userid" id="u_userid" class="form-control-regist" placeholder="����, ���� 4 ~12�ڸ�" />
		    		<small id="u_userid" class="text-info"></small>
		    		<button type="text" id="checkId" class="btn btn-primary" style="font-size:20px">�ߺ�Ȯ��</button>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="u_password" style="font-family: naBrush">��й�ȣ</label>
		  		<div class="regist-margin">
		    		<input type="password" name="u_password" id="u_password" class="form-control-regist" placeholder="����, ���� 8 ~12�ڸ�, Ư������ !@#$%^&* ��밡��" />
		    		<small id="u_password" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="confirm_password" style="font-family: naBrush">��й�ȣ Ȯ��</label>
		  		<div class="regist-margin">
		    		<input type="password" name="confirm_password" id="confirm_password" class="form-control-regist" placeholder="����, ���� 8 ~12�ڸ�, Ư������ !@#$%^&* ��밡��" />
		    		<small id="confirm_password" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="u_username" style="font-family: naBrush">��    ��</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_username" id="u_username" class="form-control-regist" placeholder="�̸��� �Է��ϼ���" />
		    		<small id="u_username" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="u_email" style="font-family: naBrush">�̸���</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_email" id="u_email" class="form-control-regist" placeholder="example@gmail.com" />
		    		<small id="u_email" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="u_phone" style="font-family: naBrush">��ȭ��ȣ</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_phone" id="u_phone" class="form-control-regist" placeholder="��ȭ��ȣ�� �Է��ϼ���" />
		    		<small id="u_phone" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="u_address" style="font-family: naBrush">��    ��</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_address" id="u_address" class="form-control-regist" placeholder="�ּҸ� �Է��ϼ���" />
		    		<small id="u_address" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<button type="submit" id="signup" class="btn btn-primary" style="font-size:20px">�� ��</button>
		  		<button type="reset" class="btn btn-danger" style="font-size:20px" onclick="location.href='/'">�� ��</button>
		    </div>
	    </div>
	</form>

<script>
	/* �ڹٽ�ũ��Ʈ�� ȸ������ ��� ���� */
	var signup = document.getElementById("signup");
	signup.addEventListener("click", function() {
		var userid = document.getElementById("userid");
		var password = document.getElementById("password");
		var confirm_password = document.getElementById("confirm_password");
		var username = document.getElementById("username");
		var email = document.getElementById("email");
		var phone = document.getElementById("phone");
		var address = document.getElementById("address");
		
		var regId = /^[a-zA-Z0-9]{4,12}$/;
		var regPw = /[a-zA-Z0-9!@#$%^&*]{8,12}$/;
		var regName = /^[��-��a-zA-Z]{2,}$/;
		var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		var regAdd = /[��-��]{2,}$/;
		
		if(userid.value == '') {
			alert("���̵� �Է��ϼ���");
			userid.focus();
			event.preventDefault();
		} else if(!regId.test(userid.value)) {
			alert("���̵� ������ Ȯ���ϼ���");
			userid.focus();
			event.preventDefault();
		} else if(password.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
			password.focus();
			event.preventDefault();
		} else if(!regPw.test(password.value)) {
			alert("��й�ȣ�� ������ Ȯ���ϼ���");
			password.focus();
			event.preventDefault();
		} else if(confirm_password.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
			confirm_password.focus();
			event.preventDefault();
		} else if(!regPw.test(confirm_password.value)) {
			alert("��й�ȣ�� ������ Ȯ���ϼ���");
			confirm_password.focus();
			event.preventDefault();
		} else if(password.value != confirm_password.value) {
			alert("��й�ȣ�� �ٸ��ϴ�");
			password.focus();
			event.preventDefault();
		} else if(username.value == '') {
			alert("�̸��� �Է��ϼ���");
			username.focus();
			event.preventDefault();
		} else if(!regName.test(username.value)) {
			alert("�̸� ������ Ȯ���ϼ���");
			username.focus();
			event.preventDefault();
		} else if(email.value == '') {
			alert("�̸����� �Է��ϼ���");
			email.focus();
			event.preventDefault();
		} else if(!regEmail.test(email.value)) {
			alert("�̸��� ������ Ȯ���ϼ���");
			email.focus();
			event.preventDefault();
		} else if(phone.value == '') {
			alert("��ȭ��ȣ�� �Է��ϼ���");
			phone.focus();
			event.preventDefault();
		} else if(!regPhone.test(phone.value)) {
			alert("��ȭ��ȣ ������ Ȯ���ϼ���");
			phone.focus();
			event.preventDefault();
		} else if(address.value == '') {
			alert("�ּҸ� �Է��ϼ���");
			address.focus();
			event.preventDefault();
		} else if(!regAdd.test(address.value)) {
			alert("�ּ� ������ Ȯ���ϼ���");
			address.focus();
			event.preventDefault();
		} 
	})

	$(function(){
		$("#checkId").onclick(function(){
			$("#formId").attr("action", "checkId");
			$.ajax({
				url: "/checkId",
				type: "POST",
				data: userid,
				success: function(result){
					if(result=='false'){
						alert("�ߺ����̵��Դϴ�.");
					} else {
						alert("��� �����մϴ�.");
						return $("#userid").val();
					}
				}
			})
		})
	})
/* 	$(function(){
		var overlapError = '${overlapError}';
		var regiError = '${regiError}'
		var pass = '${pass}';
		if(overlapError) {
			alert(overlapError)
		} else if(regiError) {
			alert(regiError)
		} else if(pass) {
			alert(pass)
		}
	}) */
	
</script>
<%@include file="../design/footer.jsp" %>
