/**
 * productlist.jsp
 */

$(function(){
	//하단의 페이지 나누기 번호 클릭시 
	var actionForm = $("#actionForm");
	$(".mypage-item a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='page']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})

	//상품 클릭시
	$(".viewpro").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
			  
      //actionForm에 pnum값을 추가하여 actionForm 보내기
      actionForm.append("<input type='hidden' name='p_number' value='"+$(this).attr('href')+"'>");
      actionForm.attr("action","productdetail");
      actionForm.submit();
	})
})