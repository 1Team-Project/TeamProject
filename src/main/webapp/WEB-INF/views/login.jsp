<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form class="container" id="formId" action="loginForm" method="post">
		<div class="login-Form">
			<h1 class="h1" style="font-family: naBrush">�α���</h1>
			<div class="login-margin">
				<label for="u_userid" class="sr-only">�α��� ���̵�</label>
				<input type="text" id="u_userid" name="u_userid" class="form-control-login" placeholder="���̵� �Է��� �ּ���" />
			</div> 
			<div class="login-margin">
				<label for="u_password" class="sr-only">��й�ȣ</label>
				<input type="password" id="u_password" name="u_password" class="form-control-login" placeholder="��й�ȣ�� �Է��� �ּ���" />
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
		let error = '${error}';
		if(error){
			alert(error);
			return false;
		};
		
		$("#login").click(function(){
			let error = '${error}';
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
		/* �α��� ��ư ���� */
/* 	 	$("#login").click(function(){
			let error = '${error}';
 			if($("#userid").val() == ""){
 				alert("���̵� �Է��ϼ���");
 				$("#userid").focus();
 				return false;
 			} else if($("#password").val() == ""){
 				alert("��й�ȣ�� �Է��ϼ���")
 				$("#password").focus();
 				return false;
 			} else if(error){
				alert(error);
			} 
		})*/ 

	})

</script>
<%@include file="../design/footer.jsp" %>