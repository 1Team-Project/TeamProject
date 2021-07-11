<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formId" action="loginForm" method="post">
		<div class="login-Form">
			<h1 class="h1" style="font-family: naBrush">�α���</h1>
			<div class="login-margin">
				<label for="userid" class="sr-only">�α��� ���̵�</label>
				<input type="text" id="userid" name="userid" class="form-control-login" placeholder="���̵� �Է��� �ּ���" />
			</div> 
			<div class="login-margin">
				<label for="password" class="sr-only">��й�ȣ</label>
				<input type="password" id="password" name="password" class="form-control-login" placeholder="��й�ȣ�� �Է��� �ּ���" />
			</div>
			<div class="login-margin">
				<label> 
					<input type="checkbox" name="remember-me"> �α��� ����ϱ�
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="login" type="submit">�α���</button>
			<button class="btn btn-lg btn-primary btn-block" id="regist">ȸ������</button>
			<input type="hidden" name="${userid}" value="${password}"/>
			<div class="error-message">
				<span>${loginError}</span>
			</div>
		</div>
	</form>
<script>
	$(function(){
		/* ȸ������ ��ư ������ ������ �̵� */
		$("#regist").click(function(){
			$("#formId").attr("action", "agree");
		});
		
		/* �α��� ��ư ���� */
 		$("#login").click(function(){
 			if($("#userid").val() == ""){
 				alert("���̵� �Է��ϼ���");
 				$("#userid").focus();
 				return false;
 			} else if($("#password").val() == ""){
 				alert("��й�ȣ�� �Է��ϼ���")
 				$("#password").focus();
 				return false;
			}
 		});
	})
</script>
<%@include file="../design/footer.jsp" %>