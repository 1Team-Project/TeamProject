$(function(){
	$(".cancel_btn").click(function(e){
		
		e.preventDefault();
		
			Swal.fire({
				  title: '<strong>정말 결제 취소를 하시겠습니까?</strong>',
				  icon: 'warning',
				  focusConfirm: false,
				  html:
					    '취소시 해당 상품의 모든 정보가 사리지며'+
						'결제 정보를 복구 할 수 없게 됩니다.',
				  showCancelButton: true,
				  confirmButtonColor: '#f89b00',
				  cancelButtonColor: '#78c2ad',
				  cancelButtonText: '창 닫기',
				  confirmButtonText:
				    '결제 취소'
				}).then((result) => {
					  if (result.isConfirmed) {
							var form_c = $("#cancel_form");
							
							var code = $(this).attr("href");
							
							form_c.append("<input type='hidden' name='c_content' value='"+code+"'>");
							
							form_c.submit();
					  }
				})

		
	})
})