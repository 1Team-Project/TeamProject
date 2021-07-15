/**
 * pdetail.jsp에서 사용할 스크립트
 */

/*function showImage(fileCallPath){
   $(".bigPictureWrapper").css("display","flex").show();

   $(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
               .animate({width:'100%', height:'100%'},1000);
   }
   
$(function(){
   
   //첨부파일 가져오기
   $.getJSON({
      url:'getAttachList',
      data:{
         bno:bno
      },
      success:function(data){
         console.log(data);
         
         var str="";
         $(data).each(function(i,obj){
            if(obj.fileType){//image
                 var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
            
                 str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
                 str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
                 str+="<img src='/display?fileName="+fileCallPath+"'>";
                 str+="</li>";
            }else{
               str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
               str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
               str+="<span>"+obj.fileName+"</span><br>"
               str+="<img src='/resources/img/attach.png'>";
               str+="</li>";
            }
         })
         $(".uploadResult ul").html(str);
         
      }
   })//getJSON 종료
   */

$(function() {
	$('.btn btn-primary btn-lg').click(function() {
		$(location).attr('href','cart');

	});

});
