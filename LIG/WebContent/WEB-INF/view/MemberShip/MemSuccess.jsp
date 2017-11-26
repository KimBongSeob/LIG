<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();// /springMvc
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<c:import url="/WEB-INF/view/MemberShip/head.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/view/MemberShip/header.jsp"></c:import>



	<section class="section section-padded">

	회원가입완료
	</section>



	<c:import url="/WEB-INF/view/MemberShip/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/MemberShip/script.jsp"></c:import>
	<!-- Scripts -->
</body>

</html>