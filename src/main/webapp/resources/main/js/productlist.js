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

	

	//검색
	
		$(".searchbutton").click(function(e){
		//검색 폼 가져오기
		var searchForm = $("#searchForm");
		//a막기
		e.preventDefault();
		
		var searchForm = $("#searchForm");
		
		var sort = $("select[name='sort']").val();
		
		var keyword = $("input[name='keyword']").val();
		
		
		if(sort === ''){
			alert("검색 기준을 다시 한번 확인해 주세요!");
			$("select[name='sort']").focus();
			return false;
		}else if(keyword===''){
			alert("검색어를 확인해 주세요!");
			$("input[name='keyword']").focus();
			return false;
		}	//@@@@@@@@@@@검색어 넣어도 이게 뜸
		
		//검색하면 처음엔 페이지 1
		searchForm.find("input[name='page']").val("1");
		
		searchForm.submit();
		
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

