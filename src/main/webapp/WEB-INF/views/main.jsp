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
			<h3 class="heading-section ml20" style="font-family: naBrush;">��ſ� ���� ���� Camp us</h3>
		</div>
		<div class="row">
		 	<div class="col-md-1"></div>
			  	<div class="col-md-10">
			  		<div class="row">
			  			<div class="main_left">
					    	<div class="col-md-12 colorthema hh4 padding6px margintb20"> ���� ��õ ��ǰ </div>
				    		<div class="row">
				    			<div class="">
					      			<div class="col-md-12">
					        			<div class="row_img">
					        				<div class="col-md-4">
					        					<div class="card">
						        					<img src="../../resources/main/images/tent1.jpg"/>
						        					<img src=""/>
						        					<img src=""/>
						        					<img src=""/>
						        					<img src=""/>
					            				</div>
					          				</div>
					        			</div>
									</div>
								</div>
				    		</div>
			    		</div>
			    		<div class="main_right">
							<div class="col-md-12 colorthema hh4 padding6px margintb20"> �Ƹ��ٿ� ķ�� ��� </div>
			      			<div class="col-md-12">
	        					<div class="row_opt">
	        						<ul id="slide_img">
	        						<!-- 
			        					<li><img src="../../resources/main/images/tent1.jpg"/></li>
			        					<li><img src="../../resources/main/images/tent2.jpg"/></li>
			        					<li><img src="../../resources/main/images/car1.jpg"/></li>
			        					<li><img src="../../resources/main/images/car2.jpg"/></li>
			        					<li><img src="../../resources/main/images/cabin1.jpg"/></li>
			        				 -->
			        				</ul>
              					</div>
            				</div>
          				</div>
					</div>
			    </div>
		    </div>
	    	<div class="row">
	    		<div class="col-md-1"></div>
	    		<div class="col-md-10">
			    	<!-- �Խ��� �߰��� ���� �κ� -->
					<p style="text-align: left;	margin-top: 20px;">
						<select class="selectBoxStyle">
							<option selected>-------</option>
							<option>��  ��</option>
							<option>��  ��</option>
							<option>��  ��</option>
						</select>
						<input type="text" class="searchBox" placeholder="�˻��� �Է�"/>
						<button type="button" class="btn btn-primary" style="font-size:15px; height: 35px;">�� ȸ</button>
		    		</p>
		    		<table class="table">
		    			<thead>
		    				<tr class="textcenter colorthema">
		    					<th class="width10">�ۼ���</th>
		    					<th class="width10">�з�</th>
		    					<th class="width10">����</th>
		    					<th class="width10">��ȸ��</th>
		    				</tr>
		    			</thead>
		    			<tbody class="textcenter">
		    				<c:forEach var="vo" items="${list}">
		    					<tr>
		    						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.b_sysdate}"/></td>
		    						<td>${vo.b_sort}</td>
		    						<td>
		    							<a href="${vo.b_no}" class="blacktext hoverthema clickview">${vo.b_title}</a>
		    						</td>
		    						<td>${vo.b_views}</td>
		    					</tr>
		    				</c:forEach>
		    			</tbody>
		    		</table>
					<!-- �Խ��� �߰��� �� �κ� -->
	    		</div>
				<div class="col-md-1"></div>
			</div>
	</div>

<%@include file="../design/footer.jsp" %>

	<%-- 		    				<c:forEach var="vo" items="${list}">
			    					<tr>
			    						<td>${vo.b_no}</td>
			    						<td>${vo.b_sort}</td>
			    						<td>
			    							<a href="${vo.b_no}" class="blacktext hoverthema clickview">${vo.b_title}
			    								<strong class="badgecount">[${vo.replycnt}]</strong>
			    							</a>
			    						<td>${vo.b_writer}</td>
			    						<td>
			    							<c:choose>
			    								<c:when test="${ststest eq bsys}">
			    									<fmt:formatDate pattern="HH:mm" value="${vo.b_sysdate}" timeZone="Asia/Seoul"/>
			    								</c:when>
			    								<c:otherwise>
			    									<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.b_sysdate}"/>
			    								</c:otherwise>
			    							</c:choose>
			    						</td>
			    						<td>${vo.b_views}</td>
			    					</tr>
			    				</c:forEach> --%>