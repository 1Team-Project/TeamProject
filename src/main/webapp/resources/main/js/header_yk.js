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
