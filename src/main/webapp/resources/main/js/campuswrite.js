/**
 * 파일업로드
 */
$(function(){
	
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
	
	
	$("input[type='file']").change(function(){
		
		//첨부 파일 가져오기
		var files=$("input[name='campusFile']")[0].files;
		console.log(files);
		
		//첨부파일을 formData 로 만들어 전송
		var campusFormData = new FormData();
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			if(i>=3){
				alert("사진은 최대 3개까지 업로드가 가능합니다.");
				$("input[name='campusFile']").val("");
				return false;
			}
			campusFormData.append("campusFile",files[i]);
		}		
		
		// enctype="multipart/form-data" => processData:false,contentType:false,
		
		$.ajax({
			url:'/uploadAjax', //도착지
			type:'post',
			processData:false,
			contentType:false,
			data:campusFormData,
			success:function(result){
				console.log(result);
				showUploadedFile(result);
				$("input[name='campusFile']").val("");
			},
			error:function(xhr,status,error){
				console.log("에러");
			}
		})
	})//input[type=file] 종료
	
	function showUploadedFile(uploadResultArr){
		var str = "";
		var uploadResult = $(".uploadResult ul");
		
		$(uploadResultArr).each(function(i,obj){

			// 썸네일 이미지 경로 링크				
			// 2021\\06\\17\\s_2a7f8a81-525e-4781-a814-970096f42b45_2.png
			var fileCallPath = encodeURIComponent(obj.a_path+"\\s_"+obj.a_uuid+"_"+obj.a_name);
		
			// 원본 이미지 경로
			var originPath = obj.a_path+"\\"+obj.a_uuid+"_"+obj.a_name;
			originPath = originPath.replace(new RegExp(/\\/g),"/");
			console.log(originPath);
		
			str+="<li data-path='"+obj.a_path+"' data-uuid='"+obj.a_uuid+"'";
			str+=" data-filename='"+obj.a_name+"' data-type='image'>";
			str+="<a href=\"javascript:showImage(\'"+originPath+"\')\">";
			str+="<span>"+obj.a_name+"</span>";
			str+="<button type='button' class='btn btn-primary btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='image'>";
			str+="<i class='fa fa-times'></i></button><br>";			
			str+="<img src='/display?fileName="+fileCallPath+"'></a>";
			str+="</li>";

		})		
		uploadResult.append(str);
	}// showUploadedFile 종료	
	
	
	//submit 버튼 중지
	$("button[type='submit']").click(function(e){
		e.preventDefault();
		
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

		var str="";
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
			//수집된 정보를 hidden 태그로 작성
			str+="<input type='hidden' name='attachList["+idx+"].a_uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].a_path' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].a_name' value='"+job.data("filename")+"'>";
		})
		
		
		console.log(str);
		
		//게시글 등록 폼 가져오기
		var form = $("form");
		//수집된 내용 폼에 추가하기
		form.append(str);
		form.append("<input type='hidden' name='b_writer' value='홍홍길동'>");
		//폼 전송하기
		form.submit();
	})
	
	//X버튼 클릭시 동작
	$(".uploadResult").on("click","button",function(){
		//목록에 있는 첨부파일 삭제,서버 폴더 첨부파일 삭제
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		//li 태그 가져오기
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/deleteFile',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:{
				fileName:targetFile,
				type:type
			},
			type:'post',
			success:function(result){
				console.log(result);
				targetLi.remove();
			}
		})
		
	})
})
























