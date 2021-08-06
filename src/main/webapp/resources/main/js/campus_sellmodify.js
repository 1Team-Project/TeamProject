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
			Swal.fire({
				  title: '<strong>가격을 작성해 주세요!</strong>',
				  icon: 'info',
				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
				$("#campusboard-product-price").focus();
				return;
			}
			if(stock == ""){
			Swal.fire({
				  title: '<strong>재고를 작성해 주세요!</strong>',
				  icon: 'info',
				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
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
	