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
	
	
	$("input[name='campusFile']").change(function(){
		
		//첨부 파일 가져오기
		var files=$("input[name='campusFile']")[0].files;
		console.log(files);
		
		//첨부파일을 formData 로 만들어 전송
		var campusFormData = new FormData();
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			if(i>=4){
				alert("사진은 최대 4개까지 업로드가 가능합니다.");
				$("input[name='campusFile']").val("");
				return false;
			}
			campusFormData.append("campusFile",files[i]);
		}		
		
		// enctype="multipart/form-data" => processData:false,contentType:false,
		
		$.ajax({
			url:'/uploadAjax', //도착지
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
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
	
	var catchnum = 0;
	
	function showUploadedFile(uploadResultArr){
		var str = "";
		var uploadResult = $(".resultpage1 ul");
		
		$(uploadResultArr).each(function(i,obj){

			catchnum += 1;
			if(catchnum > 4){
				alert("사진은 최대 4개까지 업로드가 가능합니다.");
				catchnum -= 1;
				return false;
			}
			
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
		
		let name = $("#campusboard-product-name").val();
		let title = $("#campusboard-product-title").val();
		let code = $("#campusboard-product-code").val();
		let price = $("#campusboard-product-price").val();
		let content = $("#campusboard-product-content").val();
		
		console.log(name)

		if(title == ""){
			alert("제목을 작성해 주세요!");
			$("#campusboard-product-title").focus();
			return;
		}
		if(name == ""){
			alert("이름을 작성해 주세요!");
			$("#campusboard-product-name").focus();
			return;
		}
		if(code == ""){
			alert("코드를 작성해 주세요!");
			$("#campusboard-product-title").focus();
			return;
		}
		if(price == ""){
			alert("가격을 작성해 주세요!");
			$("#campusboard-product-price").focus();
			return;
		}
		if(content == ""){
			alert("내용을 작성해 주세요!");
			$("#campusboard-product-content").focus();
			return;
		}
		if(content == ""){
			alert("재고를 작성해 주세요!");
			$("#campusboard-product-stock").focus();
			return;
		}
		if(content == ""){
			alert("카테고리 번호를 작성해 주세요!");
			$("#campusboard-product-pccode").focus();
			return;
		}

		var str="";
		var add=0;
		
		$(".resultpage1 ul li").each(function(idx,obj){
			var job = $(obj);

			str+="<input type='hidden' id='mainimg"+idx+"' name='attachList["+idx+"].a_uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' id='mainimg"+idx+"' name='attachList["+idx+"].a_path' value='"+job.data("path")+"'>";
			str+="<input type='hidden' id='mainimg"+idx+"' name='attachList["+idx+"].a_name' value='"+job.data("filename")+"'>";
			add +=1;
		})
				
		$(".resultpage2 ul li").each(function(idx,obj){
			var job = $(obj);

			str+="<input type='hidden' id='contentimg"+idx+"' name='attachList["+(idx+add)+"].a_uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' id='contentimg"+idx+"' name='attachList["+(idx+add)+"].a_path' value='"+job.data("path")+"'>";
			str+="<input type='hidden' id='contentimg"+idx+"' name='attachList["+(idx+add)+"].a_name' value='"+job.data("filename")+"'>";
		})
		
		console.log(str);
		
		//게시글 등록 폼 가져오기
		var form = $("form");
		//수집된 내용 폼에 추가하기
		form.append(str);

		form.append("<input type='hidden' name='b_sort' value='상품'>");
		form.append("<input type='hidden' name='b_title' value='상품'>");
		//폼 전송하기
		form.attr("action","/board/sellwrite")
		form.submit();
	})

	//X버튼 클릭시 동작
	$(".resultpage1").on("click","button",function(){
		//목록에 있는 첨부파일 삭제,서버 폴더 첨부파일 삭제
		var targetFile = $(this).data("file");
		console.log(targetFile)
		
		//li 태그 가져오기
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/deleteFile',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:{
				a_name:targetFile,
			},
			type:'post',
			success:function(result){
				console.log(result);
				targetLi.remove();
				catchnum -= 1;
			}
		})
		
	})
	
	
	
	
	
	
	
	
	var catchnum2 = 0;
	
	
		$("input[name='uploadFile']").change(function(){
		
		//첨부 파일 가져오기
		var files=$("input[name='uploadFile']")[0].files;
		console.log(files);
		
		//첨부파일을 formData 로 만들어 전송
		var campusFormData = new FormData();
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			if(i>=4){
				alert("사진은 최대 4개까지 업로드가 가능합니다.");
				$("input[name='uploadFile']").val("");
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
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:campusFormData,
			success:function(result){
				console.log(result);
				showUploadedFile2(result);
				$("input[name='uploadFile']").val("");
			},
			error:function(xhr,status,error){
				console.log("에러");
			}
		})
	})//input[type=file] 종료
	
	var catchnum = 0;
	
	function showUploadedFile2(uploadResultArr){
		var str = "";
		var uploadResult = $(".resultpage2 ul");
		
		$(uploadResultArr).each(function(i,obj){

			catchnum2 += 1;
			if(catchnum2 > 4){
				alert("사진은 최대 4개까지 업로드가 가능합니다.");
				catchnum2 -= 1;
				return false;
			}
			
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
	
	//X버튼 클릭시 동작
	$(".resultpage2").on("click","button",function(){
		//목록에 있는 첨부파일 삭제,서버 폴더 첨부파일 삭제
		var targetFile = $(this).data("file");
		console.log(targetFile)
		
		//li 태그 가져오기
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/deleteFile',
			beforeSend:function(xhr){
<<<<<<< HEAD
	            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	         },
=======
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
>>>>>>> b1afeac01614d6eeba44b90b0ffecd1b7576c409
			data:{
				a_name:targetFile,
			},
			type:'post',
			success:function(result){
				console.log(result);
				targetLi.remove();
				catchnum2 -= 1;
			}
		})
		
	})
	
	
})
























