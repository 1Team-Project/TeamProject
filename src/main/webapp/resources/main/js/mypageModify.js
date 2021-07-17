/**
 * mypage-modify.jsp
 */
$(function(){
	$("#modifyForm").validate({
		rules:{
			
			u_password:{
				required:true,
				validPwd:true
			},
			confirm_password:{
				required:true,
				validPwd:true,
				equalTo:"#u_password"
			},
		
		},
		messages:{
			u_password:{
				required:"비밀번호는 필수 요소입니다."				
			},
			confirm_password:{
				required:"비밀번호는 필수 요소입니다.",				
				equalTo:"이전 비밀번호와 다릅니다."
			},
			
		},
		errorPlacement:function(error,element){
			$(element).closest("form")
					  .find("small[id='"+element.attr('id')+"']")
					  .append(error);
		}
	})
})