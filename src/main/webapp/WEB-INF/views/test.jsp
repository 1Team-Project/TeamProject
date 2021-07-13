<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>

  <style>
    .boldergreen {
      border: 4px solid #78c2ad;
      border-radius: 15px;
    }
    .textcenter {
      text-align: center;
    }
    .width10 {
      width: 10%;
    }
    .width20 {
      width: 20%;
    }
    .width30 {
      width: 30%;
    }
    .width40 {
      width: 40%;
    }
    .topmargin10 {
      margin-top: 10px;
    }
    .topmargin30 {
      margin-top: 30px;
    }
    .colorthema {
      background-color: #78c2ad;
      color: white;
    }
    .margintb20 {
      margin-top: 20px;
      margin-bottom: 20px;
    }
    .badgecount {
      display: inline-block;
      font-size: 0.8em;
      line-height: 0;
      font-weight: 500;
      color: rgb(94, 94, 94);
      text-align: center;
      white-space: nowrap;
      vertical-align: baseline;
      margin-left: 7px;
    }
    .blacktext {
      text-decoration: none;
      color: rgb(136, 136, 136);
    }
    .hoverthema:hover {
      color: #78c2ad;
    }
    .hh4 {
      font-size: 1.5rem;
    }
    .padding5px {
      padding: 5px;
    }
    .padding6px {
      padding: 6px;
    }
    .paginate_button {
      padding: 100px;
      border: 1px solid red;
    }
    .mypagination {
      display: -ms-flexbox;
      display: flex;
      padding-left: 0;
      list-style: none;
    }
    .mypage-link {
      padding: 0.375rem 0.75rem;
      position: relative;
      display: block;
      color: rgb(68, 68, 68);
      text-decoration: none;
      background-color: #ffffff;
      border: 1px solid #78c2ad;
      margin: 2px;
    }
    .activecolor {
      background-color: #78c2ad;
      color: white;
    }
    .mypagination .mypage-item:first-child .mypage-link {
      border-top-left-radius: 0.6rem;
      border-bottom-left-radius: 0.6rem;
    }
    .mypagination .mypage-item:last-child .mypage-link {
      border-top-right-radius: 0.6rem;
      border-bottom-right-radius: 0.6rem;
    }
    .mypage-link:hover {
      z-index: 2;
      color: #fff;
      background-color: #78c2ad;
      border-color: #78c2ad;
    }
    .inlinetest {
      display: inline-block;
    }
    .ml20{
    	margin-left: 7%;
    }
  </style>

    <div class="container-fluid">
      <div class="row topmargin30">
        <div class="col-md-12"></div>
        <h3 class="heading-section ml20" style="font-family: naBrush;">통합 게시판</h3>
      </div>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <div class="col-md-12 colorthema hh4 padding6px margintb20">
            오늘의 화제글
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="row textcenter">
                <div class="col-md-4">
                  <div class="card">
                    <img class="card-img-top" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg"
                    />
                    <div class="card-block">
                      <h5 class="card-title topmargin10">후기입니다</h5>
                      <p class="card-text">안녕하세요 후기입니다...</p>
                      <p>
                        <a class="btn btn-primary" href="#">자세히 보기</a>
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="card">
                    <img
                      class="card-img-top"
                      src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg"
                    />
                    <div class="card-block">
                      <h5 class="card-title topmargin10">리뷰입니다</h5>
                      <p class="card-text">이것은 리뷰입니다 리뷰...</p>
                      <p>
                        <a class="btn btn-primary" href="#">자세히 보기</a>
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="card">
                    <img
                      class="card-img-top"
                      src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg"
                    />
                    <div class="card-block">
                      <h5 class="card-title topmargin10">질문입니다</h5>
                      <p class="card-text">이것은 질문입니다...</p>
                      <p>
                        <a class="btn btn-primary" href="#">자세히 보기</a>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-10"></div>
            <div class="col-md-2 margintb20"></div>
          </div>
          <table class="table">
            <thead>
              <tr class="textcenter colorthema">
                <th class="width10">번호</th>
                <th class="width10">분류</th>
                <th class="width40">제목</th>
                <th class="width10">글쓴이</th>
                <th class="width20">작성일</th>
                <th class="width10">조회수</th>
              </tr>
            </thead>
            <tbody class="textcenter">
              <tr>
                <td>5</td>
                <td>후기</td>
                <td>
                  <a href="#" class="blacktext hoverthema"
                    >안녕하세요 후기입니다<strong class="badgecount"
                      >[1]</strong
                    ></a
                  >
                </td>
                <td>홍길동</td>
                <td>2021/07/07</td>
                <td>0</td>
              </tr>
              <tr>
                <td>4</td>
                <td>후기</td>
                <td>
                  <a href="#" class="blacktext hoverthema"
                    >안녕하세요 후기입니다<strong class="badgecount"
                      >[1]</strong
                    ></a
                  >
                </td>
                <td>홍길동</td>
                <td>2021/07/07</td>
                <td>0</td>
              </tr>
              <tr>
                <td>3</td>
                <td>질문</td>
                <td>
                  <a href="#" class="blacktext hoverthema"
                    >안녕하세요 질문입니다<strong class="badgecount"
                      >[1]</strong
                    ></a
                  >
                </td>
                <td>홍길동</td>
                <td>2021/07/07</td>
                <td>0</td>
              </tr>
              <tr>
                <td>2</td>
                <td>후기</td>
                <td>
                  <a href="#" class="blacktext hoverthema"
                    >안녕하세요 후기입니다<strong class="badgecount"
                      >[1]</strong
                    ></a
                  >
                </td>
                <td>홍길동</td>
                <td>2021/07/07</td>
                <td>0</td>
              </tr>
              <tr>
                <td>1</td>
                <td>질문</td>
                <td>
                  <a href="#" class="blacktext hoverthema"
                    >안녕하세요 질문입니다<strong class="badgecount"
                      >[1]</strong
                    ></a
                  >
                </td>
                <td>홍길동</td>
                <td>2021/07/07</td>
                <td>0</td>
              </tr>
            </tbody>
          </table>
          <div class="row">
            <div class="col-md-12 mb-3">
              <select
                name=""
                id=""
                class="form-control width10 inlinetest boldergreen"
              >
                <option value="">분류</option>
                <option value="후기">후기</option>
                <option value="질문">질문</option>
              </select>
              <input
                type="text"
                class="width30 boldergreen padding5px blacktext"
              />
              <button class="btn btn-primary">검색</button>
              <button class="btn btn-primary float-end">글 쓰기</button>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <ul class="mypagination justify-content-center">
                <li class="mypage-item">
                  <a href="#" class="mypage-link"> << </a>
                </li>
                <li class="mypage-item">
                  <a href="#" class="mypage-link activecolor">1</a>
                </li>
                <li class="mypage-item">
                  <a href="#" class="mypage-link">2</a>
                </li>
                <li class="mypage-item">
                  <a href="#" class="mypage-link">3</a>
                </li>`
                <li class="mypage-item">
                  <a href="#" class="mypage-link"> >> </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-md-1"></div>
      </div>
    </div>

<%@include file="../design/footer.jsp" %>
