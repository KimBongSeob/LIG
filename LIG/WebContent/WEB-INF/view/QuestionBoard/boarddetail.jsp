<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/reset.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/board.css' />">
<c:import url="/WEB-INF/view/QuestionBoard/head.jsp"></c:import>
</head>
<style type="text/css">
.my-box { border:1px solid; padding:10px; width:800px; height:500px; }

</style>

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
			<h3>
				<caption>Q&A 상세보기</caption>
			</h3>
		</div>
		<form>
			<div class="col-md-offset-3"></div>
			<br>
			<div class="col-md-offset-3">
				<label>제목</label>
				
					<input type="text" size="45" style="margin-left:35px;" id="subject" name="subject"
						value="${map.subject}" readonly>
				
			</div>
			<br />

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
			<br />
			<div class="my-box">
				${map.content}
			</div>
			</div>
			<br />
		
			<c:choose>
			<c:when test="${sessionScope.nickname==map.writer}">
			<div class="col-md-offset-4">
				<input type="button" class="a btn-brown-fill" value="답글쓰기" 
				onclick="location.href='/LIG/QuestionBoard/qboardreplywrite.do?num=${map.board_num}&boardref=${map.ref}&boardrestep=${map.re_step}&boardrelevel=${map.re_level}'" />
				<input type="button" class="a btn-gray-fill" value="목록으로" id="list"
					onclick="location.href='qboardlist.do'">
				<!-- 세션에 저장된(로그인된 닉네임과 작성자가 같을때만 수정/삭제버튼 활성화 -->
				<input type="button" class="a btn-lightorange-fill" value="수정하기"
					onclick="location.href='/LIG/QuestionBoard/qboardModify.do?num=${map.board_num}'" />
				 <input type="button" class="a btn-darkorange-fill" value="삭제하기" id="list"
					onclick="location.href='qboardDelete.do?num=${map.board_num}'">
			</div>
			</c:when>
			
			<c:otherwise>
			<div class="col-md-offset-6">
				<input type="button" class="a btn-brown-fill" value="답글쓰기" 
				onclick="location.href='/LIG/QuestionBoard/qboardreplywrite.do?num=${map.board_num}&boardref=${map.ref}&boardrestep=${map.re_step}&boardrelevel=${map.re_level}'" />
				<input type="button" class="a btn-gray-fill" value="목록으로" id="list"
					onclick="location.href='qboardlist.do'"/>
			</c:otherwise> 
			</c:choose>

		</form>

		<!-- List로 뽑아온 것은 본래 이름.인덱스번호  로 뽑아와야 되지만 위 코드는 row라는이름에 하나의 글정보씩가져오는것이므로 
                    이름.프로퍼티명으로 접근이 가능한것. -->

	</section>
	<c:import url="/WEB-INF/view/QuestionBoard/footer.jsp"></c:import>


	<c:import url="/WEB-INF/view/QuestionBoard/script.jsp"></c:import>

</body>
</html>
