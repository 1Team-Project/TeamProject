/* header.jsp */
$(function() {
	$("#logoutDo").click(function(){
		var logout = confirm("�α׾ƿ� �Ͻðڽ��ϱ�?");
		if(logout==true){
			alert("�ȳ���������")
			location.href="/logout";
		} else {
			alert("�α����� �����˴ϴ�.")
			return false;
		}
	});
}) 

/* main.jsp */
setInterval(function(){ 
	$('#slide1>ul').delay(2500); 
	$('#slide1>ul').animate({marginLeft: "-1200px"}); 		
	$('#slide1>ul').delay(2500); $('#slide1>ul').animate({marginLeft: "-2400px"}) 
	$('#slide1>ul').delay(2500); $('#slide1>ul').animate({marginLeft: "0px"}) 
	});

