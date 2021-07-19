<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp"%>

<link rel="stylesheet" href="/resources/main/css/campusBoard.css">

<section>
	<div class="row topmargin30">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<hr class="one" />
<<<<<<< HEAD
				<h3 class="heading-section" style="font-family: naBrush;">ÅëÇÕ
					°Ô½ÃÆÇ</h3>
=======
				<h3 class="heading-section hoverthema" style="font-family: naBrush;" onclick="location.href='list'">í†µí•©
					ê²Œì‹œíŒ</h3>
>>>>>>> refs/remotes/origin/hanjung
				<hr class="one" />
			</div>
			<div class="col-md-12">
				<h3 class="colorthema margintb20 padding6px">»õ ±Û ÀÛ¼º</h3>
			</div>
			<form action="write" method="post" role="form">
				<div class="col-md-8 mll20">
					<select name="b_sort" id="sort"
						class="form-control width15 inlinetest">
						<option value="">¼±ÅÃ</option>
						<option value="ÈÄ±â">ÈÄ±â</option>
						<option value="Áú¹®">Áú¹®</option>
					</select><input type="text"
						class="form-control width70 mll10 inlinetest"
						id="campusboard-title" required placeholder="Á¦¸ñÀ» ÀÔ·ÂÇØ ÁÖ¼¼¿ä" name="b_title"/>
				</div>

				<hr class="one" />
				<div class="col-md-8 mll20">
					<textarea class="form-control" cols="30" rows="15" id="campusboard-content" 
						style="resize: none" required placeholder="³»¿ëÀ» ÀÔ·ÂÇØ ÁÖ¼¼¿ä" name="b_content"></textarea>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
					<div class="blacktext">ÆÄÀÏ Ã·ºÎ (jpg/png, ÃÖ´ë 20MB, ÃÖ´ë 3Àå)</div>
					<div class="">
						<div class="form-group">
							<input type="file" name="campusFile" multiple
								class="form-control" />
						</div>
						<div class="uploadResult">
							<ul></ul>
						</div>
					</div>
				</div>
				<hr class="one" />
				<div class="col-md-8 mll20">
<<<<<<< HEAD
					<button class="btn btn-primary" type="submit">±Û ÀÛ¼º</button>
					<button class="btn btn-green1" type="reset">ÃÊ±âÈ­</button>
					<button class="btn btn-green2" type="reset">¸®½ºÆ®</button>
=======
					<button class="btn btn-primary" type="submit">ê¸€ ì‘ì„±</button>
					<button class="btn btn-green1" type="reset">ì´ˆê¸°í™”</button>
					<button class="btn btn-green2" type="button" onClick="location.href='/board/list'">ë¦¬ìŠ¤íŠ¸</button>
>>>>>>> refs/remotes/origin/hanjung
				</div>
		</form>
		</div>
	</div>
	<div class="col-md-1 margintb20"></div>
</section>
<script src="/resources/main/js/campuswrite.js"></script>
<%@include file="../../design/footer.jsp"%>