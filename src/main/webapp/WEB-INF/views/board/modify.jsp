<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">

<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<hr class="one" />
				<h3 class="heading-section hoverthema" style="font-family: naBrush;" onclick="location.href='list'">����
					�Խ���</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">�� ����</h3>
			</div>
			<form action="" method="post" role="form">
				<div class="col-md-8 mll20">
					<select name="b_sort" id="sort"
						class="form-control width15 inlinetest">
						<option value="">�з�</option>
						<option value="�ı�">�ı�</option>
						<option value="����">����</option>
					</select><input type="text"
						class="form-control width70 inlinetest mll10" name="b_title"
						id="campusboard-title" placeholder="������ �Է��� �ּ���" value="${campusVO.b_title}"/>
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
					<textarea class="form-control" cols="30" rows="15" id="campusboard-content" name="b_content" 
						style="resize: none" placeholder="������ �Է��� �ּ���">${campusVO.b_content}</textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<div class="blacktext">���� ÷�� (jpg/png, �ִ� 20MB, �ִ� 3��)</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="campusFile" multiple
								class="form-control" />
						</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<button class="btn btn-primary" type="button" data-oper="modify" type="submit">�� ����</button>
					<button class="btn btn-green1" type="button" data-oper="remove" type="submit">����</button>
					<button class="btn btn-green2" type="button" data-oper="list" type="submit">����Ʈ</button>
				</div>
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>
	
	<%-- remove�� list�� ���� ��--%>
	<form action="" id="operForm" method="POST">
		<input type="hidden" name="keyword" value="${cri.keyword}" />
		<input type="hidden" name="page" value="${cri.page}" />
		<input type="hidden" name="sort" value="${cri.sort}" />
		<input type="hidden" name = "b_no" value="${campusVO.b_no}"/>
		
		<%-- spring security csrf�� �߰� --%>

	</form>
	
</section>
<script>
	let b_no = ${campusVO.b_no};
	let catchnum = 0;
</script>

<script src="/resources/main/js/campusmodify.js"></script>
<%@include file="../../design/footer.jsp"%>