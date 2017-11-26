<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.Timestamp"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Let it go</title>
<meta name="description"
	content="Cardio is a free one page template made exclusively for Codrops by Luka Cvetinovic" />
<meta name="keywords"
	content="html template, css, free, one page, gym, fitness, web design" />
<meta name="author" content="Luka Cvetinovic for Codrops" />
<!-- Favicons (created with http://realfavicongenerator.net/)-->
<link rel="apple-touch-icon" sizes="57x57"
	href="<c:url value='/img/favicons/apple-touch-icon-57x57.png' />">
<link rel="apple-touch-icon" sizes="60x60"
	href="<c:url value='/img/favicons/apple-touch-icon-60x60.png' />">
<link rel="icon" type="image/png"
	href="<c:url value='/img/favicons/favicon-32x32.png" sizes="32x32' />">
<link rel="icon" type="image/png"
	href="<c:url value='/img/favicons/favicon-16x16.png" sizes="16x16' />">
<link rel="manifest" href="<c:url value='/img/favicons/manifest.json'/>">
<link rel="shortcut icon"
	href="<c:url value='/img/favicons/favicon.ico'/>">
<meta name="msapplication-TileColor" content="#00a8ff">
<meta name="msapplication-config"
	content="<c:url value='/img/favicons/browserconfig.xml'/>">
<meta name="theme-color" content="#ffffff">
<!-- Normalize -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/normalize.css' />">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Owl -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/owl.css'/>">
<!-- Animate.css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/animate.css'/> ">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/fonts/font-awesome-4.1.0/css/font-awesome.min.css' />">
<!-- Elegant Icons -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/fonts/eleganticons/et-icons.css'/>">
<!-- Main style -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/main.css' /> ">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/area.css' /> ">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage.css'/>">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ScheduleSharing.css'/>">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/login.css' /> ">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/selectbox.css'/>">
<script src="<c:url value='/js/jquery-1.11.1.min.js'/>"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWd9G69XzMvx7WbAqdcLk9_1nh1Cd7FMk"></script>
<link rel="stylesheet" href="<c:url value='/css/material.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/css/bootstrap-material-datetimepicker.css'/>" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/js/material.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/moment-with-locales.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/bootstrap-material-datetimepicker.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/ScheduleSharing.js'/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Login modal setting start-->
<meta name="google-signin-client_id" content="683494592836-vedqdj0lu7v2kopskqlb9larv9ceculg.apps.googleusercontent.com">

<style type="text/css">
.button{
	background: url(../img/nave.png) no-repeat;
	cursor:pointer;
	border: none;
	width:290px;
	height:60px;
}
.button:hover{
	background: url(../img/naver_login.png) no-repeat;
	cursor:pointer;
	border: none;
	width:290px;
	height:60px;
}
</style>

<!-- Login modal setting end -->

<style>
.modal-dialog.modal-fullsize {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.modal-content.modal-fullsize {
	width: 1100px;
	height: auto;
	min-height: 100%;
	border-radius: 0;
}

/* .modal-backdrop.fade.in {
    height: auto;
} */
</style>


<%
    String cp = request.getContextPath();// /springMvc
	request.setCharacterEncoding("UTF-8");
%>

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
	    }
	});
});

$(function(){
	
	$(document).on("change", "#area_m1", function() {
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
				}
			});
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
	    }
	});
}

function areaSearch() {
	
	
	/* ajax 검색부분 */
	
	
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
				
				var pageBlock = args.pageBlock;
				var startPage = args.startPage;
				var endPage = args.endPage;
				var pageCount = args.pageCount;
				
				var select_data = args.select_data;
				var area_m1 = args.area_m1;
				var area_m2 = args.area_m2;
				
				$("#allPage").attr("value",page);
				$("#pageNumDiv").empty();
				if(page > 0){
					if (startPage > pageBlock) {
						var sum = endPage - pageBlock;
						$("#pageNumDiv").append("<a onclick=\"pageSearch('1','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[<<]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[이전]</span></a>");
					}

					for(var i = startPage;i<=endPage;i++) {
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+i+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>["+i+"]</span></a>");
					}

					if (endPage < pageCount) {
						var sum = startPage + pageBlock ;
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[다음]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+page+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[>>]</span></a>");
					}
				}
				
				if (size == 1) {
					if(myItem.firstimage == null){
						myItem.firstimage = "/LIG/img/unknown.png";
					}
					if(myItem.addr1 == null){
						myItem.addr1 = " ";
					}
					if(myItem.addr2 == null){
						myItem.addr2 = " ";
					}
					$("#arearesultUl").append(
							"<div class='service'><div class='icon-holder Destination'><img src='"+myItem.firstimage+"' alt='' width='330px' height='200px'></div><a href=\"javascript:window.open('/LIG/destination/areaSearchContent.do?contentid="+myItem.contentid+"','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');\"><p class='heading Destination'>"+myItem.title
							+"</p><p class='destination'>"+myItem.addr1+" "+myItem.addr2+"</p></a></div><br>");
				} else if(size > 1){
					for (var i = 0; i < myItem.length; i++) {
						if(i%3 == 0 && i != 0){
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}else{
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}
					}
				}
				
				/* modal css set */
				var size = $(".modal-content").css("height");
				var size_value = size.replace("px","");
				var re_size = Number(size_value)+500;
				re_size += "px";

				$(".modal-backdrop.fade.in").css("height",re_size);
				
				//$(".modal-content").css("width","1500px");
			},
			error : function(e) {
			}
		});
}
function areaSearch_Modal() {
	
	
	/* ajax 검색부분 */
	
	
	var snum1=$("#content_m1").val();
	var snum2=$("#area_m1").val();
	var snum3=$("#area_m2").val();
	
	var url="<%=cp%>/area/ModalareaSearchPro.do";
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
				
				var pageBlock = args.pageBlock;
				var startPage = args.startPage;
				var endPage = args.endPage;
				var pageCount = args.pageCount;
				
				var select_data = args.select_data;
				var area_m1 = args.area_m1;
				var area_m2 = args.area_m2;
				
				$("#allPage").attr("value",page);
				$("#pageNumDiv").empty();
				if(page > 0){
					if (startPage > pageBlock) {
						var sum = endPage - pageBlock;
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('1','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[<<]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[이전]</span></a>");
					}

					for(var i = startPage;i<=endPage;i++) {
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+i+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>["+i+"]</span></a>");
					}

					if (endPage < pageCount) {
						var sum = startPage + pageBlock ;
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[다음]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+page+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[>>]</span></a>");
					}
				}
				
				if (size == 1) {
					if(myItem.firstimage == null){
						myItem.firstimage = "/LIG/img/unknown.png";
					}
					if(myItem.addr1 == null){
						myItem.addr1 = " ";
					}
					if(myItem.addr2 == null){
						myItem.addr2 = " ";
					}
					$("#arearesultUl").append(
							"<div class='service'><div class='icon-holder Destination'><img src='"+myItem.firstimage+"' alt='' width='330px' height='200px'></div><a href=\"javascript:window.open('/LIG/destination/areaSearchContent.do?contentid="+myItem.contentid+"','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');\"><p class='heading Destination'>"+myItem.title
							+"</p><p class='destination'>"+myItem.addr1+" "+myItem.addr2+"</p></a></div><br>");
				} else if(size > 1){
					for (var i = 0; i < myItem.length; i++) {
						if(i%4 == 0 && i != 0){
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}else{
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}
					}
				}
				
				/* modal css set */
				var size = $(".modal-content").css("height");
				var size_value = size.replace("px","");
				var re_size = Number(size_value)+500;
				re_size += "px";

				$(".modal-backdrop.fade.in").css("height",re_size);
				
				//$(".modal-content").css("width","1500px");
			},
			error : function(e) {
			}
		});
}
function pageSearch(paganum,m1,m2,m3) {
	var url="<%=cp%>/area/areaSearchPro.do";
	$("#arearesultUl").empty();
	
		$.ajax({
			type : "post",
			url : url,
			data : "select_data="+m1+"&area_m1="+m2+"&area_m2="+m3+"&pageNum="+paganum,
			dataType : "json",
			success : function(args) {
				/* var myItem = args.data.response.body.items.item;
				var size = args.data.response.body.totalCount; */
				
				var myItem = args.data.response.body.items.item;
				var size = args.data.response.body.totalCount;
				var pageNo = args.data.response.body.pageNo;
				var page = args.allPage;
				
				var pageBlock = args.pageBlock;
				var startPage = args.startPage;
				var endPage = args.endPage;
				var pageCount = args.pageCount;
				
				var select_data = args.select_data;
				var area_m1 = args.area_m1;
				var area_m2 = args.area_m2;
				
				$("#allPage").attr("value",page);
				$("#pageNumDiv").empty();
				if(page > 0){
					if (startPage > pageBlock) {
						var sum = endPage - pageBlock;
						$("#pageNumDiv").append("<a onclick=\"pageSearch('1','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[<<]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[이전]</span></a>");
					}

					for(var i = startPage;i<=endPage;i++) {
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+i+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>["+i+"]</span></a>");
					}

					if (endPage < pageCount) {
						var sum = startPage + pageBlock ;
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[다음]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch('"+page+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[>>]</span></a>");
					}
				}
				
				if (size == 1) {
					if(myItem.firstimage == null){
						myItem.firstimage = "/LIG/img/unknown.png";
					}
					if(myItem.addr1 == null){
						myItem.addr1 = " ";
					}
					if(myItem.addr2 == null){
						myItem.addr2 = " ";
					}
					$("#arearesultUl").append(
							"<div class='service'><div class='icon-holder Destination'><img src='"+myItem.firstimage+"' alt='' width='330px' height='200px'></div><a href=\"javascript:window.open('/LIG/destination/areaSearchContent.do?contentid="+myItem.contentid+"','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');\"><p class='heading Destination'>"+myItem.title
							+"</p><p class='destination'>"+myItem.addr1+" "+myItem.addr2+"</p></a></div><br>");
				} else if(size > 1){
					for (var i = 0; i < myItem.length; i++) {
						if(i%3 == 0 && i != 0){
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}else{
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}
					}
				}
			},
			error : function(e) {
			}
		});
	
}

function pageSearch_Modal(paganum,m1,m2,m3) {
	var url="<%=cp%>/area/ModalPageAreaSearchPro.do";
	$("#arearesultUl").empty();
	
		$.ajax({
			type : "post",
			url : url,
			data : "select_data="+m1+"&area_m1="+m2+"&area_m2="+m3+"&pageNum="+paganum,
			dataType : "json",
			success : function(args) {
				/* var myItem = args.data.response.body.items.item;
				var size = args.data.response.body.totalCount; */
				
				var myItem = args.data.response.body.items.item;
				var size = args.data.response.body.totalCount;
				var pageNo = args.data.response.body.pageNo;
				var page = args.allPage;
				
				var pageBlock = args.pageBlock;
				var startPage = args.startPage;
				var endPage = args.endPage;
				var pageCount = args.pageCount;
				
				var select_data = args.select_data;
				var area_m1 = args.area_m1;
				var area_m2 = args.area_m2;
				
				$("#allPage").attr("value",page);
				$("#pageNumDiv").empty();
				if(page > 0){
					if (startPage > pageBlock) {
						var sum = endPage - pageBlock;
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('1','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[<<]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[이전]</span></a>");
					}

					for(var i = startPage;i<=endPage;i++) {
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+i+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>["+i+"]</span></a>");
					}

					if (endPage < pageCount) {
						var sum = startPage + pageBlock ;
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+sum+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[다음]</span></a>");
						$("#pageNumDiv").append("<a onclick=\"pageSearch_Modal('"+page+"','"+select_data+"','"+area_m1+"','"+area_m2+"')\" href=\"#\"><span class='ModalpageNumSize'>[>>]</sapn></a>");
					}
				}
				
				if (size == 1) {
					if(myItem.firstimage == null){
						myItem.firstimage = "/LIG/img/unknown.png";
					}
					if(myItem.addr1 == null){
						myItem.addr1 = " ";
					}
					if(myItem.addr2 == null){
						myItem.addr2 = " ";
					}
					$("#arearesultUl").append(
							
							"<div class='service'><div class='icon-holder'><img src='"+myItem.firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem.contentid+"','"+myItem.title+"','"+myItem.addr1+"','"+myItem.addr2+"','"+myItem.contenttypeid+"','"+myItem.areacode+"','"+myItem.sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem.title
							+"</p><p class='description'>"+myItem.addr1+" "+myItem.addr2+"</p></a></div>");
				} else if(size > 1){
					for (var i = 0; i < myItem.length; i++) {
						if(i%3 == 0 && i != 0){
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}else{
							if(myItem[i].firstimage == null){
								myItem[i].firstimage = "/LIG/img/unknown.png";
							}
							if(myItem[i].addr1 == null){
								myItem[i].addr1 = " ";
							}
							if(myItem[i].addr2 == null){
								myItem[i].addr2 = " ";
							}
							$("#arearesultUl").append(
									"<li class='arearesultLi'>"+
									"<div class='service'><div class='icon-holder'><img src='"+myItem[i].firstimage+"' alt='' width='211px' height='128px'></div><a onclick=\"switching_2('"+myItem[i].contentid+"','"+myItem[i].title+"','"+myItem[i].addr1+"','"+myItem[i].addr2+"','"+myItem[i].contenttypeid+"','"+myItem[i].areacode+"','"+myItem[i].sigungucode+"')\" data-dismiss=\"modal\"><p class='heading'>"+myItem[i].title
											+"</p><p class='description'>"+myItem[i].addr1+" "+myItem[i].addr2+"</p></a></div></li>");
							
						}
					}
				}
			},
			error : function(e) {
			}
		});
	
}

</script>
<script>
		function initialize(X_point,Y_point) {
			var zoomLevel		= 16;						//  지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

						//mark erTitle 현재 위치 마커에 마우스를 오버을때 나타나는 정보
			var markerMaxWidth	= 300;						// 마커를 클릭했을때 나타나는 말풍선의 최대 크기
			

			var myLatlng = new google.maps.LatLng(Y_point, X_point);
			var mapOptions = {
								zoom: zoomLevel,
								center: myLatlng,
								mapTypeId: google.maps.MapTypeId.ROADMAP
			}
			var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

			var marker = new google.maps.Marker({
													position: myLatlng,
													map: map
			});

			var infowindow = new google.maps.InfoWindow(
														{
															maxWidth: markerMaxWidth
														}
			);

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
			});
		}
</script>
<script>
$(function(){
	$(document).on("click", "#contentsButton", function() {
		var contentid=$("#contentid").val();
		var area=$("#contentsArea").val();
		var memberid="<%=session.getAttribute("memberid")%>";
		
		
		
		var url="<%=cp%>/contentarea/insert.do";
					$.ajax({
						type : "post",
						url : url,
						data : "contentid=" + contentid + "&" + "area=" + area
								+ "&" + "memberid=" + memberid,
						dataType : "json",
						success : function(args) {
							$("#contentList").empty();
							for (var i = 0; i < args.data.length; i++) {

								$("#contentList").append(
										"" + args.data[i].memberid + ""
												+ args.data[i].sdate + "<br>"
												+ args.data[i].contentval
												+ "<br>");

							}
							$("#contentsArea").val("");
						},
						error : function(e) {
						}
					});
				});

		/* 	$(document).on("click", "#close_button", function() {
		 var size = $(".modal-content").css("height");
		
		 var size_value = size.replace("px","");
		
		 if(size_value > 800){
		 $(".modal-content").css("top","100px");
		
		 }

		
		 }); */
	});

	function date_ok_button() {
		var sdate = $("#date-start").val();
		var edate = $("#date-end").val();

		var s = new Date(sdate);
		var e = new Date(edate);
		if (sdate == "") {
			if (edate != "") {
				alert("먼저 시작 날짜를 선택해주세요.");
				$("#date-end").val("");
			}
		} else {
			if (s > e) {
				alert("끝나는 날짜보다 시작날짜가 더 뒤에 오면 안됩니다.");
				$("#sdate_value").attr("value", sdate);
				$("#date-end").val("");
				$("#edate_value").attr("value", "");
				$("#plusDiv").empty();
				$("#plusCount").attr("value", "");
			} else {
				$("#sdate_value").attr("value", sdate);
				$("#edate_value").attr("value", edate);
				if (sdate != "" && edate != "") {
					// e - s = 현재 일차수
					var k = e - s;
					//alert(k/(24 * 3600 * 1000));
					var day_length = (k / (24 * 3600 * 1000)) + 1;
					$("#plusDiv").empty();
					$("#plusCount").attr("value", day_length);

					for (var count = 1; count <= day_length; count++) {
						$("#plusDiv")
								.append(
										"<div id ='plusDivSub' class='col-lg-4' name='plusDivSub'><table class=\"table table-hover test\"><thead><tr><th><span class=\"font-base\">"
												+ count
												+ "일차</span></th></tr></thead><tbody><input type='hidden' id='divCount' value='"+count+"'><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr><tr><td data-toggle=\"modal\" data-target=\"#myModal\">&nbsp;</td><input type='hidden' value='' name='Destination'><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''><input type='hidden' value=''></tr></tbody></table></div>");

					}
				}
			}

		}

	}
</script>
