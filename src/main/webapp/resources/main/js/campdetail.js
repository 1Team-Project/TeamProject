$(function(){
	
	var old = $(".old").val();
	var young = $(".young").val();
	var oldp = 0;
	var youngp = 0;
	
	$(".oldplus").click(function(){
		
		oldp += 1;
		
		if(oldp >= 4){
			$(".old").val(4)
			oldp = 4
			return;
		}
		
		$(".old").val(oldp)
		
	})
	
	$(".oldminus").click(function(){
		
		oldp -= 1;
		
		if(oldp <= 0){
			$(".old").val(0)
			oldp = 0
			return;
		}
		
		$(".old").val(oldp)
		
	})
	
	$(".youngplus").click(function(){
		
		youngp += 1;
		
		if(youngp >= 4){
			$(".young").val(4)
			youngp = 4
			return;
		}
		
		$(".young").val(youngp)
		
	})
	
	$(".youngminus").click(function(){
		
		youngp -= 1;
		
		if(youngp <= 0){
			$(".young").val(0)
			youngp = 0
			return;
		}
		
		$(".young").val(youngp)
		
	})
	
	$("#sNo1").click(function(){
		$("#sNo2").prop("checked", false);
		$("#sNo3").prop("checked", false);
		$("#sNo4").prop("checked", false);
		$("#sNo5").prop("checked", false);
		$("#sNo6").prop("checked", false);
	})
	
	$("#sNo2").click(function(){
		$("#sNo1").prop("checked", false);
		$("#sNo3").prop("checked", false);
		$("#sNo4").prop("checked", false);
		$("#sNo5").prop("checked", false);
		$("#sNo6").prop("checked", false);
	})
	
	$("#sNo3").click(function(){
		$("#sNo2").prop("checked", false);
		$("#sNo1").prop("checked", false);
		$("#sNo4").prop("checked", false);
		$("#sNo5").prop("checked", false);
		$("#sNo6").prop("checked", false);
	})
	
	$("#sNo4").click(function(){
		$("#sNo2").prop("checked", false);
		$("#sNo3").prop("checked", false);
		$("#sNo1").prop("checked", false);
		$("#sNo5").prop("checked", false);
		$("#sNo6").prop("checked", false);
	})
	
	$("#sNo5").click(function(){
		$("#sNo2").prop("checked", false);
		$("#sNo3").prop("checked", false);
		$("#sNo4").prop("checked", false);
		$("#sNo1").prop("checked", false);
		$("#sNo6").prop("checked", false);
	})
	
	$("#sNo6").click(function(){
		$("#sNo2").prop("checked", false);
		$("#sNo3").prop("checked", false);
		$("#sNo4").prop("checked", false);
		$("#sNo5").prop("checked", false);
		$("#sNo1").prop("checked", false);
	})
	
	
	$(".reservation").click(function(e){
		
		e.preventDefault();
		
		console.log($("#datepicker").val()); // 2021-08-17
		
		console.log($("#sNo1").is(":checked")); //true  false
		console.log($("#sNo2").is(":checked"));
		console.log($("#sNo3").is(":checked"));
		console.log($("#sNo4").is(":checked"));
		console.log($("#sNo5").is(":checked"));
		console.log($("#sNo6").is(":checked"));

		console.log($(".old").val()); // 1 3 5 ~~
		console.log($(".young").val());
		
		var rsysdate = $("#datepicker").val();
		var checkno = 0;
		
		
		var today = new Date();

		var str = "";

		var yy = today.getFullYear();
		var mm = today.getMonth()+1;
		var dd = today.getDate();
			
		str += [yy,'-',(mm > 9 ? '' : '0')+mm,'-',(dd > 9 ? '' : '0')+dd].join('');
		
		console.log("날짜? today" + today);
		console.log("날짜?" + str);

		if(str >= rsysdate){
				Swal.fire({
				  title: '<strong>현재 날짜와 이전 날짜로는 예약이 불가능 합니다.</strong>',
				  icon: 'info',
				  html:
				    '예약 날짜를 다시 한번 확인해 주세요.',

				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
				return;
		}
		
		var oldd = parseInt($(".old").val());
		var youngd = parseInt($(".young").val());
		
		
		if((oldd+youngd) == 0){
			console.log((oldd+youngd));
				Swal.fire({
				  title: '<strong>예약 인원을 확인해 주세요.</strong>',
				  icon: 'info',
				  html:
				    '최대 4인까지 예약이 가능합니다.',

				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
				return;
		}
		

		if((oldd+youngd) > 4){
			console.log((oldd+youngd));
				Swal.fire({
				  title: '<strong>예약 가능 인원이 초과되었습니다.</strong>',
				  icon: 'info',
				  html:
				    '최대 4인까지 예약이 가능합니다.',

				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
				return;
		}
		

		if(rsysdate == null || rsysdate == ""){
				Swal.fire({
				  title: '<strong>예약 날짜를 선택해 주세요.</strong>',
				  icon: 'info',
				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
				return;
		}
		
		if($("#sNo1").is(":checked") == true){
			checkno = 1;
		}else if($("#sNo2").is(":checked") == true){
			checkno = 2;
		}else if($("#sNo3").is(":checked") == true){
			checkno = 3;
		}else if($("#sNo4").is(":checked") == true){
			checkno = 4;
		}else if($("#sNo5").is(":checked") == true){
			checkno = 5;
		}else if($("#sNo6").is(":checked") == true){
			checkno = 6;
		}
		
		if (checkno == 0){
				Swal.fire({
				  title: '<strong>예약 자리를 선택해 주세요.</strong>',
				  icon: 'info',
				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
				return;
		}
		
		$.ajax({
			url: "/payment/checkarea",
			type: "POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data: "c_area="+checkno+"&c_rsysdate="+rsysdate,
			success: function(result){
				
				console.log("확인 ccheck  "+result);
				
				if (result === 'yes'){
					Swal.fire({
					  title: '<strong>해당 자리에 이미 예약이 있습니다.</strong>',
					  icon: 'info',
					  html:
				  		  '다른 날이나 다른 자리를 선택해 주세요.',

					  focusConfirm: false,
					  confirmButtonColor: '#78c2ad',
					  confirmButtonText:
					    '확인'
					})
					return;
				}else{
					$("#camping_go_payment").append('<input type="hidden" name="c_rsysdate" value="'+rsysdate+'"/>');
					$("#camping_go_payment").append('<input type="hidden" name="c_area" value="'+checkno+'"/>');
					$("#camping_go_payment").submit();
				}
		
			}
		})
		
	})
	
	
})

