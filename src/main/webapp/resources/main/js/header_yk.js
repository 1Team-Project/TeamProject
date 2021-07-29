/* header.jsp */
$(function() {
	$("#logoutDo").click(function(){
		var logout = confirm("濡�洹몄���� ����寃��듬��源�?");
		if(logout==true){
			alert("������媛��몄��")
			location.href="/logout";
		} else {
			alert("濡�洹몄�몄�� ��吏��⑸����.")
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

				

		 		

	//카테고리 클릭시
	$(".cate").click(function(e){
		e.preventDefault(); //타이틀 속성 a 막기
<<<<<<< HEAD
		//var value=$(".cate").attr('value');
		console.log(value)
		//actionForm에 bno값을 추가하여 actionForm 보내기
		//actionForm.append("<input type='hidden' name='pc_code' value='"+value+"'>");
		actionForm.append("<input type='hidden' name='pc_code' value='"+$(this).attr('href')+"'>");
		actionForm.attr("action","catelist");
		console.log(catelist)
		//actionForm.submit();
=======
		
		
		goForm.append("<input type='hidden' name='pc_code' value='"+$(this).attr('href')+"'>");
		goForm.attr("action","/product/catelist");
		//console.log(catelist);
		goForm.submit();
>>>>>>> refs/remotes/origin/seunghyun
	})
	
	
	
	

});