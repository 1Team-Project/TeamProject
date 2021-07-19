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
				<h3 class="heading-section" style="font-family: naBrush;">����
					�Խ���</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">�� �� �ۼ�</h3>
			</div>
			<form action="write" method="post" role="form">
				<div class="col-md-8 mll20">
					<select name="b_sort" id="sort"
						class="form-control width15 inlinetest">
						<option value="">����</option>
						<option value="�ı�">�ı�</option>
						<option value="����">����</option>
					</select><input type="text"
						class="form-control width70 mll10 inlinetest"
						id="campusboard-title" required placeholder="������ �Է��� �ּ���" name="b_title"/>
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
					<textarea class="form-control" cols="30" rows="15" id="campusboard-content" 
						style="resize: none" required placeholder="������ �Է��� �ּ���" name="b_content"></textarea>
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
					<button class="btn btn-primary" type="submit">�� �ۼ�</button>
					<button class="btn btn-green1" type="reset">�ʱ�ȭ</button>
					<button class="btn btn-green2" type="reset">����Ʈ</button>
				</div>
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>
</section>
<script src="/resources/main/js/campuswrite.js"></script>
<%@include file="../../design/footer.jsp"%>