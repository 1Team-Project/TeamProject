var total_amount = 0;
$(".total").each(function(idx,item){
         total_amount += Number($(this).val());
         $("span.num").html(total_amount);
      });

function plus_minus(obj,op){
   var num = $(obj).val();
   
   var amount=0;
   var sum=0;
   var total_amount = 0;
   
   if(op=='plus'){   
      amount = Number(num) + 1;      
   }else{
      amount = Number(num) -1 ;
   }
   
   sum= amount * $(obj).closest("div").prev().find("input[name='price']").val();
   var in_price = $(obj).closest("div").prev().find("input[class='total']");
   
   if (amount >= 100 || amount <=0) {
      $(obj).val(num);
   } else {
      $(obj).val(amount);
      $(in_price).val(sum);
      $(".total").each(function(idx,item){
         total_amount += Number($(this).val());
         $("span.num").html(total_amount);
      });
   }
}



$("input:checkbox[id='checkall']").prop("checked",true);

$("#checkall").click(function(){
   
   if ($("input:checkbox[id='checkall']").prop("checked")){
      $("input[type=checkbox]").prop("checked",true);
   } else{
      $("input[type=checkbox]").prop("checked",false);
   }


        $(".subu").click(function(e){
        e.preventDefault();
        
        console.log($(".checkone:checked").length);
        
        var check_count_is_not_null = $(".checkone:checked").length;
        
        if(check_count_is_not_null == 0){
           Swal.fire({
                title: '<strong>체크된 상품이 없습니다</strong>',
                icon: 'info',
                html:
                  '구매 전, 구매하실 상품을 선택해 주세요',
                focusConfirm: false,
                confirmButtonColor: '#78c2ad',
                confirmButtonText:
                  '확인'
              })
        }else{
           $("#gogokakao").submit();
        }
     })




});