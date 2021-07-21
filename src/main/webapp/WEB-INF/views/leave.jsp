<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formleave" action="leaveForm" method="post">
		<div class="login-Form">
			<h1 class="h1" style="font-family: naBrush">ȸ�� Ż��</h1>
			<div class="login-margin">
				<label for="u_userid" class="sr-only">�α���</label>
				<input type="text" id="u_userid" name="u_userid" class="form-control-login" value="${login.u_userid}" readonly/>
			</div> 
			<div class="login-margin">
				<label for="u_password" class="sr-only">��й�ȣ</label>
				<input type="password" id="u_password" name="u_password" class="form-control-login" placeholder="��й�ȣ�� �Է��� �ּ���" />
			</div>
			<div class="login-margin">
				<label> 
					ȸ��Ż��� ��¼����¼��
				</label>
			</div>
			<button class="btn btn-lg btn-danger btn-block" id="leave" type="submit">ȸ��Ż��</button>
			<button class="btn btn-lg btn-primary btn-block" id="cancel">���</button>
			
			<div class="error-message">
				<span>${loginError}</span>
			</div>
		</div>
	</form>

<%@include file="../design/footer.jsp" %>