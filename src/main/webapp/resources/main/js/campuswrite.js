/**
 * 파일업로드
 */
$(function(){
	
		let checkistrue = false;
	
		$(".checkbtn").click(function(){
		
		var pnumber = $("#campusboard-pnumber").val();

		$.ajax({
			url: "/board/checkpnumber",
			type: "POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data: {
				 p_number : pnumber
			},
			success: function(result){
				if(result=='not'){

					$('.checkpnumbermsg').html("<p>해당 상품 번호와 동일한 상품이 존재하지 않습니다.</p>");
					checkistrue = false;
					return false;
				} else {

					$('.checkpnumbermsg').html("<p>상품명 : "+result+"</p>");
					checkistrue = true;
					return false;
				}
			}
		})
	})
	
	
	$("#sort").change(function(){
		var star = ""
		if($("#sort option:selected").val() == '후기'){
			
			star += '<div class="warning_msg">해당 상품의 별점을 선택해 주세요</div>'
			star += '<input type="checkbox" name="b_rating" id="rating1" value="1" class="rate_radio" title="1점"><label for="rating1"></label>'
			star += '<input type="checkbox" name="b_rating" id="rating2" value="2" class="rate_radio" title="2점"><label for="rating2"></label>'
			star += '<input type="checkbox" name="b_rating" id="rating3" value="3" class="rate_radio" title="3점"><label for="rating3"></label>'
			star += '<input type="checkbox" name="b_rating" id="rating4" value="4" class="rate_radio" title="4점"><label for="rating4"></label>'
			star += '<input type="checkbox" name="b_rating" id="rating5" value="5" class="rate_radio" title="5점"><label for="rating5"></label>'
			
			$(".rating").html(star)
			
		}else{
			
			$(".warning_msg").remove();
			$("#rating1").remove();
			$("#rating2").remove();
			$("#rating3").remove();
			$("#rating4").remove();
			$("#rating5").remove();
			
		}
	})
	
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	    this.rate = newrate;
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx < newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	let rating = new Rating();
	
    $('.rating').click(function(e){
    let elem = e.target;
    if(elem.classList.contains('rate_radio'))
		{
        rating.setRate(parseInt(elem.value));
   		}
	})

	
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

			catchnum += 1;
			if(catchnum > 3){
				alert("사진은 최대 3개까지 업로드가 가능합니다.");
				catchnum -= 1;
				return false;
			}
			// 썸네일 이미지 경로 링크				
			// 2021\\07\\17\\s_2a7f8a81-525e-4781-a814-970096f42b45_2.png
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
		let pnumberis = $("#campusboard-pnumber").val();
		
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
		if(pnumberis == ""){
			alert("상품 번호를 작성해 주세요!");
			$("#campusboard-pnumber").focus();
			return;
		}
		if(checkistrue == false){
			alert("상품 번호를 확인해 주세요!");
			$("#campusboard-pnumber").focus();
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
		//폼 전송하기
		//form.submit();
	})
	
	//X버튼 클릭시 동작
	$(".uploadResult").on("click","button",function(){
		//목록에 있는 첨부파일 삭제,서버 폴더 첨부파일 삭제
		var targetFile = $(this).data("file");
		console.log(targetFile)
		catchnum -= 1;
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
			}
		})
		
	})
})
























