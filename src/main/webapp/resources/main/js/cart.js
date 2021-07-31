//function plus(obj){
////	console.log("dffd"+obj);	
//	var num = $(obj).val();
//	
//	var plusNum = Number(num) + 1;
//
//    var sum = plusNum * $("input[name='price']").val();
//
//    var in_price = $(obj).closest("div").prev().find("input[class='total']");
//
//
//	
////	console.log($(in_price).find("input[class='total']").val());
//
//	
////	console.log(plusNum);
//	
//	if (plusNum >= 100) {
//		$(obj).val(num);
//	} else {
//		$(obj).val(plusNum);
//		$(in_price).val(sum);
//	}
//}
// 
//function minus(obj){
//	var num = $(obj).val();
//	var minusNum = Number(num) -1 ;
//	
//	var sum = minusNum * $("input[name='price']").val();
//	
//	if(minusNum <=0) {
//		$(obj).val(num);
//	}else {
//		$(obj).val(minusNum);
//		$(".total").val(sum);
//	}
//}


var total_amount = 0;
$(".total").each(function(idx,item){
			total_amount += Number($(this).val());
			$("span.num").html(total_amount);
		});

function plus_minus(obj,op){
	var num = $(obj).val();
	
	var amount=0;
	var sum=0;
    var total_amount = 0;
	
	if(op=='plus'){	
		amount = Number(num) + 1;		
	}else{
		amount = Number(num) -1 ;
	}
	
	sum= amount * $("input[name='price']").val();
	var in_price = $(obj).closest("div").prev().find("input[class='total']");
	
	if (amount >= 100 || amount <=0) {
		$(obj).val(num);
	} else {
		$(obj).val(amount);
		$(in_price).val(sum);
		$(".total").each(function(idx,item){
			total_amount += Number($(this).val());
			$("span.num").html(total_amount);
		});
		/*#cartItemList > div > div.cart_result > div > div.amount_view > dl > dd > span.num*/		
	}
}


//클래스명 같기 때문에 x => 현재의 값
//$(".plus").click(function() {
//	var num = $("").val();
//	var plusNum = Number(num) + 1;
//
//	if (plusNum >= 100) {
//		$(".num").val(num);
//	} else {
//		$(".num").val(plusNum);
//		
//	}
//});
//
//$(".minus").click(function() {
//	var num = $(".num").val();
//	var minusNum = Number(num) - 1;
//	var sum = plusNum * $("input[name='price']").val();
//	
//	if (minusNum <= 0) {
//		$(".num").val(num);
//	} else {
//		$(".num").val(minusNum);
//	}
//});


$("#checkall").click(function(){
	
	if ($("input:checkbox[id='checkall']").prop("checked")){
		$("input[type=checkbox]").prop("checked",true);
	} else{
		$("input[type=checkbox]").prop("checked",false);
	}
});


//$(function(){
//$("#checkall").click(function() {
//	if ($("input:checkbox[id='checkall']").prop("checked")) {
//		$("input[type=checkbox]").prop("checked", true);
//	} else {
//		$("input[type=checkbox]").prop("checked", false);
//	}
//});

//$("#deleteall").click(function(){
//	
//	var result = confirm("정말 전체를 삭제하시겠습니까?");
//		
//	if(result){
//		location.replace('main');
//	}
//
//});