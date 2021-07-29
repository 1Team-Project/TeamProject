/**
 * catelist.jsp 스크립트
 */
$(function(){
	
	//하단의 페이지 나누기 번호 클릭시 !!
	var actionForm = $("#actionForm");
	
	var goForm = $("#goForm");
	$(".mypage-item a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='page']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})

	
	
	
	
	//검색
	
	
	
	$(".searchbutton").click(function(e){
		
		e.preventDefault();
		
		let searchForm = $("#searchProduct");
		
		var sort = searchForm.find($("select[name='sort']").val());
		
		var keyword = searchForm.find($("input[name='keyword']").val());
		
		if(sort === ''){
			alert("검색 기준을 다시 한번 확인해 주세요!");
			$("select[name='sort']").focus();
			return false;
		}
		if(keyword == ''){
			alert("검색어를 확인해 주세요!");
			$("input[name='keyword']").focus();
			return false;
		}	
		
		searchForm.find("input[name='page']").val("1");
		
		searchForm.submit();
		
	})
	
	//상품 클릭시
	$(".viewpro").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
			  
      //actionForm에 pnum값을 추가하여 actionForm 보내기
      goForm.append("<input type='hidden' name='p_number' value='"+$(this).attr('href')+"'>");
	//페이지 값도 추가해야함
      goForm.attr("action","productdetail");
      goForm.submit();
	})
	
	//카테고리 클릭시
	//$(".cate").click(function(e){
	//	e.preventDefault(); //타이틀 a 속성 막기
	//	
	//	//pc_code값 추가해서 보내기
	//	actionForm.append("<input type='hidden' name='pc_code' value='"+$(this).attr('href')+"'>");
	//	actionForm.attr("action","c");
    // 	actionForm.submit();
		
		
	//})
	
	//header 꺼
	//카테고리 클릭시
	//$(".clickview").click(function(e){
	//	e.preventDefault(); //타이틀 속성 a 막기
		
		
	//	goForm.append("<input type='hidden' name='pc_code' value='"+$(this).attr('href')+"'>");
	//	goForm.attr("action","/product/catelist");
	//	//console.log(catelist);
	//	goForm.submit();
	//})
})

	
	
	
	
	












