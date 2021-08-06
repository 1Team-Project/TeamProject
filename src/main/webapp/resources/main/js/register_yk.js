$(function() {
	/* login.jsp */
	/* 회원가입 버튼 누르면 페이지 이동 */
		$("#regist").click(function(){
		$("#formId").attr("action", "agree");
	});
	$("#login").click(function(){
		if($("#u_userid").val() == ""){
			alert("아이디를 입력하세요");
			return false;
		} else if($("#u_password").val() == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}
	});

	
	/* register.jsp */
	$("#chkId").click(function(){
		var chkId = $('input[id="u_userid"]').val();
		var regId = /^[a-zA-Z0-9]{4,12}$/;
		alert("아이디 : " + chkId);
		if(chkId == '') {
			$('i[id="u_userid"]').html("아이디를 입력하세요");
			return false;
		} else if(!regId.test(chkId)) {
			$('i[id="u_userid"]').html("아이디 형식을 확인하세요");
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
					$('i[id="u_userid"]').html("중복된 아이디입니다.");
					return false;
				} else {
					$('i[id="u_userid"]').html("사용 가능한 아이디입니다.");
					return false;
				}
			}
		});
	});
	
	var code = null;
	$("#chkEmail").click(function(){
		var u_email = $("#u_email").val();
		var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
		
		var u_email_check = $("#u_email_check");
		var chkNum = $("#chkNum");
		
		
		
		alert("이메일 인증 : " + u_email);
		if(u_email == '') {
			$('i[id="u_email"]').html("이메일 입력하세요");
			return false;
		} else if(!regEmail.test(u_email)) {
			$('i[id="u_email"]').html("이메일 형식을 확인하세요");
			return false;
		}
		$.ajax({
			url: "/chkEmail",
			type: "POST",
			data: {
				 u_email : u_email
			},
			success: function(result){
				if(result==''){
					$('i[id="u_email"]').html("이메일 미확인");
					return false;
				} else {
					code = result;
					$('i[id="u_email"]').html("이메일 확인");
					return false;
				}
			}
		});
		
	});
	$("#chkNum").click(function(){
		var inputCode = $("#u_email_check").val();
		
		if(inputCode == code){
			$('i[id="u_email"]').html("인증번호 일치");
			checkResult.html("");
		} else {
			$('i[id="u_email"]').html("인증번호를 확인해 주세요");
		}
	});
	
	
	// ajax에서 csrf 사용을 위한 부분
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
	    if(token && header) {
	        xhr.setRequestHeader(header, token);
	    }
	});
	
	$("#signup").click(function(event){
		var u_userid = $("#u_userid").val();
		var u_password = $("#u_password").val();
		var confirm_password = $("#confirm_password").val();
		var u_username = $("#u_username").val();
		var u_email = $("#u_email").val();
		var u_phone = $("#u_phone").val();
		var u_address = $("#u_address").val();
		var u_email_check = $("#u_email_check").val();
		
		var regId = /^[a-zA-Z0-9]{4,12}$/;
		var regPw = /[a-zA-Z0-9!@#$%^&*]{8,12}$/;
		var regName = /^[가-힝a-zA-Z]{2,}$/;
		var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{3,}/i;
		var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		var regAdd = /[가-힝]{2,}$/;
		
		if(u_userid == ''){
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
	
			
		} else if(confirm_password == '') {
			$('i[id="confirm_password"]').html("비밀번호를 입력하세요.");
			$("#confirm_password").focus();
			event.preventDefault();
		} else if(!regPw.test(confirm_password)) {
			$('i[id="confirm_password"]').html("비밀번호를 형식을 확인하세요");
			$("#confirm_password").focus();
			event.preventDefault();
		} else if(u_password != confirm_password) {
			$('i[id="confirm_password"]').html("비밀번호가 다릅니다");
			$("#u_password").focus();
			event.preventDefault();
	
			
		} else if(u_username == '') {
			$('i[id="u_username"]').html("이름을 입력하세요");
			$("#u_username").focus();
			event.preventDefault();
		} else if(!regName.test(u_username)) {
			$('i[id="u_username"]').html("이름을 확인하세요");
			$("#u_username").focus();
			event.preventDefault();
	
		} else if(u_email == '') {
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
		} else if(!(u_address == '' || !regId.test(u_address))){
			$('i[id="u_address"]').html("");
			event.preventDefault();	
		} else if(u_email_check == '') {
			$('i[id="u_email"]').html("이메일을 인증해주세요");
			$("#u_email_check").focus();
			event.preventDefault();
		} else if(u_email_check != code) {
			$('i[id="u_email"]').html("이메일 인증번호를 확인하세요");
			event.preventDefault();
		}
	});
})


/* register.jsp 관련*/
/* 자바스크립트로 회원가입 양식 제작 */
/*var signup = document.getElementById("signup");
signup.addEventListener("click", function(event) {
	var u_userid = document.getElementById("u_userid");
	var u_password = document.getElementById("u_password");
	var confirm_password = document.getElementById("confirm_password");
	var u_username = document.getElementById("u_username");
	var u_email = document.getElementById("u_email");
	var u_phone = document.getElementById("u_phone");
	var u_address = document.getElementById("u_address");
	var u_email_check = document.getElementById("u_email_check");


	var regId = /^[a-zA-Z0-9]{4,12}$/;
	var regPw = /[a-zA-Z0-9!@#$%^&*]{8,12}$/;
	var regName = /^[가-힝a-zA-Z]{2,}$/;
	var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
	var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	var regAdd = /[가-힝]{2,}$/;
	
	if(u_userid.value == '') {
		$('i[id="u_userid"]').html("아이디를 입력하세요");
		u_userid.focus();
		event.preventDefault();
	} else if(!regId.test(u_userid.value)) {
		$('i[id="u_userid"]').html("아이디를 형식을 확인하세요");
		u_userid.focus();
		event.preventDefault();

	} else if(u_password.value == '') {
		$('i[id="u_password"]').html("비밀번호를 입력하세요");
		u_password.focus();
		event.preventDefault();
	} else if(!regPw.test(u_password.value)) {
		$('i[id="u_password"]').html("비밀번호를 형식을 확인하세요");
		u_password.focus();
		event.preventDefault();

		
	} else if(confirm_password.value == '') {
		$('i[id="confirm_password"]').html("비밀번호를 입력하세요.");
		confirm_password.focus();
		event.preventDefault();
	} else if(!regPw.test(confirm_password.value)) {
		$('i[id="confirm_password"]').html("비밀번호를 형식을 확인하세요");
		confirm_password.focus();
		event.preventDefault();
	} else if(u_password.value != confirm_password.value) {
		$('i[id="confirm_password"]').html("비밀번호가 다릅니다");
		u_password.focus();
		event.preventDefault();

		
	} else if(u_username.value == '') {
		$('i[id="u_username"]').html("이름을 입력하세요");
		u_username.focus();
		event.preventDefault();
	} else if(!regName.test(u_username.value)) {
		$('i[id="u_username"]').html("이름을 확인하세요");
		u_username.focus();
		event.preventDefault();

	} else if(u_email.value == '') {
		$('i[id="u_email"]').html("이메일을 입력하세요");
		u_email.focus();
		event.preventDefault();
	} else if(!regEmail.test(u_email.value)) {
		$('i[id="u_email"]').html("이메일 형식을 확인하세요");
		u_email.focus();
		event.preventDefault();
		
		
	} else if(u_phone.value == '') {
		$('i[id="u_phone"]').html("전화번호를 입력하세요");
		u_phone.focus();
		event.preventDefault();
	} else if(!regPhone.test(u_phone.value)) {
		$('i[id="u_phone"]').html("전화번호 형식을 확인하세요(000-0000-0000)");
		u_phone.focus();
		event.preventDefault();

		
	} else if(u_address.value == '') {
		$('i[id="u_address"]').html("주소를 입력하세요");
		u_address.focus();
		event.preventDefault();
	} else if(!regAdd.test(u_address.value)) {
		$('i[id="u_address"]').html("주소를 2자리이상 입력하세요");
		u_address.focus();
		event.preventDefault();
	} else if(!(u_address.value == '' || !regId.test(u_address.value))){
		$('i[id="u_address"]').html("");
		event.preventDefault();	
	} else if(u_email_check.value == '') {
		$('i[id="u_email"]').html("이메일을 인증해주세요");
		u_email_check.focus();
		event.preventDefault();
	} 

})*/