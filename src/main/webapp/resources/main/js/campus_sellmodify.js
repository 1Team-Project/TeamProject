/**
 * 
 */

$(function(){
	
	var operForm = $("#operForm");
	
	$("button").click(function(e){
		
		e.preventDefault();
		
		var strr = "";
		var oper = $(this).data("oper");
		
		if(oper === "modify"){
			
			let price = $("#campusboard-product-price").val();
			let stock = $("#campusboard-product-stock").val();

			if(price == ""){
				alert("가격을 작성해 주세요!");
				$("#campusboard-product-price").focus();
				return;
			}
			if(stock == ""){
				alert("재고를 작성해 주세요!");
				$("#campusboard-product-stock").focus();
				return;
			}

			operForm.attr('action', '/board/sellmodify');
			
		}else if(oper === "remove"){
			

			operForm.attr('action', '/board/sellremove');
			
		}
		
		console.log(operForm);
		
		operForm.submit();
	})
	
})
	