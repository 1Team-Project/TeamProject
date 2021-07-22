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
	
})




















