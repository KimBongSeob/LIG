<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
<c:import url="/WEB-INF/view/Main/head.jsp"></c:import>

</head>

<body>
	<c:import url="/WEB-INF/view/Main/Login.jsp"></c:import>

	<c:choose>
		<c:when test="${sessionScope.mem_id != null}">
			<c:choose>
				<c:when test="${sessionScope.mem_id == 'admin'}">
					<c:import url="/WEB-INF/view/Main/admin_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/view/Main/login_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/view/Main/header.jsp"></c:import>
		</c:otherwise>

	</c:choose>


	<c:import url="/WEB-INF/view/Main/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/Main/script.jsp"></c:import>
	<!-- Scripts -->
</body>

</html>
