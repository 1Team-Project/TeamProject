<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

     
    </style>
<div id="container">
        <div id="contents">
            <div class="title">
                <h2>My Page</h2>
            </div>
            <div class="table-Area">
                <div id="mp" class="table">
                    <ul>
                        <button type="button" class="btn btn-info">구매내역</button>
                        <br>
              
                        <button type="button" class="btn btn-secondary">예약내역</button>
                        <br>
                        
                        <button type="button" class="btn btn-warning">회원정보수정</button>
                    
                    </ul>
                </div>
            </div>
        </div>
    </div>






<%@include file="../design/footer.jsp" %>