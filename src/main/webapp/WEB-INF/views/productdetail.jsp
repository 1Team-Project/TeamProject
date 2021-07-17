<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp"%>
<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
<link href="/resources/main/css/common.css" rel="stylesheet"
	type="text/css" />

<div class="product_view">
	<div id="productview">
		<div class="innerview">
			<div class="product">
				<img class="photo" src="/resources/main/images/lamp.jpg"
					alt="��ǰ ��ǥ ����">
				<ul>
					<li class="small_img"><a
						href="/resources/main/images/lamp.jpg"> <img
							src="/resources/main/images/lamp.jpg" alt="������ �� ����1"></a></li>
					<li><a href="/resources/main/images/lamp5.png"> <img
							src="/resources/main/images/lamp5.png" alt="������ �� ����2"></a></li>
					<li><a href="/resources/main/images/lamp2.jpg"> <img
							src="/resources/main/images/lamp2.jpg" alt="������ �� ����3"></a></li>
					<li><a href="/resources/main/images/lamp3.jpg"><img
							src="/resources/main/images/lamp3.jpg" alt="������ �� ����4"></a></li>
				</ul>
			</div>
			<p class="p_name">
				<strong class="name">���� ������</strong> <span class="name_detail">���͸���
					�� ���� �ʴ� ���� ������</span>
			</p>
			<!--<p class="p_price">
                    <span class="position">
                        <span class=price>
                            15,000
                            <span class="unit">��</span>
                        </span>
                    </span>
                </p>-->
			<div class="p_info">
				<table>
					<colgroup>
						<!--���������� �ֱ�-->
						<col style="width: 173px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td class="price">15,000��</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/gift.png">&nbsp;��ǰ�ڵ�</th>
							<td>123456789</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/manufacture.png">&nbsp;������/���޻�</th>
							<td>SONY/ �ڰ� ���� ���</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/money-bag.png">&nbsp;���ż���</th>
							<td>
								<div class="option">
									<span class="opt">
										<button type="button" class="minus"></button> <input
										type="number" readonly="readonly" onfocus="this.blur()"
										class="inp">
										<button type="button" class="plus"></button>
									</span>
								</div>
							</td>
						</tr>
						<!--<tr>
                                <th>��밡������</th>
                                <td>0��</td>
                            </tr>
                        -->
						<tr>
							<th><img src="/resources/main/images/choices.png">&nbsp;�ɼǼ���</th>
							<td><select>
									<option>�⺻ (+0)</option>
									<option>1 (+0)</option>
									<option>2 (+0)</option>
									<option>3 (+0)</option>
							</select></td>
						<tr>
							<th><img src="/resources/main/images/shipped.png">&nbsp;��ۺ�</th>
							<td>������</td>
						</tr>
						<tr>
							<th><img src="/resources/main/images/payment-method.png">&nbsp;���
								�ȳ�</th>
							<td>�� ��ǰ�� ���� ��۸� �����մϴ�.</td>
						</tr>
					</tbody>
				</table>
				<div id="cartput">
					<div class="total">
						<div class="price">
							<strong class="tot">�� ��ǰ�ݾ� : </strong> <span class="sum">
								<span class="num">15,000</span> <span class="unit">��</span>
							</span>
						</div>
						<div class="option_btn">
							<button type="button" class="btn btn-primary btn-lg">��ٱ���</button>
							<button type="button"
								class="btn btn-secondary btn-lg">�����ϱ�</button>
						</div>
						<div class="p_detail_info">
							<div class="p_detail_bar">
								<ul class="menu">
									<li class="menu1">��ǰ ��</li>
									<li class="menu2">��ǰ ����</li>
									<li class="menu3">��ǰ ����</li>
									<li class="menu4">��ȯ/��ǰ</li>
								</ul>
							</div>
						</div>
						<div class="p_detail_img">
							<p class="main_img">
								<img src="/resources/main/images/lamp.jpg">
							</p>
							<div class="description">
								<div class="d_wrapper">
									<strong class="d_title"> <span>�ٽ� ���ƿ� ���� ������!!</span>
										<span class="d_subtitle">[���� �ð� ���� ����]</span>
									</strong>
									<p class="descript">Lorem ipsum dolor sit amet consectetur,
										adipisicing elit. Molestiae deserunt illo quaerat officia quia
										est consequatur dolores corrupti nihil at eligendi ipsam
										numquam quasi architecto praesentium, dolorum labore quas a.
										Sapiente tenetur molestiae commodi nobis earum nesciunt.
										Mollitia, autem molestiae nostrum aut explicabo asperiores
										aperiam omnis, iusto pariatur veritatis magni quibusdam minus
										nemo necessitatibus debitis iste accusamus repudiandae atque.
										Dolores! Pariatur possimus molestias, consequatur eius ullam
										soluta ut sint eum minima id labore voluptatem. Ducimus cum
										error, temporibus cumque voluptates nihil? Ipsum optio sed
										veritatis repellendus sunt aspernatur in explicabo. Facere,
										eligendi aliquam fuga nemo eos consequatur, provident rerum
										officia beatae inventore et porro minima aliquid. Placeat
										beatae facilis voluptatem illo voluptates saepe rem, optio,
										architecto facere tempore nihil aut! Incidunt, molestias
										quaerat. Assumenda architecto facere debitis, obcaecati quod
										distinctio. Dolor, doloremque. Necessitatibus vero voluptatem
										sit, dolorem fugiat molestiae accusantium cumque illum?
										Consequatur sit autem perferendis. Voluptate laboriosam quae
										quas!</p>
									<p class="descript_img1">
										<img src="/resources/main/images/lamp2.jpg">
									</p>
									<p class="descript_img2">
										<img src="/resources/main/images/lamp3.jpg">
									</p>
									<p class="descript_img3">
										<img src="/resources/main/images/tent.png">
									</p>
									<div class="when_use">
										<h1>
											<span class="campustip"> Camp Us's Tip!</span><br> <span
												class="tipkor"> ��ǰ Ȱ�� ��!</span>
										</h1>
										<div class="tip_info">
											<span class="tip_icon"> <img
												src="/resources/main/images/camp.png">
											</span> <span class="tip_icon"> <img
												src="/resources/main/images/moon.png">
											</span> <span class="tip_icon"> <img
												src="/resources/main/images/thumb.png">
											</span>
										</div>
										<div class="tip_detail">
											<span class="detail1">��Ʈ �ȿ� ������ �ɱ� ���� &nbsp;</span> <span
												class="detail2">��ο� �ǿܿ��� ��� ���� &nbsp;</span> <span
												class="detail3">���� ������� ��õ��!</span>
										</div>
										<div class="tip_detail2">
											<span class="">������ �ڿ� ���� �޷��־� �޾Ƶα� ����</span> <span class="">�߱���
												����</span> <span class="">���� �αⰡ ���� ��ǰ</span>
										</div>
										<div class="size_info">
											<h1 class="size">
												<span class="size_title">��ǰ ������</span> <span class="p_size"><img
													src="/resources/main/images/lamp5.png"></span> <span
													class="p_size"><img
													src="/resources/main/images/lamp5.png"></span>
											</h1>
										</div>
										<div class="p_reviewbar">
											<h1>
												<span class="rivew">Product's Review</span><br> <span
													class="star">�ش� ��ǰ�� ������ �˷��帳�ϴ�!</span>
											</h1>
											<div class="row">
												<div class="col-md-10"></div>
												<div class="col-md-2 margintb20"></div>
											</div>
											<table class="table">
												<thead>
													<tr class="textcenter colorthema">
														<th class="width10">��ȣ</th>
														<th class="width10">�з�</th>
														<th class="width40">����</th>
														<th class="width10">�۾���</th>
														<th class="width20">�ۼ���</th>
														<th class="width10">����</th>
													</tr>
												</thead>
												<tbody class="textcenter">
													<tr>
														<td>5</td>
														<td>�ı�</td>
														<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																�ı��Դϴ�<strong class="badgecount">[1]</strong>
														</a></td>
														<td>ȫ�浿</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>4</td>
														<td>�ı�</td>
														<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																�ı��Դϴ�<strong class="badgecount">[1]</strong>
														</a></td>
														<td>ȫ�浿</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>3</td>
														<td>����</td>
														<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																�����Դϴ�<strong class="badgecount">[1]</strong>
														</a></td>
														<td>ȫ�浿</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>2</td>
														<td>�ı�</td>
														<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																�ı��Դϴ�<strong class="badgecount">[1]</strong>
														</a></td>
														<td>ȫ�浿</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
													<tr>
														<td>1</td>
														<td>����</td>
														<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																�����Դϴ�<strong class="badgecount">[1]</strong>
														</a></td>
														<td>ȫ�浿</td>
														<td>2021/07/07</td>
														<td>0</td>
													</tr>
												</tbody>
											</table>
											<div class="row">
												<div class="col-md-12 mb-3">
													<button class="btn btn-primary float-end">�� ����</button>
													<button class="btn btn-primary float-end">��ü �ı� ����</button>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<ul class="mypagination justify-content-center">
														<li class="mypage-item"><a href="#"
															class="mypage-link"> << </a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link activecolor">1</a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link">2</a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link">3</a></li>
														<li class="mypage-item"><a href="#"
															class="mypage-link"> >> </a></li>
													</ul>
												</div>
											</div>
											<div class="col-md-1"></div>
											<div class="p_qna">
												<h1>
													<span class="qna_tit"> Q&A </span><br> <span
														class="qna_subtit"> ��ǰ ���Ǹ� �����ּ���!</span>
												</h1>
												<div class="row">
													<div class="col-md-10"></div>
													<div class="col-md-2 margintb20"></div>
												</div>
												<table class="table">
													<thead>
														<tr class="textcenter colorthema">
															<th class="width10">��ȣ</th>
															<th class="width10">�з�</th>
															<th class="width40">����</th>
															<th class="width10">�۾���</th>
															<th class="width20">�ۼ���</th>
															<th class="width10">��ȸ��</th>
														</tr>
													</thead>
													<tbody class="textcenter">
														<tr>
															<td>5</td>
															<td>�ı�</td>
															<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																	�ı��Դϴ�<strong class="badgecount">[1]</strong>
															</a></td>
															<td>ȫ�浿</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>4</td>
															<td>�ı�</td>
															<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																	�ı��Դϴ�<strong class="badgecount">[1]</strong>
															</a></td>
															<td>ȫ�浿</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>3</td>
															<td>����</td>
															<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																	�����Դϴ�<strong class="badgecount">[1]</strong>
															</a></td>
															<td>ȫ�浿</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>2</td>
															<td>�ı�</td>
															<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																	�ı��Դϴ�<strong class="badgecount">[1]</strong>
															</a></td>
															<td>ȫ�浿</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
														<tr>
															<td>1</td>
															<td>����</td>
															<td><a href="#" class="blacktext hoverthema">�ȳ��ϼ���
																	�����Դϴ�<strong class="badgecount">[1]</strong>
															</a></td>
															<td>ȫ�浿</td>
															<td>2021/07/07</td>
															<td>0</td>
														</tr>
													</tbody>
												</table>
												<div class="row">
													<div class="col-md-12 mb-3">
														<button class="btn btn-primary float-end">�� ����</button>
														<button class="btn btn-primary float-end">��ü �ı�
															����</button>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<ul class="mypagination justify-content-center">
															<li class="mypage-item"><a href="#"
																class="mypage-link"> << </a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link activecolor">1</a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link">2</a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link">3</a></li>
															<li class="mypage-item"><a href="#"
																class="mypage-link"> >> </a></li>
														</ul>
													</div>
												</div>
												<div class="change_info"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- <script type= text/javascript> -->
</script>
<script src="/resources/main/js/pdetail.js"></script>
<%@include file="../design/footer.jsp"%>