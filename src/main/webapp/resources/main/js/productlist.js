/**
 * productlist.jsp
 */
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
		
		//actionForm에 p_number 값을 추가하여 actionForm 보내기
		let pnum = $(this).attr('href');
		console.log(pnum)
		
		$.ajax({
			url:'/product/productdetail', //도착지
			type:'post',
			processData:false,
			contentType:false,
			data:pnum,
			success:function(result){
				console.log("아작스성공"+result);
				//actionForm.append("<input type='hidden' name='p_views' value='"+result+"'>"); - 조회수?
				actionForm.append("<input type='hidden' name='p_number' value='"+pnum+"'>");
				actionForm.attr('action','productdetail');
				actionForm.submit();
			},
			error:function(xhr,status,error){
				console.log("아작스에러");
			}
		})
		
	})
	
	//검색
	$("#searchBtn").click(function(){
		//검색 폼 가져오기
		var searchForm = $("#searchProduct");
		
		//type 가져오기
		var keyword = $("input[name='keyword']").val();
		
		//keyword 가 값이 없는 경우 경고 메세지
		if(keyword===''){
			alert("상품명을 입력하세요");
			$("input[name='keyword']").focus();
			return false;
		}
		
		//검색 처음에는 1page 보여주기
		searchForm.find("input[name='pageNum']").val("1");
		//값이 있다면 submit 하기
		searchForm.submit();
	})