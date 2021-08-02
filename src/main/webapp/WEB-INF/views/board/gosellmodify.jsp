<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">

<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
      
			<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section hoverthema" style="font-family: naBrush;" onclick="location.href='list'">통합
					게시판</h3>
				<hr class="one" />
			</div>
      
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">상품 수정</h3>
			</div>
      
      <form action="/board/sellmodify" method="get" id="operForm">
				<div class="col-md-8 mll20">
					<input type="text" class="form-control width70 inlinetest"
					id="campusboard-pnumber" required placeholder="수정하실 상품의 코드를 입력해 주세요" name="p_number"/>
					<button class="btn btn-primary checkbtn" type="button">상품 수정</button>
				</div>
      </form>
        
				<div class="col-md-8 mll20 checkpnumbermsg"></div>

				</div>
	  <div class="col-md-1 margintb20"></div>
  </div>
</section>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script>
$(function(){
	
		var form = $("#operForm");
	
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
					return false;
				} else {
					form.submit();
					return false;
					
				}
			}
		})
	})
</script>
<%@include file="../../design/footer.jsp"%>