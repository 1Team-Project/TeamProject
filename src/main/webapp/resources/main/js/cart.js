//클래스명 같기 때문에 x => 현재의 값
$(".plus").click(function() {
	var num = $(".num").val();
	var plusNum = Number(num) + 1;

	if (plusNum >= 100) {
		$(".num").val(num);
	} else {
		$(".num").val(plusNum);
	}
});

$(".minus").click(function() {
	var num = $("").val();
	var minusNum = Number(num) - 1;

	if (minusNum <= 0) {
		$(".num").val(num);
	} else {
		$(".num").val(minusNum);
	}
});

//
$("#checkall").click(function(){
	if ($("input:checkbox[id='checkall']").prop("checked")){
		$("input[type=checkbox]").prop("checked",true);
	} else{
		$("input[type=checkbox]").prop("checked",false);
	}
});


//$(function(){
$("#checkall").click(function() {
	if ($("input:checkbox[id='checkall']").prop("checked")) {
		$("input[type=checkbox]").prop("checked", true);
	} else {
		$("input[type=checkbox]").prop("checked", false);
	}
});

//$("#deleteall").click(function(){
//	
//	var result = confirm("정말 전체를 삭제하시겠습니까?");
//		
//	if(result){
//		location.replace('main');
//	}
//
//});




