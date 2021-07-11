<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form action="regist2" method="post">
		<div class="regist-Form">
			<div class="form-group">
		  		<label for="userid" style="font-family: naBrush">���̵�</label>
		  		<div class="regist-margin">
		    		<input type="text" name="userid" id="userid" class="form-control-regist" placeholder="����, ���� 4 ~12�ڸ�" />
		    		<small id="userid" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="pass1" style="font-family: naBrush">��й�ȣ</label>
		  		<div class="regist-margin">
		    		<input type="password" name="password" id="password" class="form-control-regist" placeholder="����, ���� 8 ~12�ڸ�, Ư������ !@#$%^&* ��밡��" />
		    		<small id="password" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="pass2" style="font-family: naBrush">��й�ȣ Ȯ��</label>
		  		<div class="regist-margin">
		    		<input type="password" name="confirm_password" id="confirm_password" class="form-control-regist" placeholder="����, ���� 8 ~12�ڸ�, Ư������ !@#$%^&* ��밡��" />
		    		<small id="confirm_password" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="username" style="font-family: naBrush">��    ��</label>
		  		<div class="regist-margin">
		    		<input type="text" name="username" id="username" class="form-control-regist" placeholder="�̸��� �Է��ϼ���" />
		    		<small id="username" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="email" style="font-family: naBrush">�̸���</label>
		  		<div class="regist-margin">
		    		<input type="text" name="email" id="email" class="form-control-regist" placeholder="example@gmail.com" />
		    		<small id="email" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="phone" style="font-family: naBrush">��ȭ��ȣ</label>
		  		<div class="regist-margin">
		    		<input type="text" name="phone" id="phone" class="form-control-regist" placeholder="��ȭ��ȣ�� �Է��ϼ���" />
		    		<small id="phone" class="text-info"></small>
		  		</div>
			</div>
			<div class="form-group">
		  		<label for="address" style="font-family: naBrush">��    ��</label>
		  		<div class="regist-margin">
		    		<input type="text" name="address" id="address" class="form-control-regist" placeholder="�ּҸ� �Է��ϼ���" />
		    		<small id="address" class="text-info"></small>
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
		var regName = /^[��-��a-zA-Z]{2,}$/;
		var regEmail = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.]a-z0-9]{2,}/i;
		var regPhone = /[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
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
		} else if(!regEmail.test(phone.value)) {
			alert("��ȭ��ȣ ������ Ȯ���ϼ���");
			phone.focus();
			event.preventDefault();
		} else if(address.value == '') {
			alert("�ּҸ� �Է��ϼ���");
			address.focus();
			event.preventDefault();
		} else if(!regAdd.test(address.value)) {
			alert("��ȭ��ȣ ������ Ȯ���ϼ���");
			address.focus();
			event.preventDefault();
		} 
	})
</script>
<%@include file="../design/footer.jsp" %>
