

/*
 *  댓글 스크립트 - 자바스크립트 모듈(관련있는 함수들의 모임) 구성
 */

var replyService=(function(){
	
	//private
	function add(reply,callback){
		console.log("add method 호출");
		
		$.ajax({
			type:'post',
			url:'/replies/new',
			contentType:'application/json;charset=utf-8',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:JSON.stringify(reply),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
			
		})
		
	}//add종료
	

	function getList(param,callback){
		
		console.log("값이 있니?"+param);
		console.log("값이 있니?"+param.sort);
		console.log("값이 있니?"+param.page);
		console.log("값이 있니?"+param.keyword);
		console.log("값이 있니?"+param.test);
		
		var psort = param.sort;
		var ppage = param.page;
		var pkeyword = param.keyword;
		var ptest = param.test;
		
		if(param.sort == "" || param.sort == null){
			psort = "-";
		}
				
		if(param.keyword == "" || param.keyword == null){
			pkeyword = "-";
		}
				
		console.log("값이 있니?p"+pkeyword);
		console.log("값이 있니?p"+psort);
		
		$.getJSON({
			url:'/board/lists/'+psort+'/'+ppage+'/'+pkeyword+'/'+ptest,
			success:function(data){
				if(callback){
					callback(data.totalCnt,data.list);
				}
			}
		})
	}//getlist종료
	
	
	function remove(rno,replyer,callback){
		
		$.ajax({
			url:'/replies/'+rno,
			type:'delete',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify({
				replyer:replyer
			}),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
		
		
	}//remove 종료
	
	
	function update(reply, callback){
		
		$.ajax({
			url:'/replies/'+reply.rno,
			type:'put',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:JSON.stringify(reply),
			contentType:'application/json;charset=utf-8',
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	}
	
	function get(rno,callback){
		
		$.getJSON({
			url:'/replies/'+rno,
			success:function(data){
				if(callback){
					callback(data);
				}
			}
		})
		
	}
	
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);

		var str = "";
		if(gap < (1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			str += [(hh > 9 ? '' : '0')+hh, ':', (mi > 9 ? '' : '0')+mi, ':',(ss > 9 ? '' : '0')+ss].join('');
			
			return str;
			
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			str += [yy,'/',(mm > 9 ? '' : '0')+mm,'/',(dd > 9 ? '' : '0')+dd].join('');
			
			return str;
		}
	}
	
	
	
	//public
	return {
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
	}
	
	
	
})();



