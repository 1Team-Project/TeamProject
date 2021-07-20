<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>

<style>
		*{
			list-style:none;
		}
        div{
            display: block;
        }
        #container{
            margin: 0 auto;
        }
        #contents{
            width: 70%;
            border: 0px solid;
            margin: 0px auto 0;
        }
        a{
        	text-decoration:none;
        	color:white;
        }
    
      .title{
          min-height:30px;
          margin:10px 0 20px;
          border-bottom: 0px solid #e8e8e8;
          text-align: center;
      }  
      .table-Area{
          display:table;
          width: 100%;
          table-layout: fixed;
          text-align: center;
          max-width: 500px;
          margin: 0 auto;
          font-size: 12px;
      }
      .table{
          margin: 30px 0 0;
      }
      .table li{
          line-height: 1;
          padding: 14px 14px;
      }
      ul {
        display: block;
        list-style-type: disc;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
    }
    #mp .mp{
        margin: 0 0 0px 0px;
        border:0px solid ;
        box-sizing: border-box;
    }
    hr{
    }

     
    </style> 

<form action="/loginMypage" id="" method="post">
<div id="container">
        <div id="contents">
            <div class="title">
            
                <h2>${login.u_userid}님 My Page</h2>
            </div>
            <div class="table-Area">
               
                <div id="mp" class="table">
                    <ul>
                        <button type="submit" class="btn btn-info" onclick="location.href='order'"><a href="/order">구매내역</a></button>
                       	<p></p>
                        <button type="submit" class="btn btn-secondary"><a href="/reservation">예약내역</a></button>
                        <p></p>
                        <button type="submit" id="modify" class="btn btn-warning"><a href="/mypageModify">회원정보수정</a></button>
                   	
                    </ul>
                </div>
               
                
            </div>
        </div>
    </div>
</form>

  
<!-- <form action="" id="mypageForm" method="post">
	<input type="hidden" name="u_userid"  value="${u_userid}"/>
	<input type="hidden" name="u_username"  value="${vo.u_username}"/>
	<input type="hidden" name="u_address"  value="${vo.u_address}"/>
	<input type="hidden" name="u_phone"  value="${vo.u_phone}"/>

</form> -->


<script src="/resources/main/js/loginMypage.js"></script>
<%@include file="../design/footer.jsp" %>