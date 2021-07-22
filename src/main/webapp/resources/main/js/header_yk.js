/* header.jsp */
$(function() {
	$("#logoutDo").click(function(){
		var logout = confirm("濡�洹몄���� ����寃��듬��源�?");
		if(logout==true){
<<<<<<< HEAD
			alert("안녕히가세요")
			$("#logoutForm").submit();
			
			
=======
			alert("������媛��몄��")
			location.href="/logout";
>>>>>>> refs/remotes/origin/nahyun
		} else {
			alert("濡�洹몄�몄�� ��吏��⑸����.")
			return false;
		}
	});
	//버튼 클릭시
	$("#move-to-mypage").click(function(){
		
		
		location.href='loginMypage';
	});
	
	
	//카테고리 이름 클릭시
	$(".clickview").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
		//actionForm에 pc_code 값을 추가하여 actionForm 보내기
		let pnumval = $(this).attr('href');
		console.log(pnumval)
		
		$.ajax({
			//url:'/product/catelist', //도착지
			type:'post',
			processData:false,
			contentType:false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:pnumval,
			success:function(result){
				console.log("아작스성공"+result);
				actionForm.append("<input type='hidden' name='pc_code' value='"+pnumval+"'>");
				actionForm.attr('action','catelist');
				actionForm.submit();
			},
			error:function(xhr,status,error){
				console.log("아작스에러");
			}
		})
		
	})
	
}) 
