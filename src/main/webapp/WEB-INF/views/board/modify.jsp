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
				<h3 class="colorthema margintb20 padding6px">�� ����</h3>
			</div>
			<form action="">
				<div class="col-md-8 mll20">
					<select name="form-select" id=""
						class="form-control width15 inlinetest boldergreen">
						<option value="">�з�</option>
						<option value="�ı�">�ı�</option>
						<option value="����">����</option>
					</select> <label for="campusboard-title " class="label"><h5>
							�� ��</h5></label> <input type="text"
						class="form-control width70 inlinetest boldergreen"
						id="campusboard-title" />
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
					<h5>����</h5>
					<textarea class="form-control boldergreen" cols="30" rows="15"
						style="resize: none"></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<div class="blacktext">���� ÷��</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="uploadFile" multiple
								class="form-control boldergreen" />
						</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<button class="btn btn-primary">�� ����</button>
					<button class="btn btn-green1" type="reset">����</button>
					<button class="btn btn-green2" type="reset">����Ʈ</button>
				</div>
		</div>
		</form>
	</div>
	<div class="col-md-1 margintb20"></div>
	</div>
</section>



<%@include file="../../design/footer.jsp"%>