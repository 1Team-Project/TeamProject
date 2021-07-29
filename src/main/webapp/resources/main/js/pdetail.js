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

//
//$(function() {
//
//	$(".btn-secondary").click(function(e) {
//		e.preventDefault();
//
//		var order = confirm("상품을 바로 구매하시겠습니까?");
//		if (order) {
//			$(location).attr("href", "/payment/paymentpage")
//
//		} else {
//
//		}
//	})
//})

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


$(function(){
	
	//하단의 페이지 나누기 번호 클릭시 !!
	var actionForm = $("#actionForm");
	$(".mypage-item a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='page']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})

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
	
$(document).ready(function(){
    var rows = document.getElementById("tbody1").getElementsByTagName("tr");
    console.log(rows.length);	// tbody tr 개수 = 2
	
    // tr만큼 루프돌면서 컬럼값 접근
    for( var r=0; r<rows.length; r++ ){
      var cells = rows[r].getElementsByTagName("td");

      var cell_1 = cells[0].data;		// 이름
      var cell_2 = cells[1].data;		// 나이
      var cell_3 = cells[2].data;
      var cell_3 = cells[3].data;	
      var cell_3 = cells[4].data;			// 성별

      console.log(cell_1);	// 홍길동, 김영희
      console.log(cell_2);	// 23, 25
      console.log(cell_3);  // 남자,여자
      console.log(cell_4);
      console.log(cell_5);
    }
  });
	
	

