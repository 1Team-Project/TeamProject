
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
//$(".btn_delete").click(function() {
//	var confirm_val = confirm("정말 삭제하시겠습니까?")
//
//	if (confirm_val) {
//		var checkArr = new Array();
//
//		$("input[class='chkbox']:checked").each(function() {
//			checkArr.push($(this).attr("data-cartNum"))
//		});
//	