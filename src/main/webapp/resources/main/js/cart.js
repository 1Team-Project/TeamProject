
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


$(".btn_delete").click(function() {
	var chk = $("#checkAll").prop("checked");
	if(chk){
		$(".chBox").prop("checked",true);
	}else{
		$(".chBox").prop("checked",false);
	}
});
