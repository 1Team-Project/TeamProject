<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
<style>
		*{
            border-collapse: collapse;
            text-decoration: none;
            color: black;
        }
        #titleArea {
            text-align: center;
        }

        #editForm {
            text-align: center;
        }

        #main {
            display: table;
            width: 100%;
            table-layout: fixed;
            text-align: center;
            max-width: 500px;
            margin: 0 auto;
        }
</style>

<div id="titleArea">
        <h2>회원 정보 수정</h2>
    </div>
    <form id="editForm" name="editForm" action="" method="" target="_self" enctype="multipart/form-data">
        <div id="main" class="ec-base-table typeWrite gClearBorderTop ">
            <table border="1">
                <caption>회원 기본정보</caption>
                <colgroup>
                    <col style="width:100px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">아이디 <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" width="5"
                                height="5" alt="필수"></th>
                        <td>
                            <input id="userid" name="userid"
                                fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="아이디"
                                fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">비밀번호 <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" class=""
                                width="5" height="5" alt="필수"></th>
                        <td>
                            <input id="password" name="password" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
                                fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value=""
                                type="password">
                            <p class="ec-base-help typeDash">(비밀번호조건)</p>
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">비밀번호<br>확인 <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" width="5"
                                height="5" alt="필수"></th>
                        <td><input id="password_confirm" name="password_confirm" fw-filter="isFill&amp;isMatch[passwd]"
                                fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
                                0="disabled" value="" type="password"> <span id="pwConfirmMsg"></span>
                        </td>
                    </tr>

                    <tr style="display:1">
                        <th scope="row" id="">이름 <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" width="5"
                                height="5" alt="필수"></th>
                        <td><input id="username" name="username" fw-filter="isFill&amp;isMax[30]" fw-label="이름"
                                fw-msg="" class="ec-member-name" placeholder="" maxlength="30" readonly="readonly"
                                value="" type="text"></td>
                    </tr>

                    <tr class="">
                        <th scope="row">주소 <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" class=""
                                width="5" height="5" alt="필수"></th>
                        <td>
                            <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1"
                                fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14"
                                value="" type="text"> <button type="button" class="btnBasic"
                                onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');"
                                id="postBtn">우편번호</button><br>
                            <input id="addr1" name="addr1" fw-filter="isFill" fw-label="주소" fw-msg=""
                                class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"><br>
                            <input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText"
                                placeholder="" value="" type="text"> <span class="ec-base-help typeDash"></span>
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">휴대전화 <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" class=""
                                width="5" height="5" alt="필수"></th>
                        <td><select id="mobile1" name="mobile[]" fw-filter="isNumber&amp;isFill" fw-label="휴대전화"
                                fw-alone="N" fw-msg="">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>-<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill"
                                fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">-<input id="mobile3"
                                name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화"
                                fw-alone="N" fw-msg="" value="" type="text"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <div class="ec-base-button gColumn">
            <a href="mypage.html" class="btnSubmit" onclick="memberEditAction()">회원정보수정</a>
            <a href="mypage.html" class="btnEm">취소</a>
        </div>

    </form>
<%@include file="../design/footer.jsp" %>