/**
 * 
 */

$(function(){
	console.log("dD?D?");
	
	
	//첨부 파일 가져오기
	$.getJSON({
		url:'getAttachList',
		data:{
			b_no:b_no
		},
		success:function(data){
			console.log(data);
			
			var str="";
			$(data).each(function(i,obj){

			//썸네일 이미지 경로 링크
			var fileCallPath = encodeURIComponent(obj.a_path+"\\s_"+obj.a_uuid+"_"+obj.a_name);
		
			str += "<li data-path='"+obj.a_path+"' data-uuid='"+obj.a_uuid+"'";
			str += " data-filename='"+obj.a_name+"' data-type='1'>";
			str += "<span>"+obj.a_name+" </span>"
			str += "<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='image'>"
			str += "<i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</li>";
			catchnum += 1;
			console.log("캐치넘 : ",catchnum)

			})
			$(".uploadResult ul").html(str);
		}
		
	})//getJSON 종료
	
	// X 버튼 클릭시 동작
	$(".uploadResult").on("click","button",function(){
		
		if(confirm("정말로 파일을 삭제하시겠습니까?")){
			var targetLi = $(this).closest("li");	
			catchnum -= 1;
			targetLi.remove();
		}		

	})
	
	//remove list 를 위한 form 가져오기
	
	var operForm = $("#operForm");
	
	$("button").click(function(e){
		e.preventDefault();
		
		var str = "";
		var oper = $(this).data("oper");
		
		if(oper === "modify"){
			
			let sort = $("#sort option:selected").val();
			let title = $("#campusboard-title").val();
			let content = $("#campusboard-content").val();
			
			console.log(sort)
	
			if(sort == ""){
				alert("분류를 선택해 주세요!");
				$("#sort").focus();
				return;
			}
			if(title == ""){
				alert("제목을 작성해 주세요!");
				$("#campusboard-title").focus();
				return;
			}
			if(content == ""){
				alert("내용을 작성해 주세요!");
				$("#campusboard-content").focus();
				return;
			}
			
			operForm = $("form[role='form']");
				
			$(".uploadResult ul li").each(function(idx,obj){
				var job = $(obj);
				//수집된 정보를 hidden태그로 작성
				str+="<input type='hidden' name='attachList["+idx+"].a_uuid' value='"+job.data("uuid")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].a_path' value='"+job.data("path")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].a_name' value='"+job.data("filename")+"'>";
			})
			console.log(str);
			operForm.append(str);
			
		}else if(oper === "remove"){
			operForm.attr('action', '/board/remove');
			
		}else if(oper === "list"){
			operForm.find("input[name='bno']").remove();
			operForm.attr("method","GET");
			operForm.attr('action', '/board/list');
		}
		
		console.log(operForm);
		
		operForm.submit();
	})
	
		$("input[type='file']").change(function() {
		
		var files=$("input[name='campusFile']")[0].files;
		console.log(files);
		
		//첨부파일을 formData 로 만들어 전송
		var formData = new FormData();
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("campusFile",files[i]);
		}
		
		$.ajax({
			url:'/uploadAjax',
			type:'post',
			processData:false,
			contentType:false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:formData,
			success:function(result){
				console.log(result);
				showUploadedFile(result);
				$("input[name='campusFile']").val("");
			},
			error:function(xhr, status, error){
				console.log("에러");
			}
		})
	})//uploadBtn 종료
	
})

	function showUploadedFile(uploadResultArr){
		var str = "";
		var uploadResult = $(".uploadResult ul");
		

		
		$(uploadResultArr).each(function(i,obj){
			
			catchnum += 1;
			if(catchnum > 3){
				alert("사진은 최대 3개까지 업로드가 가능합니다.");
				catchnum -= 1;
				return false;
			}
			
			//썸네일 이미지 경로 링크
			var fileCallPath = encodeURIComponent(obj.a_path+"\\s_"+obj.a_uuid+"_"+obj.a_name);
		
			//원본이미지
			var originPath = obj.a_path+"\\"+obj.a_uuid+"_"+obj.a_name;
			originPath = originPath.replace(new RegExp(/\\/g),"/");
		
			str += "<li data-path='"+obj.a_path+"' data-uuid='"+obj.a_uuid+"'";
			str += " data-filename='"+obj.a_name+"' data-type='1'>";
			str += "<a href=\"javascript:showImage(\'"+originPath+"\')\">";
			str += "<span>"+obj.a_name+" </span>"
			str += "<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='image'>"
			str += "<i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'></a>";
			str += "</li>";

		})
		
		uploadResult.append(str);
	}
	
		
	//업로드 되는 파일의 종류와 크기 제한
	function checkExtension(fileName,fileSize){
		
		var regex = new RegExp("(.*?)\.(jpg|png)");
		
		var maxSize = 40971520; //20MB
		
		if(fileSize>maxSize){
			alert("파일 사이즈 초과 ( 최대 20MB )");
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다 (.jpg, .png)");
			return false;
		}

		return true;
	}
	