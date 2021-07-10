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
				<h3 class="heading-section" style="font-family: naBrush">���� �Խ���
				</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">�� �б�</h3>
			</div>
			<form action="">
				<div class="col-md-8 mll20">
					<span class="hh4">[�з�]</span> <input type="text"
						class="form-control width70 inlinetest mll10"
						id="campusboard-title" readonly />
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
					<h5>����</h5>
					<textarea class="form-control" cols="30" rows="15"
						style="resize: none" readonly></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">

					<div class="">
						<div class="">
							<i class=""></i> ÷�� ���
						</div>
						<div class="panel-body">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
				<div class="bigPictureWrapper">
					<div class="bigPicture"></div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<button class="btn btn-primary">�����ϱ�</button>
					<button class="btn btn-green2" type="reset">����Ʈ</button>
				</div>
				<hr class="one" />
		</div>
		</form>
		<!-- ��� �� -->
		<div class="col-md-1"></div>
		<div class="col-md-10 mll10">
			<form action="">
				<div class="col-md-8 mll20">
					<h5>��� �ۼ�</h5>
					<textarea class="form-control" cols="30" rows="3"
						style="resize: none"></textarea>
					<button class="btn btn-primary float-end m-1 mr-0">��� �ۼ�</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-1"></div>
	</div>
	<div class="col-md-1"></div>
	<div class="col-md-10 mll10">
		<hr class="one" />
		<!-- ��� ����Ʈ -->

		<div class="col-md-8 mll20 margintb20">
			<h6 class="float-start">�ۼ���</h6>
			<a href="" class="float-end blacktext hoverthema">[����]</a> <a href=""
				class="float-end blacktext hoverthema">[����]</a>
			<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">2020/07/08</h7>
			<textarea class="form-control" cols="30" rows="3"
				style="resize: none" readonly></textarea>
		</div>

		<div class="col-md-8 mll20 margintb20">
			<h6 class="float-start">�ۼ���</h6>
			<a href="" class="float-end blacktext hoverthema">[����]</a> <a href=""
				class="float-end blacktext hoverthema">[����]</a>
			<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">2020/07/08</h7>
			<textarea class="form-control" cols="30" rows="3"
				style="resize: none" readonly></textarea>
		</div>

		<div class="col-md-8 mll20 margintb20">
			<h6 class="float-start">�ۼ���</h6>
			<a href="" class="float-end blacktext hoverthema">[����]</a> <a href=""
				class="float-end blacktext hoverthema">[����]</a>
			<h7 class="float-end m-1 mr-2 mt-0 md-0 ml-0">2020/07/08</h7>
			<textarea class="form-control" cols="30" rows="3"
				style="resize: none" readonly></textarea>
		</div>

		<div class="row">
			<div class="col-md-12">
				<ul class="mypagination justify-content-center">
					<li class="mypage-item"><a href="#" class="mypage-link">
							<< </a></li>
					<li class="mypage-item"><a href="#"
						class="mypage-link activecolor">1</a></li>
					<li class="mypage-item"><a href="#" class="mypage-link">2</a>
					</li>
					<li class="mypage-item"><a href="#" class="mypage-link">3</a>
					</li>
					<li class="mypage-item"><a href="#" class="mypage-link">
							>> </a></li>
				</ul>
			</div>
		</div>


		<button class="btn btn-green2 mll20" type="reset">����Ʈ</button>

	</div>
	<div class="col-md-1"></div>
	</div>
	<div class="col-md-1 margintb20"></div>
	</div>
</section>

<%@include file="../../design/footer.jsp"%>