/* header.jsp */
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
	//버튼 클릭시
	$("#move-to-mypage").click(function(){
		
		
		location.href='loginMypage';
	});
}) 
