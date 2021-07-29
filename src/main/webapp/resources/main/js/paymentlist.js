$(function(){
	$(".cancel_btn").click(function(e){
		
		e.preventDefault();
		
		var check = confirm("정말 결제 취소를 하시겠습니까?");
		
		if(check==true){

			var form_c = $("#cancel_form");
			
			var code = $(this).attr("href");
			
			form_c.append("<input type='hidden' name='success_code' value='"+code+"'>");
			
			form_c.submit();

		} else {
			alert("요청이 취소되었습니다.")
			return false;
		}
		
	})
})