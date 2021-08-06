/**
 * list.jsp 스크립트
 */
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

	//후기나 질문 게시글 제목 클릭시 해당 글로 이동
	$(".card").on("click","a",function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
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
				actionForm.append("<input type='hidden' name='r_page' value='1'>");
				actionForm.attr('action','view');
				actionForm.attr('method','post');
				actionForm.submit();
			},
			error:function(xhr,status,error){
				console.log("아작스에러");
			}
		})
		
	})
	
	$(".listzone").on("click","a",function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
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
				actionForm.append("<input type='hidden' name='r_page' value='1'>");
				actionForm.attr('action','view');
				actionForm.attr('method','post');
				actionForm.submit();
			},
			error:function(xhr,status,error){
				console.log("아작스에러");
			}
		})
		
	})


	
})

$(function(){


	//검색
	$(".searchbutton").click(function(e){
		
		e.preventDefault();
		
		let searchForm = $("#searchForm");
		
		var sort = $("select[name='sort']").val();
		
		var keyword = $(".keyword").val();
		
		console.log("키워드잇어?"+keyword);
		
		if(sort === ''){
			
			Swal.fire({
				  title: '<strong>검색 분류를 확인해 주세요!</strong>',
				  icon: 'warning',
				  allowOutsideClick: false,
				  focusConfirm: false,
				  confirmButtonColor: '#78c2ad',
				  confirmButtonText:
				    '확인'
				})
				
			$("select[name='sort']").focus();
			return false;
		}

/*		searchForm.find("input[name='page']").val("1");
		
		searchForm.submit();
		*/
		
		pageNum = 1;
		showList(1);
		
	})


	$("#Review").click(function(e){
		
		e.preventDefault();
		
		if(sort_check = "질문"){
			
			sort_check  = "후기";
			$("#Review").addClass('btnclick');
			$("#QNA").removeClass('btnclick');
			pageNum = 1;
			showList(1);
			
		}
		
	})

	$("#QNA").click(function(e){
		
		e.preventDefault();
		
		if(sort_check = "후기"){
			
			sort_check  = "질문";
			$("#QNA").addClass('btnclick');
			$("#Review").removeClass('btnclick');
			pageNum = 1;
			showList(1);
			
		}
		
	})

	let replyUl = $(".listzone");
	let sort_check  = "후기";

	showList(1);
	

	function showList(page){
	
	console.log("작동은 하나")
	
		
	var sort = $("select[name='sort']").val();

	var keyword = $(".keyword").val();
	
	var test = sort_check;
		

	replyService.getList({sort:sort,page:page||1,keyword:keyword||"",test:test},function(total,data){
		console.log(data);
		console.log(total);
		console.log("테스트테스트");
		
		if(page == -1){
			//마지막 페이지 계산
			pageNum = Math.ceil(total/10.0);
			showList(pageNum);
			return;
		}
		//댓글이 없는 경우
		if(data==null || data.length==0){
			replyUl.html("");
			return;
		}
		
		//댓글이 있는 경우
		var str="";
		
		var isAdmin = $("#isAdmin").val();
		var userid = $("#userid").val();
		
		for(var i=0,len=data.length||0;i<len;i++){

					str += '<tr>'
					
					str += '<td>'+data[i].b_no+'</td>'
					str += '<td>'+data[i].b_sort+'</td>'
					str += '<td>'+data[i].p_name+'</td>'
					
					if(data[i].b_private == "no"){
						str += '<td><a href="'+data[i].b_no+'" class="blacktext hoverthema clickview">'+data[i].b_title+'<strong class="badgecount">['+data[i].replycnt+']</strong></a></td>'				
					}else if(data[i].b_private == "yes"){
						
						
						if(data[i].b_writer == userid || isAdmin == "true"){
							str += '<td><a href="'+data[i].b_no+'" class="blacktext hoverthema clickview">'+data[i].b_title+'<strong class="badgecount">['+data[i].replycnt+']</strong></a></td>'
						}else{
							str += '<td><img src="/resources/main/images/lock.png">비공개 처리된 게시물 입니다.</span></td>'
						}
						
					}
					
					str += '<td>'+data[i].b_writer+'</td>'					
					str += '<td>'+replyService.displayTime(data[i].b_sysdate)+'</td>'
					str += '<td>'+data[i].b_views+'</td>'					
					
					str += '</tr>'
		}
		replyUl.html(str);
		showReplyPage(total);
			
		})
	
	}
	
	//페이지 나누기
	
	//댓글 페이지 영역 가져오기
	var listPageFooter = $(".mypagination");
	var pageNum = 1;
	
	function showReplyPage(total){
		
		//마지막 페이지 계산
		var endPage = Math.ceil(pageNum/10.0)*10;
		
		//시작 페이지 계산
		var startPage = endPage - 9;
		
		//이전 버튼
		var prev = startPage != 1;
		
		//다음 버튼
		var next = false;
		
		if(endPage * 15 >= total){
			endPage = Math.ceil(total/15.0);
		}
		
		if(endPage * 15 < total){
			next = true;
		}
		
		var str="";
		
		if(prev){
			//str += "<li class='page-item'><a class='page-link' href='"+(startPage-1)+"'>Prev</a></li>";
			str += '<li class="mypage-item prev"><a class="page-link mypage-link" href="'+(startPage-1)+'" class="mypage-link"> << </a></li>';
		}
		for(var i=startPage;i<=endPage;i++){
			var active = pageNum == i?"activecolor":"";
			str += "<li class='mypage-item'>";
			str += "<a class='mypage-link "+active+"' href='"+i+"'>"+i;
			str += "</a></li>";
		}
		if(next){
			//str += "<li class='page-item'><a class='page-link' href='"+(endPage+1)+"'>Next</a></li>";
			str += '<li class="mypage-item next"><a class="page-link mypage-link" href="'+(endPage+1)+'" class="mypage-link"> >> </a></li>';
		}

		listPageFooter.html(str);
		
	}
	
	//댓글 페이지 번호 클릭시
	listPageFooter.on("click","li a",function(e){
		e.preventDefault(); // a 태그의 동작 막기
		
		pageNum = $(this).attr("href");
		showList(pageNum);
		
	})
	


})
	
	
	
	
	












