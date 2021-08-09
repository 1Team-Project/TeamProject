<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../design/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/main/css/cart2.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/main/css/campusBoard.css">
</head>
<body>
   <div class="cart_page">
      <h2 class="cart">장바구니</h2>
   </div>
   <div id="cartItemList" class="cartlist" style="min-height: 561px;">
      <div class="">
      <form action="/payment/paymentpage" method="post" id="gogokakao">
         <div class="c_item ">
            <div class="c_select">
               <div class="innerselect">
                  <label class="check"> <input type="checkbox" id="checkall"
                     checked="">전체선택
                  </label> 
                  <button type="button" class="btn_delete" id="delete">장바구니 삭제</button>
                  <script>
                  $("#delete").click(function () {
                      swal({
                         title: "장바구니를 삭제하시겠습니까?",
                         text: "",
                         icon: "info",
                         buttons: ["아니오", "네"]
                     }).then((네) => {
                         if (네) {               
                             var checkArr = new Array();
                            $("input[class='checkone']:checked").each(function (idx,item) {
                               //item.data("cartnum");
                               var cartNum=$(this).data("cartnum");
                               checkArr.push(cartNum);
                            });
//                            console.log(checkArr);                        
                            $.ajax({
                               url: "/delete",
                               type: "post",
                               data: {
                                  cartNum:checkArr,
                               },
                               beforeSend: function (xhr) {   
                                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                               },
                               success: function (data) {
                                  console.log(data);
                                  swal("장바구니 삭제 성공!", "구매하기를 눌러주세요", "success")
                                  .then((value) => {
                                     location.reload();
                                  });
                                  }
                               ,error: function(){
                                  swal("장바구니 삭제 실패!", "다시 확인해 주세요", "error");
                               }
                            });
                         }else{
                            confirm_val = false;
                         }
                     });
});

               </script>
               </div>
            </div>
<%--             <c:set var="sum" value="0" /> --%>
            <c:set var ="i" value="0"/>
            <c:forEach items="${cartlist}" var="CartListVO">
            <div class="box">
               <ul class="list">
                     <li>
                        <div class="item">
                           <label class="check" for=""> 
                          <input type="checkbox" class="checkone" name="cartVO[${i}].c_cartnumber" value="${CartListVO.c_cartnumber}" data-cartnum="${CartListVO.c_cartnumber}"> 
                           <c:set var = "i" value="${i+1}"/>
                           </label>
                           <div class="c_name">
                              <div class="innername">
                                 <a href="#" class="package ">${CartListVO.p_name}</a>
                                 <div class="info">${CartListVO.p_manufact}</div>
                              </div>
                           </div>
                           <div class="goods">
                              <a href="#" class="c_img "><img src="${CartListVO.urllink}"/></a>
                              <div class="price">
                                 <div class="in_price">
                                    <span class="selling">
                                     <input type="hidden" value="${CartListVO.p_price}" name="price">
                                     <input type="text" readonly value="${CartListVO.p_price * CartListVO.c_count}" class="total" style="border:none; width:50px; height:50px; text-align:center; font-weight : 700;">
                                    </span>
                                    <span class="unit">원</span>
                                 </div>
                                 <div class="stamper count">
                                    <button type="button" class="btn minus off" onclick = "plus_minus($(this).next(),'minus')">감소</button>
                                    <input type="number" id="stepperCounter" class="num" readonly="" value="${CartListVO.c_count}">
                                    <button type="button" class="btn plus" onclick="plus_minus($(this).prev(),'plus')">추가</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </li>
               </ul>
            </div>
         </c:forEach>
         </div>
         <div class="cart_result">
            <div class="innerresult" style="top: 60px;">
               <div class="amount_view">
                  <dl class="amount">
                     <dt class="tit">결제예정금액</dt>
                     <dd class="price">
                        <span class="num">
                           </span>
                           <span class="unit">원</span>
                     </dd>
                  </dl>
               </div>
                  <div class="btn_submit">
                  
                  <input type="hidden" name="u_userid" id="u_userid" value="<sec:authentication property="principal.campusUser.u_userid"/>">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  
                  <button type="submit" class="btn btn-primary subu">구매하기</button>
                  <button type="button" class="btn btn-secondary"
                     onclick="location.href='/product/productlist'">상품 목록보기</button>
               </div>
               <div class="notice">구매하는 물품이 맞는 지 꼭 확인해 주세요!</div>
            </div>
         </div>
      </form>
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script src="/resources/main/js/cart.js"></script>
   <script>
   var csrfHeaderName = "${_csrf.headerName}";
   var csrfTokenValue = "${_csrf.token}";
</script>
</body>
</html>
<%@include file="../design/footer.jsp"%>