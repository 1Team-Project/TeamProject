$(function() {
	/* login.jsp */
	/* ȸ������ ��ư ������ ������ �̵� */
	$("#regist").click(function(){
		$("#formId").attr("action", "agree");
	});
	$("#login").click(function(){
		if($("#u_userid").val() == ""){
			alert("���̵� �Է��ϼ���");
			return false;
		} else if($("#u_password").val() == ""){
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
	});
	
	/* register.jsp */
	$("#checkId").click(function(){
		var chkId = $('input[name="u_userid"]').val();
		var regId = /^[a-zA-Z0-9]{4,12}$/;
		alert("���̵� : " + chkId);
		if(chkId == '') {
			$('i[id="u_userid"]').html("���̵� �Է��ϼ���");
			return false;
		} else if(!regId.test(chkId)) {
			$('i[id="u_userid"]').html("���̵� ������ Ȯ���ϼ���");
			return false;
		}
		$.ajax({
			url: "/checkId",
			type: "POST",
			data: {
				 u_userid : chkId
			},
			success: function(result){
				if(result=='false'){
					$('i[id="u_userid"]').html("�ߺ��� ���̵��Դϴ�.");
					return false;
				} else {
					$('i[id="u_userid"]').html("��� ������ ���̵��Դϴ�.");
					return false;
				}
			}
		});
	});
})


/* register.jsp ����*/
/* �ڹٽ�ũ��Ʈ�� ȸ������ ��� ���� */
var signup = document.getElementById("signup");
signup.addEventListener("click", function(event) {
	var u_userid = document.getElementById("u_userid");
	var u_password = document.getElementById("u_password");
	var confirm_password = document.getElementById("confirm_password");
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
		$('i[id="u_userid"]').html("���̵� �Է��ϼ���");
		u_userid.focus();
		event.preventDefault();
	} else if(!regId.test(u_userid.value)) {
		$('i[id="u_userid"]').html("���̵� ������ Ȯ���ϼ���");
		u_userid.focus();
		event.preventDefault();

	} else if(u_password.value == '') {
		$('i[id="u_password"]').html("��й�ȣ�� �Է��ϼ���");
		u_password.focus();
		event.preventDefault();
	} else if(!regPw.test(u_password.value)) {
		$('i[id="u_password"]').html("��й�ȣ�� ������ Ȯ���ϼ���");
		u_password.focus();
		event.preventDefault();

		
	} else if(confirm_password.value == '') {
		$('i[id="confirm_password"]').html("��й�ȣ�� �Է��ϼ���.");
		confirm_password.focus();
		event.preventDefault();
	} else if(!regPw.test(confirm_password.value)) {
		$('i[id="confirm_password"]').html("��й�ȣ�� ������ Ȯ���ϼ���");
		confirm_password.focus();
		event.preventDefault();
	} else if(u_password.value != confirm_password.value) {
		$('i[id="confirm_password"]').html("��й�ȣ�� �ٸ��ϴ�");
		u_password.focus();
		event.preventDefault();

		
	} else if(u_username.value == '') {
		$('i[id="u_username"]').html("�̸��� �Է��ϼ���");
		u_username.focus();
		event.preventDefault();
	} else if(!regName.test(u_username.value)) {
		$('i[id="u_username"]').html("�̸��� Ȯ���ϼ���");
		u_username.focus();
		event.preventDefault();

	} else if(u_email.value == '') {
		$('i[id="u_email"]').html("�̸����� �Է��ϼ���");
		u_email.focus();
		event.preventDefault();
	} else if(!regEmail.test(u_email.value)) {
		$('i[id="u_email"]').html("�̸��� ������ Ȯ���ϼ���");
		u_email.focus();
		event.preventDefault();
		
		
	} else if(u_phone.value == '') {
		$('i[id="u_phone"]').html("��ȭ��ȣ�� �Է��ϼ���");
		u_phone.focus();
		event.preventDefault();
	} else if(!regPhone.test(u_phone.value)) {
		$('i[id="u_phone"]').html("��ȭ��ȣ ������ Ȯ���ϼ���(000-0000-0000)");
		u_phone.focus();
		event.preventDefault();

		
	} else if(u_address.value == '') {
		$('i[id="u_address"]').html("�ּҸ� �Է��ϼ���");
		u_address.focus();
		event.preventDefault();
	} else if(!regAdd.test(u_address.value)) {
		$('i[id="u_address"]').html("�ּҸ� 2�ڸ��̻� �Է��ϼ���");
		u_address.focus();
		event.preventDefault();
	} else if(!(u_address.value == '' || !regId.test(u_address.value))){
		$('i[id="u_address"]').html("");
		event.preventDefault();	
	}
/*	} else if(!(u_address.value == '' || !regId.test(u_address.value))){
		$('i[id="u_address"]').html("");
		event.preventDefault();	
	}*/
	
	
	
	/*leave.jsp*/
	$("#leave").click(function(){
		$("#formleave").attr("action", "agree");
	});
	//��й�ȣ �ۼ�x=>ȸ��Ż�� ��ư ������
	$("#leave").click(function(){
		if($("#u_password").val() == ""){
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
	});
})

