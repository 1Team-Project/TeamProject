/* header.jsp */
$(function() {
	$("#logoutDo").click(function(){
		var logout = confirm("정말 로그아웃 하시겠습니까?");
		if(logout==true){

			alert("안녕히가세요")
			$("#logoutForm").submit();

		} else {
			alert("로그아웃이 취소되었습니다.")
			return false;
		}
	});
	//버튼 클릭시
	$("#move-to-mypage").click(function(){
		
		
		location.href='loginMypage';
	
})

		//상품전체
		var productForm = $("#productForm")
		$(".product-item").click(function(e){
				e.preventDefault(); //타이틀 a 속성 막기
				
				productForm.attr("action","/product/productlist");
				productForm.submit();
			})

				

	var goForm = $("#goForm");		 		

	//카테고리 클릭시
	$(".clickview").click(function(e){
		e.preventDefault(); //타이틀 속성 a 막기
		
		
		goForm.append("<input type='hidden' name='pc_code' value='"+$(this).attr('href')+"'>");
		goForm.attr("action","/product/catelist");
		//console.log(catelist);
		goForm.submit();
	})
	
	
	
	

});
	
