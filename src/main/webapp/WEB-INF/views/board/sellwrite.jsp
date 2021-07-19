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
				<h3 class="heading-section" style="font-family: naBrush;">��ǰ ���</h3>
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">�� ��ǰ ���</h3>
			</div>
			<form action="" method="post">
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control inlinetest " name="p_name"
						id="campusboard-product-name" placeholder="��ǰ �̸� �Է�" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="p_number"
						id="campusboard-product-code" placeholder="��ǰ ��ȣ �Է�" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="pc_code"
						id="campusboard-product-pccode" placeholder="ī�װ� ��ȣ �Է�" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="p_stock"
						id="campusboard-product-stock" placeholder="��� �Է�" />
				</div>
				<hr class="one" />
				<div class="col-md-10"> <input type="text"
						class="form-control width70 inlinetest " name="p_manufact"
						id="campusboard-product-stock" placeholder="������ �Է�" />
				</div>
				<hr class="one" />
				<div class="col-md-8">

					<div class="blacktext">��ǰ �̹��� ���</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="campusFile" multiple
								class="form-control " />
						</div>
						<div class="uploadResult resultpage1">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-10"><input type="text"
						class="form-control width70 inlinetest " name="p_price"
						id="campusboard-product-price" placeholder="��ǰ ���� �Է� (���ڷθ�)" />
				</div>
				<hr class="one" />
				<div class="col-md-10">
					<label for="campusboard-title " class="label"><h5>�ɼ�
							�̸�</h5></label> <input type="text"
						class="form-control width70 inlinetest " name="po_optiontitle"
						id="campusboard-product-optiontitle" placeholder=" ���� �� ����" />
					<hr class="one" />


					<div class="col-md-10 mll20 optionadd">
						<label for="campusboard-title " class="label"><h5>�ɼ�
							</h5></label> <input type="text"
							class="form-control width70 inlinetest " name="po_option1"
							id="campusboard-product-option-1" placeholder=" ���� �� ����" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>�ɼ�
							</h5></label> <input type="text"
							class="form-control width70 inlinetest " name="po_option2"
							id="campusboard-product-ption-2" placeholder=" ���� �� ����" />
					</div>
					<div class="col-md-10 mll20 optionadd margintb20">
						<label for="campusboard-title " class="label"><h5>�ɼ�
							</h5></label> <input type="text"
							class="form-control width70 inlinetest " name="po_option3"
							id="campusboard-product-option-3" placeholder=" ���� �� ����" />
					</div>


				</div>
				<hr class="one" />
				<div class="col-md-12">
					<h5>���� ����</h5>
					<textarea class="form-control " cols="50" rows="50" id ="campusboard-product-content" name="b_content"
						style="resize: none" placeholder="���� ������ �߰��� �ּ���" ></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8">
					<div class="blacktext">���� �߰��� ���� ��� (jpg/png)</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="uploadFile" multiple
								class="form-control " />
						</div>
						<div class="uploadResult resultpage2">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20"></div>
				
				<button class="btn btn-primary" type="submit">���</button>
				
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>

</section>
<script src="/resources/main/js/campus_sellwrite.js"></script>


<%@include file="../../design/footer.jsp"%>
