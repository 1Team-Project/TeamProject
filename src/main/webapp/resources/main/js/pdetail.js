/**
 * pdetail.jsp에서 사용할 스크립트
 */

/*function showImage(fileCallPath){
   $(".bigPictureWrapper").css("display","flex").show();
   $(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
			   .animate({width:'100%', height:'100%'},1000);
   }
   
$(function(){
   
   //첨부파일 가져오기
   $.getJSON({
	  url:'getAttachList',
	  data:{
		 bno:bno
	  },
	  success:function(data){
		 console.log(data);
		 
		 var str="";
		 $(data).each(function(i,obj){
			if(obj.fileType){//image
				 var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
		    
				 str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
				 str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				 str+="<img src='/display?fileName="+fileCallPath+"'>";
				 str+="</li>";
			}else{
			   str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
			   str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
			   str+="<span>"+obj.fileName+"</span><br>"
			   str+="<img src='/resources/img/attach.png'>";
			   str+="</li>";
			}
		 })
		 $(".uploadResult ul").html(str);
		 
	  }
   })//getJSON 종료
   */


//var bigpic = document.querySelector(".photo");
//var smallpic = document.querySelector(".small_img");
//
//for(var i = 0; i<smallpic.length; i++){
//	smallpic[i].addEventListener("click",changepic);
//}
//
//function changepic() {
//	var samllpicAttribute = this.getAttribute("src");
//	bicpic.setAttribute("src",smallpicAttribute);


$(function() {
	$('a').click(function() {
		$('.photo').attr('src', $(this).attr('href'));
		return false;
	})
});



$(function() {
<<<<<<< HEAD
	$("#btn_cart").click(function() {
		$(".modal").fadeIn();
	});
	$(".close").click(function() {
		$(".modal").fadeOut();
	});
	
	$("#btn_order").click(function() {
		var order = confirm("상품을 바로 구매하시겠습니까?");
		if (order) {
			$(location).attr("href", "../buy")
=======
	//	$(".btn-primary").click(function() {
	//		var cart = confirm("장바구니로 바로 이동하시겠습니까?");
	//		if (cart) {
	//			$(location).attr("href", "cart")
	//		} else {
	//
	//		}
	$(".btn-secondary").click(function(e) {
		e.preventDefault();
		var order = confirm("상품을 바로 구매하시겠습니까?");
		if (order) {
			$(location).attr("href", "buy")
>>>>>>> refs/remotes/origin/nahyun
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
<<<<<<< HEAD
		$(".")
=======
>>>>>>> refs/remotes/origin/nahyun
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
<<<<<<< HEAD

$(".inp").change(function() {
=======
>>>>>>> refs/remotes/origin/nahyun

	var price = $('.price').val();
	var quantity = $('.inp').val();

<<<<<<< HEAD
	$(".num").text(price * quantity);
});
=======
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
>>>>>>> refs/remotes/origin/nahyun
