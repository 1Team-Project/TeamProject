/**
 * loginMypage.jsp 스크립트
 */

$(function(){
	
	//버튼 클릭시
	$(".btn-warning").click(function(){
		
		location.href='mypageModify';
	});
});

	//버튼 클릭시
	/*$("#modify").on("click",(function(){
		location.href="/mypageModify";
		})
		e.preventDefault(); //타이틀 속성 a 막기
		
		//mypageForm에 사용자값을 추가하여 mypageForm 보내기
		//mypageForm.append("<input type='hidden' name='u_userid' value='"+$(this).attr('href')+"'>");
		mypageForm.attr("action","mypageModify");
		mypageForm.submit();
	})
	
/**	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#modify").on('click',function(){
		location.href='mypageModify';
	});
});

</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#modify").on('click',function(){
		location.href='/mypageModify';
	});
});

</script>
           


}) 



*/