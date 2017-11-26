<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.text.*"%>
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
		$("#submitbutton").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대9입
			editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증

			//폼 submit
			$("#frm").submit();
		})
	})

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='QuestionBoard/qboardlist.do' />");
		comSubmit.submit();
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


	<section class="section section-padded">
		<div class="col-md-offset-5">
		<h3><caption>Q&A 수정하기</caption></h3>
		</div>
		<form action="/LIG/QuestionBoard/qboardModify.do" method="post"
			id="frm">
			
				<input type="hidden" name="board_num" value="${map.board_num}">
			
				<br/>
				<div class="col-md-offset-3">
				<label>제목</label>
				
					<input type="text" size="45" style="margin-left:35px;" id="subject" name="subject"
						value="${map.subject}" >
				
				</div>
				<br/>
				<div class="col-md-offset-3">
				<label>작성자</label>
					
					<input type="text" style="margin-left:20px;" id="writer" name="writer" value="${map.writer}"
						readonly>
				
				</div>
				
				<br />
				<div class="col-md-offset-3">
				<label >등록일</label>
				
					<input type="text" style="margin-left:20px;" id="regdate" name="regdate"
						value="${map.regdate }" readonly>
				
				</div>
				
				<br />
				<div class="col-md-offset-3">
				<label >내용</label>
				</br>
				<textarea rows="20" cols="100" title="내용" id="content"
					name="content">${map.content}</textarea>
				</div>
				<br />
				<div class="col-md-offset-5">
				<input type="button" class="a btn-gray-fill" value="목록으로" id="list"
					onclick="location.href='qboardlist.do'">
				<input type="submit" class="a btn-lightorange-fill" value="수정완료" id="submitbutton">
				<input type="button" class="a btn-darkorange-fill" value="삭제하기" id="list"
					onclick="location.href='qboardDelete.do?num=${map.board_num}'">
				</div>
		</form>

		<!-- List로 뽑아온 것은 본래 이름.인덱스번호  로 뽑아와야 되지만 위 코드는 row라는이름에 하나의 글정보씩가져오는것이므로 
                    이름.프로퍼티명으로 접근이 가능한것. -->

	</section>
<c:import url="/WEB-INF/view/QuestionBoard/footer.jsp"></c:import>
<c:import url="/WEB-INF/view/QuestionBoard/script.jsp"></c:import>

</body>

</html>
