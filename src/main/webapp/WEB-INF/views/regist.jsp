<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
	<form id="formId" action="regist2" method="post">
		<div class="regist-Form">
			<div class="form-group">
				<h2>회원가입 정보 입력</h2>
				<p></p>
		  		<label for="u_userid" style="font-family: naBrush">아이디</label>
		  		<button type="button" id="chkId" class="btn btn-primary" style="font-size:20px">중 복</button>
		  		<div class="regist-margin">
		    		<input type="text" name="u_userid" id="u_userid" class="form-control-regist" placeholder="영문, 숫자 4 ~12자리" />
		  		</div>
		    	<i id="u_userid" class="text-info"></i>
			</div>

			<div class="form-group">
		  		<label for="u_password" style="font-family: naBrush">비밀번호</label>
		  		<div class="regist-margin">
		    		<input type="password" name="u_password" id="u_password" class="form-control-regist" placeholder="영문, 숫자 8 ~12자리, 특수문자 !@#$%^&* 사용가능" />
		  		</div>
	    		<i id="u_password" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="confirm_password" style="font-family: naBrush">비밀번호 확인</label>
		  		<div class="regist-margin">
		    		<input type="password" name="confirm_password" id="confirm_password" class="form-control-regist" placeholder="영문, 숫자 8 ~12자리, 특수문자 !@#$%^&* 사용가능" />
		  		</div>
	    		<i id="confirm_password" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="u_username" style="font-family: naBrush">이    름</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_username" id="u_username" class="form-control-regist" placeholder="이름을 입력하세요" />
		  		</div>
	    		<i id="u_username" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="u_email" style="font-family: naBrush">이메일</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_email" id="u_email" class="form-control-regist" placeholder="example@gmail.com" />
		  		</div>
		  		<div class="regist-margin">
		    		<input type="text" name="u_email_check" id="u_email_check" class="form-control-regist" placeholder="인증번호 입력" />
		  		</div>
	    		<i id="u_email" class="text-info" name="chk_text"></i>
	    		<div class="regist-margin">
			  		<button type="button" id="chkEmail" class="btn btn-primary" style="font-size:20px">메일인증</button>
			  		<button type="button" id="chkNum" class="btn btn-primary" style="font-size:20px">인증번호 확인</button>
		  		</div>
			</div>
			
			<div class="form-group">
		  		<label for="u_phone" style="font-family: naBrush">전화번호</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_phone" id="u_phone" class="form-control-regist" placeholder="전화번호를 입력하세요" />
		  		</div>
	    		<i id="u_phone" class="text-info"></i>
			</div>
			
			<div class="form-group">
		  		<label for="u_address" style="font-family: naBrush">주    소</label>
		  		<div class="regist-margin">
		    		<input type="text" name="u_address" id="u_address" class="form-control-regist" placeholder="주소를 입력하세요" />
		  		</div>
	    		<i id="u_address" class="text-info"></i>
			</div>
			<div class="form-group">
		  		<button type="submit" id="signup" class="btn btn-primary" style="font-size:20px">입 력</button>
		  		<button type="reset" class="btn btn-danger" style="font-size:20px" onclick="location.href='/'">취 소</button>
		    </div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
<script src="/resources/main/js/register_yk.js"></script>
<%@include file="../design/footer.jsp" %>