<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
    String cp = request.getContextPath();// /springMvc
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="<c:url value='css/area.css' />" rel="stylesheet" />
<script>
$(function(){
	// 시도테이블의 리스트 가져오기

	var url="<%=cp%>/content/contentList.do";
	
	$.ajax({
		type:"post"		// 포스트방식
		,url:url		// url 주소
		,dataType:"json"
		,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 for(var idx=0; idx<args.data.length; idx++) {
				 $("#content_m1").append("<option value='"+args.data[idx].code+"'>"+args.data[idx].name+"</option>");
				 
				 //id가 sido인 요소선택
				 //append로 기존 셀렉터로 선택된 요소 다음에 다음내용이 들어감
				 //<option value='0'>서울</option> 이런식으로 sido의 요소안에 자식으로 들어감
   // args.data[idx] : args 는 function(args)의 인자. data는 controller.java에서 json객체에 넣어준 key(여기서는 list가 값이 된다). [idx]는 list의 몇번쨰 데이터를 가져올지 배열을 나타냄
			 }
		//$("#test").append("<span>"+args.dumi+"</span>");
		}
	    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
	    	alert(e.responseText);
	    }
	});
});
$(function(){
	// 시도테이블의 리스트 가져오기

	var url="<%=cp%>/area/areaList1.do";
	
	$.ajax({
		type:"post"		// 포스트방식
		,url:url		// url 주소
		,dataType:"json"
		,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 for(var idx=0; idx<args.data.length; idx++) {
				 $("#area_m1").append("<option value='"+args.data[idx].code+"'>"+args.data[idx].name+"</option>");
				 
				 //id가 sido인 요소선택
				 //append로 기존 셀렉터로 선택된 요소 다음에 다음내용이 들어감
				 //<option value='0'>서울</option> 이런식으로 sido의 요소안에 자식으로 들어감
   // args.data[idx] : args 는 function(args)의 인자. data는 controller.java에서 json객체에 넣어준 key(여기서는 list가 값이 된다). [idx]는 list의 몇번쨰 데이터를 가져올지 배열을 나타냄
			 }
		//$("#test").append("<span>"+args.dumi+"</span>");
		}
	    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
	    	alert(e.responseText);
	    }
	});
});
function test(){
	// 시도테이블의 리스트 가져오기

	var url="<%=cp%>/city/test.do";
	
	$.ajax({
		type:"post"		// 포스트방식
		,url:url		// url 주소
		,dataType:"json"
		,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
/* 			 for(var idx=0; idx<args.data.length; idx++) {
				 $("#sido").append("<option value='"+args.data[idx]+"'>"+args.data[idx]+"</option>");
				 //id가 sido인 요소선택
				 //append로 기존 셀렉터로 선택된 요소 다음에 다음내용이 들어감
				 //<option value='0'>서울</option> 이런식으로 sido의 요소안에 자식으로 들어감
   // args.data[idx] : args 는 function(args)의 인자. data는 controller.java에서 json객체에 넣어준 key(여기서는 list가 값이 된다). [idx]는 list의 몇번쨰 데이터를 가져올지 배열을 나타냄
			 } */
	    	var myItem = args.response.body.items.item;
	    	
	    	for(var i=0; myItem.length; i++){
	    		var output = '';
	    		console.log(myItem.length);
	    		output += '<h3>'+ i + '번 째 데이터' +'</h3>';
	    		output += '<h4>'+myItem[i].name+'</h4>';
	    		output += '<h4>'+myItem[i].rnum+'</h4>';
 		    	//document.body.innerHTML += output;
 		    	$("#test").append(output);
	    	}
			 
		}
	    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
	    	alert(e.responseText);
	    }
	});
}
function areaList() {
	var snum=$("#area_m1").val();
	// ID가 sido인 요소의 값을 불러옴
	if(snum=="") {	                // snum에 ""가 선택되어있다면
		$("#area_m2 option").each(function() {	//ID가 city이며 option인 요소를 
			$("#area_m2 option:eq(1)").remove();	//city option의 1번째를 계속 삭제(0번째만 남기고 모두 지우게 된다) ,  eq : 지정된 index 번째의 엘리먼트 선택
		});


		//$("#city").append("<option value=''>::도시선ㅋ::</option>");	// 위의 반복문으로 모두 삭제되어 있으므로 추가해준다.
		// 위의 명령문은 바로의 위의 엘리먼트가 1이아닌 0이었을 때 사용하면 됨.
		return;
	}
	
	var url="<%=cp%>/area/areaList2.do";

		$.ajax({
			type : "post",
			url : url,
			data : "select_data="+snum,
			dataType : "json",
			success : function(args) {
				$("#area_m2 option").each(function() { //id가 city인 option요소에 적용할 반복문
					$("#area_m2 option:eq(0)").remove(); // city option의 0번째 항목이 없을때까지 0번쨰 항목을 지운다. (기존에 있는거 모두 지운다.)
				});

				$("#area_m2").append("<option value=''>시/군/구 선택</option>"); // 도시선택을 붙인다.
				var myItem = args.response.body.items.item;
				var size = args.response.body.totalCount;
				if (size == 1) {
					$("#area_m2").append(
							"<option value='"+myItem.code+"'>" + myItem.name
									+ "</option>");
				} else if(size > 1){
					for (var i = 0; i < size; i++) { // 새로 가져온 데이터를 데이터 갯수만큼 반복해서 붙여준다.

						$("#area_m2").append(
								"<option value='"+myItem[i].code+"'>"
										+ myItem[i].name + "</option>");
						// append : 셀렉터로 선택된 (여기서는 id가 city인 ) 자식에게 계속 내용을 붙여준다. 기존 자식이 있다면 그 뒤에 붙여줌.

						//$("#city").append("<option value='"+args.data1[idx]['AREA2']+"'>"+args.data1[idx]['AREA2']+"</option>");
						//이런 형태도 가능
					}
				}
			},
			error : function(e) {
				alert(e.responseText);
			}
		});
}
function areaSearch() {
	
	var snum1=$("#content_m1").val();
	var snum2=$("#area_m1").val();
	var snum3=$("#area_m2").val();
	
	var url="<%=cp%>/area/areaSearchPro.do";
	$("#arearesultUl").empty();
	
		$.ajax({
			type : "post",
			url : url,
			data : "select_data="+snum1+"&area_m1="+snum2+"&area_m2="+snum3,
			dataType : "json",
			success : function(args) {

				/* var myItem = args.data.response.body.items.item;
				var size = args.data.response.body.totalCount; */
				
				var myItem = args.data.response.body.items.item;
				var size = args.data.response.body.totalCount;
				var pageNo = args.data.response.body.pageNo;
				var page = args.allPage;
				$("#allPage").attr("value",page);
				if (size == 1) {
					
					$("#arearesultUl").append(
							
							"<div class='service'><a href='areaSearchContent.do?contentid="+myItem.contentid+"&contenttypeid="+myItem.contenttypeid
									+"&areaCode="+myItem.areacode+"&sigunguCode="+myItem.sigungucode
									+"&cat1="+myItem.cat1+"&cat2="+myItem.cat2+"&cat3="+myItem.cat3
									+"&pageNo="+pageNo+"'><img src='"+myItem.firstimage+"' alt=''><p>"+myItem.title+"</p></a></div><br>");
				} else if(size > 1){
					for (var i = 0; i < myItem.length; i++) {
						if(i%5 == 0 && i != 0){
							$("#arearesultUl").append(
									"<li class='arearesultLi clear'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a href='area/areaSearchContent.do?contentid="+myItem[i].contentid+"&contenttypeid="+myItem[i].contenttypeid
											+"&areaCode="+myItem[i].areacode+"&sigunguCode="+myItem[i].sigungucode
											+"&cat1="+myItem[i].cat1+"&cat2="+myItem[i].cat2+"&cat3="+myItem[i].cat3
											+"&pageNo="+pageNo+"'><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}else{
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a href='areaSearchContent.do?contentid="+myItem[i].contentid+"&contenttypeid="+myItem[i].contenttypeid
											+"&areaCode="+myItem[i].areacode+"&sigunguCode="+myItem[i].sigungucode
											+"&cat1="+myItem[i].cat1+"&cat2="+myItem[i].cat2+"&cat3="+myItem[i].cat3
											+"&pageNo="+pageNo+"'><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}
					}
				}
			},
			error : function(e) {
				alert(e.responseText);
			}
		});
}
</script>

</head>
<body>
	<div>
		<select id="content_m1" name="content_m1">
			<!-- onchange로 선택이 될때마다 cityList()실행 -->
			<option value="">관광타입선택</option>
		</select>
	</div>
	<div>
		<select id="area_m1" name="area_m1" onchange='areaList();'>
			<!-- onchange로 선택이 될때마다 cityList()실행 -->
			<option value="">지역선택</option>
		</select> <select id="area_m2" name="area_m2">
			<!-- onchange로 선택이 될때마다 cityList()실행 -->
			<option value="">시/군/구 선택</option>
		</select>
	</div>
	<div>
		<button type="submit" onclick="areaSearch();">검색</button>
	</div>
	<div id="areaSearch">
		<ul class='arearesultUl' id='arearesultUl'></ul>
	</div>
	<input type='hidden' id="allPage" name="allPage">

	<!-- pageNumber area -->
	<c:if test="${allPage > 0}">
		<c:set var="pageCount"
			value="${allPage / pageSize + ( allPage % pageSize == 0 ? 0 : 1)}" />
		<c:set var="pageBlock" value="${5}" />
		<fmt:parseNumber var="result" value="${currentPage / pageBlock}"
			integerOnly="true" />
		<c:set var="startPage" value="${(result * pageBlock) + 1}" />
		<c:if test="${(currentPage % pageBlock) == 0 }">
			<c:set var="startPage" value="${startPage-pageBlock}" />
		</c:if>

		<c:set var="endPage" value="${startPage + pageBlock-1}" />
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}" />
		</c:if>

		<c:if test="${startPage > pageBlock}">
			<a
				href="/MVC_Board/board/list.do?pageNum=${startPage - pageBlock }">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a
				href="/MVC_Board/board/list.do?pageNum=${i}">[${i}]</a>
		</c:forEach>

		<c:if test="${endPage < pageCount}">
			<a
				href="/MVC_Board/board/list.do?pageNum=${startPage + pageBlock}">[다음]</a>
		</c:if>
	</c:if>
</body>
</html>
