<<<<<<< HEAD
=======
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
//   smallpic[i].addEventListener("click",changepic);
//}
//
//function changepic() {
//   var samllpicAttribute = this.getAttribute("src");
//   bicpic.setAttribute("src",smallpicAttribute);

//
//$(function() {
//   $('a').click(function() {
//      $('.photo').attr('src', $(this).attr('href'));
//      return false;
//   })
//});
//

//
//$(function() {
//
//   $(".btn-secondary").click(function(e) {
//      e.preventDefault();
//
//      var order = confirm("상품을 바로 구매하시겠습니까?");
//      if (order) {
//         $(location).attr("href", "/payment/paymentpage")
//
//      } else {
//
//      }
//   })
//})
>>>>>>> b95f8238fbd2702e5029d9b7886e6671b0d0914f

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
   var shipping = $("input[name='shipping']").val();
    var sum = (plusNum * $("input[name='price']").val()) + Number(shipping);

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


$(function(){
<<<<<<< HEAD
	//하단의 페이지 나누기 번호 클릭시 !!
	var actionForm = $("#actionForm");
	$(".mypage-item a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='page']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})
=======
   
   //하단의 페이지 나누기 번호 클릭시 !!
   var actionForm = $("#actionForm");
   $(".mypage-item a").click(function(e){
      e.preventDefault();  //a 속성 중지
      
      //actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
      actionForm.find("input[name='page']").val($(this).attr("href"));
      
      //actionForm 보내기
      actionForm.submit();
   })
>>>>>>> b95f8238fbd2702e5029d9b7886e6671b0d0914f

})

//게시글 제목 클릭시
   $(".clickview").click(function(e){
      e.preventDefault(); //타이틀 a 속성 막기
      
      actionForm = $("#actionForm1");
      
      //actionForm에 bno 값을 추가하여 actionForm 보내기
      let bnoval = $(this).attr('href');
      
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
            actionForm.append("<input type='hidden' name='r_page' value='1'>");
            actionForm.attr('action','/board/view');
            actionForm.submit();
         },
         error:function(xhr,status,error){
            console.log("아작스에러");
         }
      })
      
   })
   
//    var rows = $(".textcenter1").val("td:eq(5)");
//    console.log(rows);   

   var sum = 0;
   var count = $(".textcenter1 tr").length;
$(".textcenter1 tr").each(function(){
   var data= $("td:eq(5)",this).text();
   
   sum += Number(data);
   
   
   console.log(sum);
   console.log(count);
   
})
$(".avg").val((sum/count).toFixed(2));

<<<<<<< HEAD
 
=======
 
>>>>>>> b95f8238fbd2702e5029d9b7886e6671b0d0914f
