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
		var u_userid = document.getElementById("u_userid");
		var u_password = document.getElementById("u_password");
		var u_confirm_password = document.getElementById("u_confirm_password");
		var u_username = document.getElementById("u_username");
		var u_email = document.getElementById("u_email");
		var u_phone = document.getElementById("u_phone");
		var u_address = document.getElementById("u_address");
		
		var regId = /^[a-zA-Z0-9]{4,12}$/;
		var regPw = /[a-zA-Z0-9!@#$%^&*]{8,12}$/;
		var regName = /^[��-��a-zA-Z]{2,}$/;
		var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		var regAdd = /[��-��]{2,}$/;
		
		if(u_userid.value == '') {
			alert("���̵� �Է��ϼ���");
			u_userid.focus();
			event.preventDefault();
		} else if(!regId.test(u_userid.value)) {
			alert("���̵� ������ Ȯ���ϼ���");
			u_userid.focus();
			event.preventDefault();
		} else if(u_password.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
			u_password.focus();
			event.preventDefault();
		} else if(!regPw.test(u_password.value)) {
			alert("��й�ȣ�� ������ Ȯ���ϼ���");
			u_password.focus();
			event.preventDefault();
		} else if(u_confirm_password.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
			u_confirm_password.focus();
			event.preventDefault();
		} else if(!regPw.test(u_confirm_password.value)) {
			alert("��й�ȣ�� ������ Ȯ���ϼ���");
			u_confirm_password.focus();
			event.preventDefault();
		} else if(u_password.value != u_confirm_password.value) {
			alert("��й�ȣ�� �ٸ��ϴ�");
			u_password.focus();
			event.preventDefault();
		} else if(u_username.value == '') {
			alert("�̸��� �Է��ϼ���");
			u_username.focus();
			event.preventDefault();
		} else if(!regName.test(u_username.value)) {
			alert("�̸� ������ Ȯ���ϼ���");
			u_username.focus();
			event.preventDefault();
		} else if(u_email.value == '') {
			alert("�̸����� �Է��ϼ���");
			u_email.focus();
			event.preventDefault();
		} else if(!regEmail.test(u_email.value)) {
			alert("�̸��� ������ Ȯ���ϼ���");
			u_email.focus();
			event.preventDefault();
		} else if(u_phone.value == '') {
			alert("��ȭ��ȣ�� �Է��ϼ���");
			u_phone.focus();
			event.preventDefault();
		} else if(!regPhone.test(u_phone.value)) {
			alert("��ȭ��ȣ ������ Ȯ���ϼ���");
			u_phone.focus();
			event.preventDefault();
		} else if(u_address.value == '') {
			alert("�ּҸ� �Է��ϼ���");
			u_address.focus();
			event.preventDefault();
		} else if(!regAdd.test(u_address.value)) {
			alert("�ּ� ������ Ȯ���ϼ���");
			u_address.focus();
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
						return $("#u_userid").val();
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
