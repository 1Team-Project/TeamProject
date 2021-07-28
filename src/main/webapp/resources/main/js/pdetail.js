/**
 * pdetail.jsp에서 사용할 스크립트
 */



$(function() {

	$(".btn-secondary").click(function(e) {
		e.preventDefault();

		var order = confirm("상품을 바로 구매하시겠습니까?");
		if (order) {
			$(location).attr("href", "buy")

		} else {

		}
	})
})
$(".menu1").click(function(e) {
	e.preventDefault(e);
	//선택한 위치 태그 
	var position = $(".size_info").offset();
	$('html,body').stop().animate({
		scrollTop: position.top
	},
		400);
})
$(".menu2").click(function() {
	//선택한 위치 태그 
	var position = $(".p_reviewbar").offset();
	$('html,body').stop().animate({
		scrollTop: position.top
	},
		400);
})
$(".menu3").click(function() {
	//선택한 위치 태그 
	var position = $(".p_qna").offset();
	$('html,body').stop().animate({
		scrollTop: position.top
	},
		400);
})
$(".menu4").click(function(e) {
	e.preventDefault();
	//선택한 위치 태그 
	var position = $(".change_info").offset();
	$('html,body').stop().animate({
		scrollTop: position.top
	},
		400);
})
$(".plus").click(function() {
	var num = $(".inp").val();
	var plusNum = Number(num) + 1;

	if (plusNum >= 100) {
		$(".inp").val(num);
	} else {
		$(".inp").val(plusNum);
	}
});

$(".minus").click(function() {
	var num = $(".inp").val();
	var minusNum = Number(num) - 1;

	if (minusNum <= 0) {
		$(".inp").val(num);
	} else {
		$(".inp").val(minusNum);
	}
});
	var price = $('.price').val();
	var quantity = $('.inp').val();

	$(".num").text(price * quantity);




$("#btn_cart").click(function() {
	if(confirm("선택한 제품을 장바구니에 추가하겠습니까?")){
		var pnum = $("#p_number").val();
		var stock = $(".inp").val();
		var data = {
			pnum : pnum,
			stock : stock
		};
		
		$.ajax({
			type : "post",
			url : "/addcart",
			data: "data",
			success:function(){
				alert("장바구니에 추가되었습니다!")
			},
			error:function(){
				alert("Error!!!")
			}
		})
	}
})



$("#btn1").click(function(e) {
	e.preventDefault();
	var pnum = $(".p_number").val();
	var cartStock = $(".inp").val();
	
	
	var data = {
		pnum: pnum,
		cartStock: cartStock
	};

	$.ajax({
		url: "/cart",
		type: "post",
		data: data,
		success: function() {
			alert("장바구니에 담았습니다.");
				$(".inp").val("1");
			},
			error:function(){
				alert("카트 담기 실패");
			}
			});
		});
	
	

