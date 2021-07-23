
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
	var num = $(".num").val();
	var minusNum = Number(num) - 1;

	if (minusNum <= 0) {
		$(".num").val(num);
	} else {
		$(".num").val(minusNum);
	}
});

//
//$("#checkall").click(function(){
//	if ($("input:checkbox[id='checkall']").prop("checked")){
//		$("input[type=checkbox]").prop("checked",true);
//	} else{
//		$("input[type=checkbox]").prop("checked",false);
//	}
//});
//

//$(function(){
	$("#checkall").click(function(){
		if ($("input:checkbox[id='checkall']").prop("checked")){
		$("input[type=checkbox]").prop("checked",true);
	} else{
		$("input[type=checkbox]").prop("checked",false);
	}
  });

$(".btn_delete").click(function(){
	
	var result = confirm("정말 삭제하시겠습니까?");
		
	if(result){
		location.replace('main');
	}

});

