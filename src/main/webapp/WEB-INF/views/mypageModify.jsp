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
        <h2>ȸ�� ���� ����</h2>
    </div>
    <form id="modifyForm" name="modifyForm" action="/mypageModify" method="post" target="_self" enctype="multipart/form-data">
        <div id="main" class="ec-base-table typeWrite gClearBorderTop ">
            <table border="1">
                <caption>ȸ�� �⺻����</caption>
                <colgroup>
                    <col style="width:100px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">���̵�</th>
                        <td>
                            <input id="u_userid" name="u_userid"
                                fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="���̵�"
                                fw-msg="" class="inputTypeText" placeholder="" value="${login.u_userid}" type="text" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">��й�ȣ</th>
                        <td>
                            <input id="u_password" name="u_password" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
                                fw-label="��й�ȣ" fw-msg="" autocomplete="off" maxlength="16" "disabled" value=""
                                type="password">
                            <p class="ec-base-help typeDash">(��й�ȣ����)</p>
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">��й�ȣ<br>Ȯ��</th>
                        <td><input id="confirm_password" name="confirm_password" fw-filter="isFill&amp;isMatch[passwd]"
                                fw-label="��й�ȣ Ȯ��" fw-msg="��й�ȣ�� ��ġ���� �ʽ��ϴ�." autocomplete="off" maxlength="16"
                                0="disabled" value="" type="password"> <span id="pwConfirmMsg"></span>
                        </td>
                    </tr>

                    <tr style="display:1">
                        <th scope="row" id="">�̸�</th>
                        <td><input id="u_username" name="u_username" fw-filter="isFill&amp;isMax[30]" fw-label="�̸�"
                                fw-msg="" class="ec-member-name" placeholder="" maxlength="30"
                                value="${login.u_username}" type="text" readonly></td>
                    </tr>

                    <tr class="">
                        <th scope="row">�ּ�</th>
                        <td>
                            <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="�����ȣ1"
                                fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14"
                                value="" type="text"> <button type="button" class="btnBasic"
                                onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');"
                                id="postBtn">�����ȣ</button><br>
                            <input id="u_address" name="u_address" fw-filter="isFill" fw-label="�ּ�" fw-msg=""
                                class="inputTypeText" placeholder="" readonly="readonly" value="${vo.u_address}" type="text"><br>
                            <input id="u_address" name="u_address" fw-filter="" fw-label="�ּ�" fw-msg="" class="inputTypeText"
                                placeholder="" value="${login.u_address}" type="text"> <span class="ec-base-help typeDash"></span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">�̸���</th>
                        <td>
                            <input id="u_email" name="u_email"
                                fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="�̸���"
                                fw-msg="" class="inputTypeText" placeholder="" value="${login.u_email}" type="text">
                        </td>
                    </tr>
                    <tr class="">
                        <th scope="row">�޴���ȭ</th>
                        <td class="mobile">
                            <select id="mobile1" name="mobile[]" fw-filter="isNumber&amp;isFill" fw-label="�޴���ȭ"
                                fw-alone="N" fw-msg="">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            -<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill"
                                fw-label="�޴���ȭ" fw-alone="N" fw-msg="" value="${vo.u_phone}" type="text">
                            -<input id="mobile3"
                                name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="�޴���ȭ"
                                fw-alone="N" fw-msg="" value="${login.u_phone}" type="text">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <div id="b-button" class="ec-base-button gColumn">
            <a href="mypage.html" class="btnSubmit" onclick="memberEditAction()">ȸ����������</a>
            <a href="mypage.html" class="btnEm">���</a>
            <a href="mypage.html" class="btnEm">ȸ��Ż��</a>
        </div>
<!--<input type="hidden"  name="u_userid" value="${vo.u_userid}"/>
<input type="hidden" name="u_username" value="${vo.u_username}"/>  -->

    </form>
<%@include file="../design/footer.jsp" %>