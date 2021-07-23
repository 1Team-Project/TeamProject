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
	
	$(".cbcontent").on("click","li",function(){
		var liObj = $(this);
		
		
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));			
		}else{
			self.location="/download?a_name="+path;
		}
	})
	
	$(".replyremove").click(function(e){
		
		e.preventDefault();

		let r_no = $(this).attr("href");

		if(confirm("정말로 댓글을 삭제하시겠습니까?")){

			reform.attr('action','/board/replyremove');
			reform.append('<input type="hidden" name="r_no" value="'+r_no+'"/>');
			reform.submit();

		}

	})
	
	$(".replymodify").click(function(e){

		let rnostr1 = '<button class="btn btn-primary float-end m-1 mr-0 exit2" type="submit">댓글 수정</button>';
		let rnostr2 = '<button class="btn btn-primary float-end m-1 mr-0 exit1" type="submit">취소</button>';
		
		e.preventDefault();
		
		let r_no = $(this).attr("href");

		$("."+r_no).attr("readonly",false);
		$("."+r_no).addClass("exit")

		$("."+r_no+"_btn").append(rnostr1);
		$("."+r_no+"_btn_X").append(rnostr2);

		saverno = r_no;

		console.log(r_no);
	})
	
		
	let savecontent = "";
	let saverno = "";
	
	$(".divreply").on("click",".exit1",(function(e){
		
		e.preventDefault();

		$(".exit1").remove();
		$(".exit2").remove();
		$(".exit").attr("readonly",true);
		})
	)
	

	
	$(".divreply").on("click",".exit2",(function(e){
		
		e.preventDefault();

		savecontent = $("."+saverno).val();
		
		superstr += '<input type="hidden" name="r_no" value="'+saverno+'"/>'
		superstr += '<input type="hidden" name="r_content" value="'+savecontent+'"/>'

		reform.attr('action','/board/replymodify');
		reform.append(superstr);
		reform.submit();

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
					alert("댓글을 작성하셨습니다.");
					//댓글 불러오기
					var param = {
						
					}
					
					
				}else if (result === 'NO'){
					alert("댓글 작성에 실패하였습니다.");
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
					str += "<li class='left clearfix' data-rno='"+data[i].rno+"'>";
					str += "<div>"
					str += "<div class='header'>"
					str += "<strong class='primary-font'>"+data[i].replyer+"</strong>"
					str += "<small class='pull-right text-muted'>"+replyService.displayTime(data[i].replydate)+"</small>"
					str += "<p>"+data[i].reply+"</p>"
					str += "</div>"
					str += "</div>"
					str += "</li>"
					
				<div class="col-md-8 mll20 margintb20 divreply">
				<h6 class="float-start">${revo.r_replyer}</h6>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${user.username == revo.r_replyer}">
					<a href="${revo.r_no}" class="float-end blacktext hoverthema replymodify">[수정]</a>
					<a href="${revo.r_no}" class="float-end blacktext hoverthema replyremove">[삭제]</a>
					</c:if>
				</sec:authorize>
				<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">시간</h7>
				<div class="${revo.r_no}_btn"></div>
				<div class="${revo.r_no}_btn_X"></div>
				<textarea class="form-control ${revo.r_no}" cols="30" rows="3" name="r_content" style="resize: none" readonly>${revo.r_content}</textarea>
				</div>
					
		}
		replyUl.html(str);
		showReplyPage(total);
			
		})
	
	}
	
	//페이지 나누기
	
	//댓글 페이지 영역 가져오기
	var replyPageFooter = $(".panel-footer");
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
		
		var str="<ul class = 'pagination pull-right'>";
		if(prev){
			//str += "<li class='page-item'><a class='page-link' href='"+(startPage-1)+"'>Prev</a></li>";
			str += '<li class="mypage-item prev"><a class="page-link" href="'+(startPage-1)+'" class="mypage-link" /></li>'
		}
		for(var i=startPage;i<=endPage;i++){
			var active = pageNum == i?"active":"";
			str += "<li class='page-item "+active+"'>";
			str += "<a class='page-link' href='"+i+"'>"+i;
			str += "</a></li>";
		}
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"+(endPage+1)+"'>Next</a></li>";
		}
		
		str+="</ul>";
		replyPageFooter.html(str);
		
	}
	
	//댓글 페이지 번호 클릭시
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault(); // a 태그의 동작 막기
		
		pageNum = $(this).attr("href");
		showList(pageNum);
		
	})
	
	
})




















