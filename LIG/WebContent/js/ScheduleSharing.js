$(function() {
	// 테이블의 Row 클릭시 값 가져오기
            $(document).on(
			"click",
			".table.table-hover.test > tbody > tr",
			function() {
               
                var divcount =  $(this).parent().children().eq(0).attr("value");
                $("#areaSelect").attr("value",divcount);
                 $("#areaSelectTr").attr("value",$(this).index());
				var str = ""
				var tdArr = new Array(); // 배열 선언

				// 현재 클릭된 Row(<tr>)
				var tr = $(this);
                var tr_index = $(this).index();
                
                
				var td = tr.children();
                var td_index = tr.children().index();
                
				//td.text("여행지이름");

			});
});


$(function(){
    // 테이블의 Row 클릭시 값 가져오기
    $(document).on("click",".a.btn-orange-fill.plusbutton",function(){    
        var count = $("#plusCount").attr("value");
        if(!count){
            count = 2;
            $("#plusCount").attr("value",count);
        }else{
            count++;
            $("#plusCount").attr("value",count);
        }
        
        $("#plusDiv").append("<div id ='plusDivSub' class='col-lg-4' name='plusDivSub'><table class=\"table table-hover test\"><thead><tr><th><span class=\"font-base\">"+count+"일차</span></th><div style=\"float:right;\"><button type ='button' class='a btn-orange-fill plusbutton'>&#43;</button>&nbsp;<button type ='button' class='a btn-orange-fill minusbutton'>&#45;</button></div></tr></thead><tbody><input type='hidden' id='divCount' value='"+count+"'><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr></tbody></table></div>");
        

    });
    $(document).on("click",".a.btn-orange-fill.minusbutton",function(){    
        var count = $("#plusCount").attr("value");
        if(count > 1){
            $("#plusDiv > div:last-child").remove();
//            var tr = $("#plusDiv > div:last-child > .table.table-hover.test > tbody > tr");
            var count = $("#plusCount").attr("value");
            $("#plusCount").attr("value", --count);
        }
    });
});

function switching(id,title){
    var indexval = $("#areaSelect").attr("value");
    var data = document.getElementsByName("plusDivSub");
    var indexval_tr = $("#areaSelectTr").attr("value");
    //data.table.tbody.tr[Number(indexval_tr)];
    //alert($("#areaSelect").attr("value"));
    var divindex = Number(indexval);
    var select=$("#plusDivSub:nth-child("+divindex+") > table > tbody > tr:nth-child("+(Number(indexval_tr)+1)+")").children();
    //0부터 순서대로 여행지이름, 여행지id, 주소1, 주소2, 관광지 id, 지역 id, 시군구 id 들어가야됨
    //title, id, addr1, addr2, contenttypeid, areacode, sigungucode
    select.eq(0).text(title)
    select.eq(1).attr("value",id);
    
    
    var result = "";
    $("#allValues").attr("value","");
    for(var i=1;i<=data.length;i++){
//        $("#plusDivSub:eq("+i+")")
        for(var j=2;j <= 6;j++){//input 태그 때문에 index가 2부터 시작
            
            var selectdata=$("#plusDivSub:nth-child("+i+") > table > tbody > tr:nth-child("+j+")").children();
            if(selectdata.eq(1).attr("value")){//빈 문자열이 아닐 때
                if(!result){// 모두 담을 문자열이 빈 문자열이면
                    result+=i+","+selectdata.eq(1).attr("value");
                }else{
                    result+=","+i+","+selectdata.eq(1).attr("value");
                }
            }
            
            
        }
    }
    $("#allValues").attr("value",result);
    
}
function switching_2(id,title,addr1,addr2,contenttypeid, areacode, sigungucode){
    var indexval = $("#areaSelect").attr("value");
    var data = document.getElementsByName("plusDivSub");
    var indexval_tr = $("#areaSelectTr").attr("value");
    //data.table.tbody.tr[Number(indexval_tr)];
    //alert($("#areaSelect").attr("value"));
    var divindex = Number(indexval);
    var select=$("#plusDivSub:nth-child("+divindex+") > table > tbody > tr:nth-child("+(Number(indexval_tr)+1)+")").children();
    //0부터 순서대로 여행지이름, 여행지id, 주소1, 주소2, 관광지 id, 지역 id, 시군구 id 들어가야됨
    //title, id, addr1, addr2, contenttypeid, areacode, sigungucode
    title = title.replace(",", "");
    addr1 = addr1.replace(",", "");
    addr2 = addr2.replace(",", "");
    
    select.eq(0).text(title);
    select.eq(1).attr("value",id);
    select.eq(2).attr("value",addr1);
    select.eq(3).attr("value",addr2);
    select.eq(4).attr("value",contenttypeid);
    select.eq(5).attr("value",areacode);
    select.eq(6).attr("value",sigungucode);
    
    
    var result = "";
    $("#allValues").attr("value","");
    for(var i=1;i<=data.length;i++){
//        $("#plusDivSub:eq("+i+")")
        for(var j=2;j <= 6;j++){//input 태그 때문에 index가 2부터 시작
            
            var selectdata=$("#plusDivSub:nth-child("+i+") > table > tbody > tr:nth-child("+j+")").children();
            if(selectdata.eq(1).attr("value")){//빈 문자열이 아닐 때
                if(!result){// 모두 담을 문자열이 빈 문자열이면
                    result+=i+","+selectdata.eq(0).text()+","+selectdata.eq(1).attr("value")+","+selectdata.eq(2).attr("value")+","+selectdata.eq(3).attr("value")+","+selectdata.eq(4).attr("value")+","+selectdata.eq(5).attr("value")+","+selectdata.eq(6).attr("value");
                }else{
                    result+=","+i+","+selectdata.eq(0).text()+","+selectdata.eq(1).attr("value")+","+selectdata.eq(2).attr("value")+","+selectdata.eq(3).attr("value")+","+selectdata.eq(4).attr("value")+","+selectdata.eq(5).attr("value")+","+selectdata.eq(6).attr("value");
                }
            }
            
            
        }
    }
    $("#allValues").attr("value",result);
    
}
function addCheck(item){
	if(!item.subject.value){
		alert("제목을 입력해주세요.");
		return false;
	}
	if(!item.share_content.value){
		alert("내용을 입력해주세요.");
		return false;
	}
	if(!item.sdate_value.value){
		alert("시작 날짜를 선택해 주세요.");
		return false;
	}
	if(!item.edate_value.value){
		alert("끝나는 날짜를 선택해 주세요.");
		return false;
	}
	
	var data = document.getElementsByName("plusDivSub");
	for(var i=1;i<=data.length;i++){
		var count = 0;
      for(var j=2;j <= 6;j++){//input 태그 때문에 index가 2부터 시작
          var selectdata=$("#plusDivSub:nth-child("+i+") > table > tbody > tr:nth-child("+j+")").children();
          if(selectdata.eq(1).attr("value")){//빈 문자열이 아닐 때
        	  count++;
          }
      }
      if(count == 0){
    	  alert("여행일차 당 여행지를 한 개 이상 선택해주세요.");
    	  return false; //하나의 테이블이 데이터가 하나도 없으면 return false;
      }
  
  }
	
	
	
}
