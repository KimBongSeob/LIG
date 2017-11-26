<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.text.*" %>
<%
	String id = null;
	String nickname = null;
	if (session.getAttribute("mem_id") != null) {
		id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
	}
	if (session.getAttribute("nickname") != null) {
		nickname = (String) session.getAttribute("nickname");// 로그인 정보 가져오기.
	}
	session.setMaxInactiveInterval((60 * 60) * 12);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/view/QuestionBoard/head.jsp"></c:import> 
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/LIG/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>


<script>
	$(function() {
		//전역변수선언
		var editor_object = [];

		
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "content",
			sSkinURI : "/LIG/smarteditor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$("#submitbutton").click(
				function() {
					//id가 smarteditor인 textarea에 에디터에서 대9입
					editor_object.getById["content"].exec(
							"UPDATE_CONTENTS_FIELD", []);

					// 이부분에 에디터 validation 검증
					
					
				})
	})
	
	function fn_openBoardList(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='QuestionBoard/qboardlist.do' />");
    comSubmit.submit();
	}
	function subjectCheck(){
		var s=document.frm.subject.value;
		
		if (s==""){
			alert("제목은 반드시 입력해야 합니다.");
			document.frm.subject.focus();
			
			return false;
		}
		else
			return true;
	}
	
		
	
</script>
 

</head>

<body>

	<c:import url="/WEB-INF/view/QuestionBoard/Login.jsp"></c:import>
	<c:choose>
		<c:when test="${sessionScope.mem_id != null}">
			<c:choose>
				<c:when test="${sessionScope.mem_id == 'admin'}">
					<c:import url="/WEB-INF/view/QuestionBoard/admin_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/view/QuestionBoard/login_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/view/QuestionBoard/header.jsp"></c:import>
		</c:otherwise>

	</c:choose>
	<!-- action : 에디터에 입력한 html 코드를 전달받을 Controller페이지 URL -->
	<section class="section section-padded">
	<div class="col-md-offset-5">
	<h3><caption>Q&A 작성하기</caption></h3>
	</div>
	
	<form action="/LIG/QuestionBoard/qboardwritepro.do" method="post" id="frm" name="frm" onsubmit="return subjectCheck();">
		
		<br />
		
		<div class="col-md-offset-3">
			<label>제목</label><input type="text" style="margin-left:35px;" id="subject" name="subject" placeholder="제목을 입력하세요"/>
		</div>
		<br />
		<div class="col-md-offset-3">
			<label>작성자</label>
			<input type="text" style="margin-left:20px;" id="writer" name="writer" value="<%=nickname%>" readonly>
		</div>
		<br />
			 <%
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String strdate = simpleDate.format(date);
			%>
			
		<div class="col-md-offset-3"> 
			<label>등록일</label>
			<input type="text" style="margin-left:20px;" id="regdate" name="regdate" value="<%= strdate %>" readonly>
		</div> 
		<br />
		<div class="col-md-offset-3"> 
		<label >내용</label>
		<br />
		<textarea rows="20" cols="100" title="내용" id="content"
			name="content" placeholder="내용을 입력하세요"></textarea>
		</div>
		<div class="col-md-offset-6">
		<input type="submit" class="btn btn-danger" id="submitbutton" value="작성하기" /> 
		<input type="button" class="btn btn-primary" id="golist" value="목록으로" onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do'" />
		</div>
	</form>


	</section>
	<c:import url="/WEB-INF/view/QuestionBoard/footer.jsp"></c:import>
	
	
	<c:import url="/WEB-INF/view/QuestionBoard/script.jsp"></c:import>
	
</body>
</html>
