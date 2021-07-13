<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
<style>
        #contents {
            position: relative;
            margin: 60px auto 60px;
        }
        .myshop-orderhistorylistitem .order .date {
            font-weight: bold;
        }
        #titleArea {
            position: relative;
        }
        #titleArea h2 {
            padding: 0 40px 0;
            line-height: 43px;
            font-size: 16px;
            color: #000;
            text-align: center;
        }
        /* 주문/취소 구분 */
        .ec-base-tab ul {
            display: flex;
            border: 1px solid #ccc;
            font-size: 13px;
            word-break: break-all;
        }
        .ec-base-tab li:first-child {
            border-left: 0;
        }
        .ec-base-tab li.selected a {
            border-left: 0;
            color: #000;
            background: #fff;
            border-bottom: 1px solid #fff;
            margin-bottom: -1px;
        }
        .ec-base-tab a .number {
            display: inline-block;
            padding-left: 5px;
        }
        .ec-base-tab li {
            display: flex;
            flex: 1;
            min-height: 36px;
            border-left: 1px solid #ccc;
            text-align: center;
            background: #f5f5f5;
        }
        .ec-base-tab a {
            display: flex;
            flex-basis: 100%;
            justify-content: center;
            flex-wrap: nowrap;
            align-items: center;
            padding: 8px 10px;
            color: #999;
        }       

        /*검색기간설정 부분*/
         legend {
            height: 0;
            width: 0;
            display: block;
            text-indent: -9999em;
        } 
        legend {
            display: block;
            padding-inline-start: 2px;
            padding-inline-end: 2px;
            border-width: initial;
            border-style: none;
            border-color: initial;
            border-image: initial;
        }
        .myshop-orderhistoryhead .stateSelect {
                display: block;
                position: relative;
                margin: 0 0 7px;
                padding: 0 1px 0 34px;
            }
        .myshop-orderhistoryhead .stateSelect .state {
            position: absolute;
            top: 0;
            left: 0;
            height: 29px;
            line-height: 29px;
        }
        .myshop-orderhistoryhead fieldset {
            margin: 14px 14px 0;
            padding: 7px 8px;
            border: 1px solid #d5d5d5;
            font-size: 11px;
            background: #f1f1f1;
        }
        /*상태*/
        .myshop-orderhistoryhead .stateSelect select {
            width: 100%;
        }
        select {
            max-width: 100%;
            height: 29px;
            margin: 0;
            padding: 0 20px 0 8px;
            line-height: 29px;
            font-size: 13px;
            color: #333;
            word-break: break-all;
            font-weight: inherit;
            border: 1px solid #d7d5d5;
            border-radius: 0;
            background: #fff url(//img.echosting.cafe24.com/skin/mobile/common/ico_select.gif) no-repeat 100% 49%;
            background-size: auto 40px;
            -webkit-appearance: none;
        }
        option {
            font-weight: normal;
            display: block;
            white-space: nowrap;
            min-height: 1.2em;
            padding: 0px 2px 1px;
        }
        /*기간*/
        .myshop-orderhistoryhead fieldset .term {
            float: left;
            width: 34px;
            margin-top: 7px;
        }
        .myshop-orderhistoryhead fieldset .term + .ec-base-button {
            overflow: hidden;
            margin: 0;
        }
        .myshop-orderhistoryhead fieldset .term + .ec-base-button a:first-child {
            margin-left: 0;
        }
        .ec-base-button[class*="gColumn"] a, .ec-base-button[class*="gColumn"] button {
            flex: 1;
            margin: 0 0 0 4px;
            padding: 0 3px;
            white-space: nowrap;
        }
        .myshop-orderhistoryhead .btnNormal, .xans-myshop-orderhistoryhead .btnBasic {
            font-size: 11px;
            letter-spacing: -1px;
        }
        .btnNormal, .btnStrong, .btnBasic {
            height: 30px;
            line-height: 26px;
            padding: 0 10px;
            vertical-align: middle;
            font-size: 13px;
        }
        .btnNormal, .btnStrong, .btnBasic, .btnSubmit, .btnEm {
            display: inline-block;
            letter-spacing: 0;
            text-align: center;
            border-radius: 2px;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        /*눌린 버튼*/
        .xans-myshop-orderhistoryhead a.selected {
            background-color: #555;
            color: #fff;
            border: 1px solid #555;
        }
        /*기간 설정*/
        .myshop-orderhistoryhead a.btnBasic {
            color: #1b1b1b;
            border: 1px solid #bcbcbc;
            background: #fff;
        }
        /*기간설정 클릭시 나옴*/
        /* .myshop-orderhistoryhead fieldset #dataSearch {
            padding: 7px 0 0;
            display: none;
        } */
        .myshop-orderhistoryhead fieldset #dataSearch button {
            border: 0;
            margin: 0 0 0 4px;
        }
        .myshop-orderhistoryhead fieldset img {
            vertical-align: middle;
        }
        .myshop-orderhistoryhead fieldset #history_end_date {
            margin: 0 0 0 5px;
        }
        .myshop-orderhistoryhead fieldset .fText {
            width: 78px;
            height: 29px;
            padding: 0 6px;
            border: 1px solid #d5d5d5;
            line-height: 29px;
        }
        .myshop-orderhistoryhead fieldset input[type="image"] {
            width: 43px;
        }
        input[type="button"], input[type="text"], input[type="password"], input[type="tel"], input[type="image"], textarea {
                -webkit-appearance: none;
            }
        input, textarea, select {
            max-width: 100%;
            font-size: 13px;
            font-family: 'Nanum Gothic',Helvetica,Arial,sans-serif;
            color: #333;
            vertical-align: middle;
            outline: 0;
            border-radius: 0;
        }
        

        /*취소교환반품규정 옆에 ! 아이콘 */
        p.ec-base-help, div.ec-base-help, ul.ec-base-help li, ol.ec-base-help li {
            padding: 0 0 2px 18px;
            line-height: 1.5;
            text-align: left;
            background: url(//img.echosting.cafe24.com/skin/mobile/common/ico_help.png) no-repeat 0 2px;
            background-size: 14px auto;
            margin: 14px ;
        }


        /*주문 리스트*/
        .myshop-orderhistorylistitem .order {
            position: relative;
            border-left: 1px solid #d5d5d5;
            border-right: 1px solid #d5d5d5;
            border-bottom: 1px solid #d5d5d5; /*추가*/
            background-color: #fff;
        }
        .myshop-orderhistorylistitem .order h3 {
            overflow: hidden;
            margin: 7px 0 0;
            padding: 14px;
            color: #fff;
            font-size: 13px;
            font-weight: normal;
            background-color: #555;
        }
        .number a{
            color:#fff;
        }

        
        .prdInfo {
            position: relative;
            margin: 0 0 7px;
            padding: 14px 14px 6px;
            border: 1px solid #d5d5d5;
            box-sizing: border-box;
            background: #fff;
        }
        
        .orderList .prdInfo {
            margin: -1px 0 0;
            border-width: 1px 0 0 0;
        }

        .prdInfo .prdBox {
            display: -webkit-flex;
            display: -ms-flex;
            display: flex;
            min-height: 115px;
            margin-top: 7px;
        }

        .prdInfo .thumbnail {
            overflow: hidden;
            width: 73px;
            margin-right: 15px;
            box-sizing: border-box;
        }
        .prdInfo .description {
            overflow: hidden;
            -webkit-flex: 1;
            -ms-flex: 1;
            flex: 1;
            overflow: hidden;
        }
        ul li {
            list-style: none;
        }
        strong {
            font-weight: 500;
        }
        .prdInfo .description .prdName {
            display: block;
            margin: 0 0 10px;
            font-size: 13px;
        }

        .prdInfo .description .prdName a {
            color: #4a5164;
        }
        
        .prdInfo .description .info {
            margin: 0 0 14px;
        }
        .prdInfo .description .info li {
            margin: 0 0 7px;
            font-size: 12px;
            color: #757575;
        }
        .prdInfo .description .info .price {
            font-size: 13px;
            color: #000;
        }
        .orderList .prdInfo .option {
            margin: 0;
        }
        .prdInfo p.option {
            margin: 0 14px;
            padding: 14px 0;
            border-top: 1px solid #ececec;
            font-size: 13px;
        }
        .prdInfo .option {
            padding: 0;
            color: #353535;
        }
        ul {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 0;
        }

        .orderList .prdInfo .prdFoot {
            margin: 0 -14px -6px;
        }
        .prdInfo .prdFoot {
            /* padding: 14px 0; */
            /* padding: 7px 14px 0; */
            padding: 6px 12px;
            font-weight: bold;
            line-height: 26px;
            color: #508bed;
            text-align: center;
            background: #f9f9f9;
        }
        

        .prdInfo .prdFoot .gLeft {
            float: left;
            text-align: left;
        }

        /* .prdInfo .prdFoot .store {
            color: #000;
            font-weight: normal;
        } */
        .prdInfo .prdFoot:after {
            content: '';
            display: block;
            clear: both;
        }
        .myshop-orderhistorylistitem .prdFoot + .request:before {
            content: '';
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            height: 1px;
            background: #d5d5d5;
        }

        .displaynone {
            display: none !important;
        }

        .prdInfo .prdFoot .gRight {
            float: right;
            text-align: right;
        }
        [class*="btn"].mini {
            height: 26px;
            line-height: 24px;
            font-size: 11px;
        }
        /*request 부분*/
        .myshop-orderhistorylistitem .prdFoot + .request {
            margin-top: 6px;
        }
        .myshop-orderhistorylistitem .request {
            position: relative;
            overflow: hidden;
            margin: 0 -14px -6px;
            padding: 7px 14px;
            border-bottom: 1px solid #d5d5d5;
            font-weight: bold;
            color: #508bed;
            background-color: #f9f9f9;
            text-align: center;
        }

        .myshop-orderhistorylistitem a.btnDetail {
            position: absolute;
            top: 16px;
            right: 4px;
            padding: 0 14px 0 0;
            font-size: 12px;
            color: #fff;
        }

        .btnNormal {
            color: #1b1b1b;
            border: 1px solid #cfcfcf;
            border-bottom-color: #b5b5b5;
            background: #fff;
        }
        
        img {
            vertical-align: middle;
        }
        
        .myshop-orderhistorylistitem {
            margin: 0 14px 0;
        }
        
        a {
            text-decoration: none;
            color: #000;
        }
        /* .myshop {
            margin: 0 14px 0;
        } */
        /*하단 페이지 넘기기 부분*/
        /* ol {
            list-style: none;
        }

        ol {
            list-style-position: inside;
        }
        /* 
        li {
        display: list-item;
        text-align: -webkit-match-parent;
       
         }
         */

        /* .paginate.typeList {
            padding: 14px 0;
            font-size: 0;
            line-height: 0;
        }
        .paginate {
            text-align: center;
        }
        .paginate.typeList [class*='btn'] {
            display: inline-block;
            overflow: hidden;
            width: 31px;
            height: 27px;
            border: 1px solid #d9d9d9;
            border-radius: 2px;
            font-size: 1px;
            line-height: 0;
            text-indent: -1500%;
            vertical-align: middle;
            background: #fff;
            background-repeat: no-repeat;
            background-position: 50% 50%;
            background-size: 7px auto;
        }

        
        .paginate.typeList ol, 
        .paginate.typeList ol li {
            display: inline-block;
            vertical-align: middle;
        }
        .paginate.typeList ol {
            margin: 0 14px;
        }
        .paginate.typeList ol li a {
            display: inline-block;
            width: 31px;
            height: 27px;
            border: 1px solid #d9d9d9;
            border-radius: 2px;
            font-size: 15px;
            line-height: 27px;
            color: #1b1b1b;
            vertical-align: middle;
            background: #fff;
        }
         */ */

        /* img,
        fieldset {
            border: none;
        } */

       
        
        body, code {
            min-width: 320px;
            /* font-family: 'Noto Sans KR',sans-serif; */
            font-size: 13px;
            line-height: 1.8;
            color: #666;
            -webkit-text-size-adjust: none;
            background: #fff;
        }

        #row div {
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
        .mypagination{
            text-align: center;
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            /* padding-inline-start: 40px; */
        }
        .mypagination li {
            list-style: none;
            display: inline-block;
        }

</style>

    <div id="contents">

        <div id="titleArea">
            <h2>주문조회</h2>
            <!-- <span class="xans-element- xans-layout xans-layout-mobileaction "><a href="#none"
                    onclick="history.go(-1);return false;"><img
                        src="//img.echosting.cafe24.com/skin/mobile_ko_KR/layout/btn_back.gif" width="33"
                        alt="뒤로가기"></a>
            </span> -->
        </div>

        <div style="margin:14px;" class="xans-element- myshop myshop-orderhistorytab ec-base-tab gBlank7 ">
            <ul>
                <li class="tab_class selected"><a href="/myshop/order/list.html"><span>주문내역<span class="number">
                    (<span id="xans_myshop_total_orders">$</span>건)</span></span></a></li>
                <li class="tab_class_cs"><a href="/myshop/order/list.html?mode=cs"><span>취소/교환/반품<span class="number">
                                (<span id="xans_myshop_total_orders_cs">0</span>건)</span></span></a></li>
            </ul>
        </div>

        <form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
            <div class="xans-element- myshop myshop-orderhistoryhead ">
                <fieldset>
                    <legend>검색기간설정</legend>
                    <div class="stateSelect ">
                        <span class="state">상태</span>
                        <select id="order_status" name="order_status" class="fSelect">
                            <option value="all">전체 주문처리상태</option>
                            <option value="shipped_before">입금전</option>
                            <option value="shipped_standby">배송준비중</option>
                            <option value="shipped_begin">배송중</option>
                            <option value="shipped_complate">배송완료</option>
                            <option value="order_cancel">취소</option>
                            <option value="order_exchange">교환</option>
                            <option value="order_return">반품</option>
                        </select>
                    </div>

                    <span class="term">기간</span>
                    <div class="ec-base-button gColumn">
                        <a href="#none" class="btnNormal" days="00">오늘</a>
                        <a href="#none" class="btnNormal" days="30">1개월</a>
                        <a href="#none" class="btnNormal selected" days="90">3개월</a>
                        <a href="#none" class="btnNormal" days="180">6개월</a>
                        <a href="#none" class="btnBasic eDataSet">기간설정</a>
                    </div>

                    <div id="dataSearch">
                        <input id="history_start_date" name="history_start_date" class="fText hasDatepicker"
                            readonly="readonly" size="10" value="2021-04-11" type="text"><button type="button"
                            class="ui-datepicker-trigger"><img
                                src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal_mobile.png" alt="..."
                                title="..." style="width:20px"></button> ~ <input id="history_end_date"
                            name="history_end_date" class="fText hasDatepicker" readonly="readonly" size="10"
                            value="2021-07-10" type="text"><button type="button" class="ui-datepicker-trigger"><img
                                src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal_mobile.png" alt="..."
                                title="..." style="width:20px"></button> <input alt="조회" id="order_search_btn"
                            type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search_mobile.png">
                    </div>
                </fieldset>

                <p class="ec-base-help ">취소교환반품 규정 : ex.취소/교환/반품 신청은 주문완료일 기준 7일까지 가능합니다.</p>
            </div>

            <!-- <input id="mode" name="mode" value="" type="hidden"> 
            <input id="term" name="term" value="" type="hidden"> -->
        </form>


        <div class="xans-element- myshop myshop-orderhistorylistitem">
            <!--
                $login_url = /member/login.html
            -->
            <div class="orderList ">
                <!-- 주문 반복 -->
                <div class="order record">
                    <h3 class="">
                        <span class="date" title="주문일자">2021-00-00</span>
                        <span class="number" title="주문번호"><a href="주문상세링크">(주문번호)</a></span>
                    </h3>
                    <div class="prdInfo">
                        <div class="prdBox">
                            <div class="thumbnail"><a href="상품상세링크">
                                <img src="상품사진"
                                    onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';" width="71"
                                    alt=""></a>
                            </div>
                            <div class="description">
                                <strong class="prdName" title="상품명">
                                    <a href="상품상세링크" class="ec-product-name">상품명</a>
                                </strong>
                                <ul class="info">
                                    <li>
                                        <span class="price" title="판매가"><strong>$</strong>원<span class="refer displaynone"></span></span>
                                        <span class="qty" title="수량"><strong>$</strong>개</span>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <p class="option ">[옵션: 옵션명]</p>
                        


                        <div class="prdFoot" title="주문처리상태">
                            <div class="gLeft">
                                배송완료<span class="store"></span>
                                <span class="addition displaynone"><strong class="cancel"><a href="주문상세링크"
                                            target="_blank">[상세정보]</a></strong></span>
                            </div>
                            <div class="gRight">
                                <span class=""><a href="#none" class="line btnNormal mini"
                                        onclick="window.open('/common/delivery_trace.php?is12RFront=T&amp;order_id=20210707-0001841&amp;invoice_no=551582748403&amp;product_no=146&amp;opt_id=000A&amp;is_second_delivery=F', '', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">배송조회</a></span>
                                <a href="후기쓰기로 이동"
                                    class="btnNormal mini ">구매후기</a>
                                <a href="#none" class="btnNormal mini displaynone"
                                    onclick="OrderHistory.withdraw('C','20210707-0001841|146|000A|44434','F', 'F', 'F')">취소철회</a>
                                <a href="#none" class="btnNormal mini displaynone"
                                    onclick="OrderHistory.withdraw('E','20210707-0001841|146|000A|44434','F', 'F', 'F')">교환철회</a>
                                <a href="#none" class="btnNormal mini displaynone"
                                    onclick="OrderHistory.withdraw('R','20210707-0001841|146|000A|44434','F', 'F', 'F')">반품철회</a>
                            </div>
                        </div>
                        <!-- <div class="request ">
                            <a href="#none" class="displaynone btnBasic"
                                onclick="OrderHistory.orderCancel('20210707-0001841')">주문취소</a>
                            <a href="cancel.html?order_id=20210707-0001841" class="displaynone btnNormal">취소신청</a>
                            <a href="exchange.html?order_id=20210707-0001841" class="displaynone btnNormal">교환신청</a>
                            <a href="return.html?order_id=20210707-0001841" class="displaynone btnNormal">반품신청</a>
                        </div> -->
                    </div>
                    
                    <a href="detail.html?order_id=20210707-0001841&amp;page=1&amp;history_start_date=2021-04-14&amp;history_end_date=2021-07-13"
                        class="btnDetail ">[ 상세보기 ]</a>
                </div>
                <!-- //주문 반복 -->


            </div>

            <p class="empty displaynone">주문 내역이 없습니다.</p>
        </div>
        <p>
            
        </p>
        <div class="row" id="row">
            <div class="col-md-12">
                <ul class="mypagination justify-content-center">
                    <li class="product-item"><a href="#" class="mypage-link"> << </a></li>
                    <li class="product-item"><a href="#" class="mypage-link activecolor">1</a></li>
                    <li class="product-item"><a href="#" class="mypage-link">2</a></li>
                    <li class="product-item"><a href="#" class="mypage-link">3</a></li>
                    <li class="product-item"><a href="#" class="mypage-link"> >> </a></li>
                </ul>
            </div>
        </div>
    
    </div>


<%@include file="../design/footer.jsp" %>