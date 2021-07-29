/**
 * read.jsp 에서 사용할 스크립트
 */

function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();

	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
	                .animate({width:'100%', height:'100%'},300);
	$("#campusboard-title").focus();
	console.log(fileCallPath);
}

$(function(){

	showList(1);
	let replyUl = $(".replyzone");
	
	//첨부 파일 가져오기
	$.getJSON({
		url:'/board/getAttachList',
		data:{
			b_no:b_no
		},
		success:function(data){
			console.log(data);
			
			var str="";
			var contentimg = ""
			$(data).each(function(i,obj){		
				
				var realPath = encodeURIComponent(obj.a_path+"\\"+obj.a_uuid+"_"+obj.a_name);
				var fileCallPath = encodeURIComponent(obj.a_path+"\\s_"+obj.a_uuid+"_"+obj.a_name);
					
				str+="<li data-path='"+obj.a_path+"' data-uuid='"+obj.a_uuid+"'";
				str+=" data-filename='"+obj.a_name+"' data-type='"+obj.a_type+"'>";							
				str+="<img src='/display?fileName="+fileCallPath+"'>";
				str+="</li>";

				contentimg += "<li data-path='"+obj.a_path+"' data-uuid='"+obj.a_uuid+"'";
				contentimg += " data-filename='"+obj.a_name+"' data-type='"+obj.a_type+"' class='txtacenter'>";	
				contentimg += "<img src='/display?fileName="+realPath+"' class='imgsize'>";
				contentimg += "</li>";

			})
			$(".uploadResult ul").html(str);
			$(".cbcontent").html(contentimg);
		}
	}) //getJSON 종료
	
	let superstr = "";
	let reform = $("#replyselfform");
	let numbertest = 0;
	
	$(".cbcontent").on("click","li",function(){
		var liObj = $(this);
		
		
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));			
		}else{
			self.location="/download?a_name="+path;
		}
	})
	
	$(".replyzone").on("click",".replyremove",(function(e){
		
		e.preventDefault();

		let r_no = $(this).attr("href");

		if(confirm("정말로 댓글을 삭제하시겠습니까?")){

			//reform.attr('action','/board/replyremove');
			//reform.append('<input type="hidden" name="r_no" value="'+r_no+'"/>');
			//reform.submit();

			$.ajax({
				url: "/board/replyremove",
				type: "POST",
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				data: "r_no="+saverno,
				success: function(result){
					if (result === 'OK'){

						showList(pageNum||1);
	
					}else if (result === 'NO'){

						showList(pageNum||1);
					}
			
				}
			})


			}
		})
	)
	
	$(".replyzone").on("click",".replymodify",(function(e){

		let rnostr1 = '<button class="btn btn-primary float-end m-1 mr-0 exit2" type="submit">댓글 수정</button>';
		let rnostr2 = '<button class="btn btn-primary float-end m-1 mr-0 exit1" type="submit">취소</button>';
		
		e.preventDefault();
		
		let r_no = $(this).attr("href");
		console.log($("."+r_no+""));
		console.log($(".replyzone ."+r_no+""));
		console.log($(".replyzone"))

		$(".replyzone ."+r_no).attr('readonly', false);
		$(".replyzone ."+r_no).addClass("exit");

		if (numbertest == 0){
			$(".replyzone ."+r_no+"_btn").append(rnostr1);
			$(".replyzone ."+r_no+"_btn_X").append(rnostr2);
			numbertest++;
		}

		saverno = r_no;

		console.log(r_no);
		})
	)
	
		
	let savecontent = "";
	let saverno = "";
	
	$(".replyzone").on("click",".exit1",(function(e){
		
		e.preventDefault();

		$(".exit1").remove();
		$(".exit2").remove();
		$(".exit").attr("readonly",true);
		numbertest--;
		})
	)
	

	
	$(".replyzone").on("click",".exit2",(function(e){
		
		e.preventDefault();

		savecontent = $(".replyzone ."+saverno).val();
		
		superstr += '<input type="hidden" name="r_no" value="'+saverno+'"/>'
		superstr += '<input type="hidden" name="r_content" value="'+savecontent+'"/>'

		reform.attr('action','/board/replymodify');
		reform.append(superstr);
		
		console.log(saverno);
		console.log(savecontent);
		
		$(".exit").attr("readonly",true);
		
		//reform.submit();
		
		$.ajax({
			url: "/board/replymodify",
			type: "POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data: "r_no="+saverno+"&r_content="+savecontent,
			success: function(result){
				if (result === 'OK'){

					$(".exit").attr("readonly",true);
					$(".exit1").remove();
					$(".exit2").remove();
					numbertest = 0;
					showList(pageNum||1);

				}else if (result === 'NO'){

					$(".exit").attr("readonly",true);
					$(".exit1").remove();
					$(".exit2").remove();
					numbertest = 0;
					showList(pageNum||1);
				}
		
			}
		})

		})
	)

	//확대된 사진 영역 없애기
	$(".bigPictureWrapper").click(function(){
		//원본 사진 줄이기
		$(".bigPicture").animate({width:'0%', height:'0%'},300);
		
		//확대된 영역 없애기
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		},300);		
	})

	
	//operForm 가져온 후 전송하기
	
	var operForm = $("#operForm");
	
	
	//Modify버튼 클릭시  get방식 /board/modify
	$(".modifybutton").click(function(){
		operForm.attr('action','/board/modify');
		operForm.submit();
	})
	
	//List버튼 클릭시 get /board/list
	$(".listbutton").click(function(){
		operForm.find("input[name='b_no']").remove();
		operForm.attr('action','/board/list');
		operForm.submit();
	})
	
	//하단의 페이지 나누기 번호 클릭시 !!
	var replyForm = $("#replyForm");
	$(".mypage-item a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		replyForm.find("input[name='r_page']").val($(this).attr("href"));
		replyForm.attr('action','/board/view');
		replyForm.submit();
	})
	
	//댓글 작성 ajax
	$(".btn-reply-submit").click(function(e){
		
		e.preventDefault();
		var rcontent = $(".reply_content_add").val();
		
		$.ajax({
			url: "/board/replyadd",
			type: "POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data: "b_no="+bno+"&r_replyer="+replyername+"&r_content="+rcontent,
			success: function(result){
				if (result === 'OK'){

					//댓글 불러오기
					$(".reply_content_add").val("");
					showList(pageNum||1);

					
				}else if (result === 'NO'){

					$(".reply_content_add").val("");
					showList(pageNum||1);
				}
		
			}
		})
		
	})

	
	function showList(page){
	
	console.log("작동은 하나")
	
	replyService.getList({b_no:bno,r_page:page||1},function(total,data){
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
		
		for(var i=0,len=data.length||0;i<len;i++){
						
					str += '<div class="col-md-8 mll20 margintb20 divreply" data-rno="'+data[i].r_no+'">'
					str += '<h6 class="float-start">'+data[i].r_replyer+'</h6>'
					if (replyername == data[i].r_replyer){
						str += '<a href="'+data[i].r_no+'" class="float-end blacktext hoverthema replymodify">[수정]</a>'
						str += '<a href="'+data[i].r_no+'" class="float-end blacktext hoverthema replyremove">[삭제]</a>'						
					}
					str += '<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">'+replyService.displayTime(data[i].r_sysdate)+'</h7>'
					str += '<div class="'+data[i].r_no+'_btn"></div>'
					str += '<div class="'+data[i].r_no+'_btn_X"></div>'
					str += '<textarea class="form-control '+data[i].r_no+'" cols="30" rows="3" name="r_content" style="resize: none" readonly>'+data[i].r_content+'</textarea>'
					str += '</div>'
					
		}
		replyUl.html(str);
		showReplyPage(total);
			
		})
	
	}
	
	//페이지 나누기
	
	//댓글 페이지 영역 가져오기
	var replyPageFooter = $(".mypagination");
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
		
		if(endPage * 10 >= total){
			endPage = Math.ceil(total/10.0);
		}
		
		if(endPage * 10 < total){
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

		replyPageFooter.html(str);
		
	}
	
	//댓글 페이지 번호 클릭시
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault(); // a 태그의 동작 막기
		
		pageNum = $(this).attr("href");
		showList(pageNum);
		
	})
	
	
})




















