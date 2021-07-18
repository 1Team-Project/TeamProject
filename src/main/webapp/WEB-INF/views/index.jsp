<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>spring mvc 게시판</h1>
<p>
	<a href="/board/list">게시판</a>
</p>
<p>
	<a href="/member/login">로그인</a>
</p>

<form action="/board/sellmodify" method="get">
	<input type="hidden" name="p_number" value="4444"/>
	<input type="hidden" name="b_no" value="355"/>
	<button type="submit">sell modify</button>
</form>

</body>
</html>