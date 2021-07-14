/* header.jsp 관련*/
$(function() {
	$("#logoutDo").click(function(){
		var logout = confirm("로그아웃 하시겠습니까?");
		if(logout==true){
			alert("안녕히가세요")
			location.href="/logout";
		} else {
			alert("로그인이 유지됩니다.")
			return false;
		}
	});
}) 


/* 자바스크립트로 회원가입 양식 제작 */
/* register.jsp 관련*/
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
	var regName = /^[가-힝a-zA-Z]{2,}$/;
	var regEmail = /[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z0-9]{2,}/i;
	var regPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	var regAdd = /[가-힝]{2,}$/;
	
	if(userid.value == '') {
		alert("아이디를 입력하세요");
		userid.focus();
		event.preventDefault();
	} else if(!regId.test(userid.value)) {
		alert("아이디를 형식을 확인하세요");
		userid.focus();
		event.preventDefault();
	} else if(password.value == '') {
		alert("비밀번호를 입력하세요");
		password.focus();
		event.preventDefault();
	} else if(!regPw.test(password.value)) {
		alert("비밀번호를 형식을 확인하세요");
		password.focus();
		event.preventDefault();
	} else if(confirm_password.value == '') {
		alert("비밀번호를 입력하세요");
		confirm_password.focus();
		event.preventDefault();
	} else if(!regPw.test(confirm_password.value)) {
		alert("비밀번호를 형식을 확인하세요");
		confirm_password.focus();
		event.preventDefault();
	} else if(password.value != confirm_password.value) {
		alert("비밀번호가 다릅니다");
		password.focus();
		event.preventDefault();
	} else if(username.value == '') {
		alert("이름을 입력하세요");
		username.focus();
		event.preventDefault();
	} else if(!regName.test(username.value)) {
		alert("이름 형식을 확인하세요");
		username.focus();
		event.preventDefault();
	} else if(email.value == '') {
		alert("이메일을 입력하세요");
		email.focus();
		event.preventDefault();
	} else if(!regEmail.test(email.value)) {
		alert("이메일 형식을 확인하세요");
		email.focus();
		event.preventDefault();
	} else if(phone.value == '') {
		alert("전화번호를 입력하세요");
		phone.focus();
		event.preventDefault();
	} else if(!regPhone.test(phone.value)) {
		alert("전화번호 형식을 확인하세요");
		phone.focus();
		event.preventDefault();
	} else if(address.value == '') {
		alert("주소를 입력하세요");
		address.focus();
		event.preventDefault();
	} else if(!regAdd.test(address.value)) {
		alert("주소 형식을 확인하세요");
		address.focus();
		event.preventDefault();
	} 
})

