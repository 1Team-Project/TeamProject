(function($) {

	"use strict";

	$('nav .dropdown').hover(function(){
		var $this = $(this);
		$this.addClass('show');
		$this.find('> a').attr('aria-expanded', true);
		$this.find('.dropdown-menu').addClass('show');
	}, function(){
		var $this = $(this);
			$this.removeClass('show');
			$this.find('> a').attr('aria-expanded', false);
			$this.find('.dropdown-menu').removeClass('show');
	});


	$(".move").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
		var actionForm = $("#mainActionForm")
		//actionForm에 bno 값을 추가하여 actionForm 보내기
		let bnoval = $(this).attr('href');
		console.log(bnoval)
		
		$.ajax({
			url:'/board/viewadd', //도착지
			type:'post',
			processData:false,
			contentType:false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:bnoval,
			success:function(result){
				console.log("아작스성공"+result);
				actionForm.append("<input type='hidden' name='b_views' value='"+result+"'>");
				actionForm.append("<input type='hidden' name='b_no' value='"+bnoval+"'>");
				actionForm.attr('action','/board/view');
				actionForm.submit();
			},
			error:function(xhr,status,error){
				console.log("아작스에러");
			}
		})
		
	})



})(jQuery);
