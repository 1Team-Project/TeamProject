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

//
//$(function() {
//	$('a').click(function() {
//		$('.photo').attr('src', $(this).attr('href'));
//		return false;
//	})
//});
//


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
    var sum = plusNum * $("input[name='price']").val();

	if (plusNum >= 100) {
		$(".inp").val(num);
		
	} else {
		$(".inp").val(plusNum);
		$(".subtotal").val(sum);
	}
});

$(".minus").click(function() {
	var num = $(".inp").val();
	var minusNum = Number(num) - 1;
	var sum = minusNum * $("input[name='price']").val();
	
	if (minusNum <= 0) {
		$(".inp").val(num);
	} else {
		$(".inp").val(minusNum);
		$(".subtotal").val(sum);
	}
});




