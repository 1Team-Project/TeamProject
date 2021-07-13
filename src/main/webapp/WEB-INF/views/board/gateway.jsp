<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>



<form action="" id="operForm" method="get">
	<input type="hidden" name="type" value="${cri.sort}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="b_no" value="${vo.b_no}"/>
	<input type="hidden" name="sort" value="${CampusPageVO.cri.sort}" />
	<input type="hidden" name="keyword" value="${CampusPageVO.cri.keyword}" />
	<input type="hidden" name="page" value="${CampusPageVO.cri.page}" />
</form>        
