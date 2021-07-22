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
//	$("#btn_cart").click(function() {
//		$(".modal").fadeIn();
//	});
//	$(".close").click(function() {
//		$(".modal").fadeOut();
//	});
//	
	$("#btn_order").click(function() {
		var order = confirm("상품을 바로 구매하시겠습니까?");
		if (order) {
			$(location).attr("href", "../buy")
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
		$(".")
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

$(".inp").change(function() {

	var price = $('.price').val();
	var quantity = $('.inp').val();

	$(".num").text(price * quantity);
});



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



