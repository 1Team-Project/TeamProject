

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
   
   sum= amount * $("input[name='price']").val();
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
      /*#cartItemList > div > div.cart_result > div > div.amount_view > dl > dd > span.num*/      
   }
}



$("input:checkbox[id='checkall']").prop("checked",false);

$("#checkall").click(function(){
   
   if ($("input:checkbox[id='checkall']").prop("checked")){
      $("input[type=checkbox]").prop("checked",true);
   } else{
      $("input[type=checkbox]").prop("checked",false);
   }
});