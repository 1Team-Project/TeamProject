<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
    <style>
        
		*{
            border-collapse: collapse;
            text-decoration: none;
            color: black;
        }
        #titleArea {
		    margin: 20px 0 20px;
		    text-align: center;
		}
        .titleArea h2 {
		    display: inline-block;
		    *display: inline;
		    *zoom: 1;
		    padding: 0;
		    color: #000000;
		    font-size: 20px;
		}
        h1, h2, h3, h4 {
            font-weight: 500;
        }
        .displaynone {
            display: none !important;
        }
         /*#editForm {
            text-align: center;
        } */
        #b-button {
            text-align: center;
        }
        input, select, textarea {
            vertical-align: middle;
        }
        input[type=text], input[type=password] {
            height: 18px;
            line-height: 20px;
            padding: 2px 4px;
            border: 1px solid #dddddd;
        }
       
        .ec-base-table table {
            position: relative;
            margin: 10px 0 0;
            border: 0;
            table-layout: fixed;
        }
        caption {
            display: none;
        }
        colgroup {
            display: table-column-group;
        }
        #main {
            display: table;
            width: 100%;
            table-layout: fixed;
            /* text-align: center; */
            max-width: 600px;
            margin: 0 auto;
        }
        .ec-base-table tbody {
            border-top: 1px solid #ddd;
        }
        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }
        tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
        }
        th, td {
            border: 0;
            vertical-align: top;
        }       
        .ec-base-table tbody th {
            padding: 10px 0 10px 19px;
            border-bottom: 1px solid #ddd;
            color: #353535;
            text-align: left;
            font-weight: normal;
            background: #f9f9f9;
        }
        .ec-base-table.typeWrite td {
            padding: 10px 10px 10px;
        }
        .ec-base-table td {
            padding: 10px 10px 10px;
            border-bottom: 1px solid #ddd;
            color: #353535;
            vertical-align: middle;
            word-break: break-all;
            word-wrap: break-word;
        }
        td {
            display: table-cell;
            vertical-align: inherit;
        }
        body, code {
            font-size: 12px;
            font-family: 'Noto Sans KR',sans-serif;
            line-height: 1.8;
            color: #666;
            -webkit-text-size-adjust: 100%;
        }
        .mobile{
            display:inline-block;
        }
        #postcode1 {
            width: 60px;
            text-align: center;
        }
        .ec-base-button gColumn{
        	text-align: center;
        }
        
    </style>

 <div id="titleArea">
        <h2>회원 정보 수정</h2>
    </div>
    <form id="modifyForm" name="modifyForm" action="/mypageModify" method="post" target="_self" enctype="multipart/form-data">
        <div id="main" class="ec-base-table typeWrite gClearBorderTop ">
        <sec:authentication property="principal" var="user"/>
            <table border="1">
                <caption>회원 기본정보</caption>
                <colgroup>
                    <col style="width:100px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">아이디</th>
                        <td>
                            <input id="u_userid" name="u_userid"
                                fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="아이디"
                                fw-msg="" class="inputTypeText" placeholder="" value="${user.campusUser.u_userid}" type="text" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">비밀번호</th>
                        <td>
                            <input id="u_password" name="u_password" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
                                fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" "disabled" value=""
                                type="password">
                            <p class="ec-base-help typeDash">(비밀번호조건)</p>
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">비밀번호<br>확인</th>
                        <td><input id="confirm_password" name="confirm_password" fw-filter="isFill&amp;isMatch[passwd]"
                                fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
                                0="disabled" value="" type="password"> <span id="pwConfirmMsg"></span>
                        </td>
                    </tr>

                    <tr style="display:1">
                        <th scope="row" id="">이름</th>
                        <td><input id="u_username" name="u_username" fw-filter="isFill&amp;isMax[30]" fw-label="이름"
                                fw-msg="" class="ec-member-name" placeholder="" maxlength="30"
                                value="${user.campusUser.u_username}" type="text" readonly></td>
                    </tr>

                    <tr class="">
                        <th scope="row">주소</th>
                        <td>
                            <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1"
                                fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14"
                                value="" type="text"> <button type="button" class="btnBasic"
                                onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');"
                                id="postBtn">우편번호</button><br>
                            <input id="u_address" name="u_address" fw-filter="isFill" fw-label="주소" fw-msg=""
                                class="inputTypeText" placeholder="" readonly="readonly" value="${vo.u_address}" type="text"><br>
                            <input id="u_address" name="u_address" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText"
                                placeholder="" value="${user.campusUser.u_address}" type="text"> <span class="ec-base-help typeDash"></span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">이메일</th>
                        <td>
                            <input id="u_email" name="u_email"
                                fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="이메일"
                                fw-msg="" class="inputTypeText" placeholder="" value="${user.campusUser.u_email}" type="text">
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">휴대전화</th>
                        <td class="mobile">
                            <select id="mobile1" name="mobile[]" fw-filter="isNumber&amp;isFill" fw-label="휴대전화"
                                fw-alone="N" fw-msg="">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            -<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill"
                                fw-label="휴대전화" fw-alone="N" fw-msg="" value="${user.campusUser.u_phone}" type="text">
                            -<input id="mobile3"
                                name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화"
                                fw-alone="N" fw-msg="" value="${user.campusUser.u_phone}" type="text">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <div id="b-button" class="ec-base-button gColumn">
            <button type="submit" id="mo_update"class="btn btn-info">회원정보수정</button>
            <button type="submit" id="mo_cancel" class="btn btn-warning">취 소</button>
            <button type="submit" id="mo_leave"class="btn btn-secondary">회원탈퇴</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<!--<input type="hidden"  name="u_userid" value="${vo.u_userid}"/>
<input type="hidden" name="u_username" value="${vo.u_username}"/>  -->

    </form>
    <script>
    $(function(){
    	$("#mo_cancel").click(function(){
    		alert("정보 수정을 취소합니다.");
    		$("#modifyForm").attr("action", "loginMypageForm");
    	});
    	$("#mo_leave").click(function(){
    		$("#modifyForm").attr("action", "leave");
    	});
    	
    })
	</script>
<%@include file="../design/footer.jsp" %>