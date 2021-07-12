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
        <h2>ȸ�� ���� ����</h2>
    </div>
    <form id="editForm" name="editForm" action="" method="" target="_self" enctype="multipart/form-data">
        <div id="main" class="ec-base-table typeWrite gClearBorderTop ">
            <table border="1">
                <caption>ȸ�� �⺻����</caption>
                <colgroup>
                    <col style="width:100px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">���̵� <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" width="5"
                                height="5" alt="�ʼ�"></th>
                        <td>
                            <input id="userid" name="userid"
                                fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="���̵�"
                                fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">��й�ȣ <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" class=""
                                width="5" height="5" alt="�ʼ�"></th>
                        <td>
                            <input id="password" name="password" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
                                fw-label="��й�ȣ" fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value=""
                                type="password">
                            <p class="ec-base-help typeDash">(��й�ȣ����)</p>
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">��й�ȣ<br>Ȯ�� <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" width="5"
                                height="5" alt="�ʼ�"></th>
                        <td><input id="password_confirm" name="password_confirm" fw-filter="isFill&amp;isMatch[passwd]"
                                fw-label="��й�ȣ Ȯ��" fw-msg="��й�ȣ�� ��ġ���� �ʽ��ϴ�." autocomplete="off" maxlength="16"
                                0="disabled" value="" type="password"> <span id="pwConfirmMsg"></span>
                        </td>
                    </tr>

                    <tr style="display:1">
                        <th scope="row" id="">�̸� <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" width="5"
                                height="5" alt="�ʼ�"></th>
                        <td><input id="username" name="username" fw-filter="isFill&amp;isMax[30]" fw-label="�̸�"
                                fw-msg="" class="ec-member-name" placeholder="" maxlength="30" readonly="readonly"
                                value="" type="text"></td>
                    </tr>

                    <tr class="">
                        <th scope="row">�ּ� <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" class=""
                                width="5" height="5" alt="�ʼ�"></th>
                        <td>
                            <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="�����ȣ1"
                                fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14"
                                value="" type="text"> <button type="button" class="btnBasic"
                                onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');"
                                id="postBtn">�����ȣ</button><br>
                            <input id="addr1" name="addr1" fw-filter="isFill" fw-label="�ּ�" fw-msg=""
                                class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"><br>
                            <input id="addr2" name="addr2" fw-filter="" fw-label="�ּ�" fw-msg="" class="inputTypeText"
                                placeholder="" value="" type="text"> <span class="ec-base-help typeDash"></span>
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">�޴���ȭ <img
                                src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_required.png" class=""
                                width="5" height="5" alt="�ʼ�"></th>
                        <td><select id="mobile1" name="mobile[]" fw-filter="isNumber&amp;isFill" fw-label="�޴���ȭ"
                                fw-alone="N" fw-msg="">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>-<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill"
                                fw-label="�޴���ȭ" fw-alone="N" fw-msg="" value="" type="text">-<input id="mobile3"
                                name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="�޴���ȭ"
                                fw-alone="N" fw-msg="" value="" type="text"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <div class="ec-base-button gColumn">
            <a href="mypage.html" class="btnSubmit" onclick="memberEditAction()">ȸ����������</a>
            <a href="mypage.html" class="btnEm">���</a>
        </div>

    </form>
<%@include file="../design/footer.jsp" %>