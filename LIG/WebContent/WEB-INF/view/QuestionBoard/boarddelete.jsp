<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.text.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>삭제완료</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>
<script language="JavaScript">
	function Timer() {
		setTimeout("locateKap()", 3000);
	}
	 function locateKap() {
		location.href = "qboardlist.do";
	} 
</script>
<script language='javascript'>
	var cnt = 3; // 카운트다운 시간 초단위로 표시
	function countdown() {
		if (cnt == 0) {
			// 시간이 0일경우
			locateKap();
		} else {
			// 시간이 남았을 경우 카운트다운을 지속한다.
			document.all.choonDiv.innerHTML = "해당 게시물에 대한 삭제가 완료 되었습니다."+"<br/>"+"&nbsp;"+"&nbsp;"+ cnt + "초후 Q&A목록페이지로 이동됩니다.";
			setTimeout("countdown()", 1000);
			cnt--;
		}
	}
</script>
<c:import url="/WEB-INF/view/QuestionBoard/head.jsp"></c:import> 
</head>
<c:import url="/WEB-INF/view/QuestionBoard/header.jsp"></c:import> 
<body>
 <body onload="javascript:Timer()"> 
	<!-- body의 onload속성이용하여 페이지가 로드될때 window_onload()함수를 실행하겠다. -->
	<section class="section section-padded">
	<div id="choonDiv" style="position: relative; left: 700px; top: 0px; font-size:36px; font-family: 'Nanum Pen Script', serif;">
	<script>
		countdown();	
	</script>
	</div>
	<div id="choonDiv" style="position: relative; left: 750px; top: 30px;">
	<img src="/LIG/img/board/wait.jpg">
	
	<br/>
	<br/>
	<br/>
	<div style="position: relative; left:70px;">
	<input type="button" class="btn btn-primary" value="목록으로 바로가기" id="list"
			onclick="location.href='qboardlist.do'">
	</div>
	</div>
	</section>
	
	<c:import url="/WEB-INF/view/QuestionBoard/footer.jsp"></c:import>
	
	
	<c:import url="/WEB-INF/view/QuestionBoard/script.jsp"></c:import>
</body>
</html>