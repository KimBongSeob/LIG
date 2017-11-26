<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<html>

<head>
<c:import url="/WEB-INF/view/Destination/head.jsp"></c:import>

</head>

<body>
<c:import url="/WEB-INF/view/Destination/Login.jsp"></c:import>
	<c:choose>
		<c:when test="${sessionScope.mem_id != null}">
			<c:choose>
				<c:when test="${sessionScope.mem_id == 'admin'}">
					<c:import url="/WEB-INF/view/Destination/admin_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/view/Destination/login_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/view/Destination/header.jsp"></c:import>
		</c:otherwise>

	</c:choose>



	<section id="sideMenu" class="section section-padded">
		<div class="row text-center title">
			<h2>여행지 보기</h2>
			<h4 class="light muted">떠나고 싶은 여행지를 직접 검색해보세요!</h4>
		</div>


		<div class="row text-center title">
			<!--<div>
					<select class="btn-warning" id="content_m1" name="content_m1">
						<option value="">관광타입선택</option>
					</select>
					<select class="btn-warning" id="area_m1" name="area_m1">
						<option value="">지역선택</option>
					</select>
					<select class="btn-warning" id="area_m2" name="area_m2">
						<option value="">시/군/구 선택</option>
					</select>
					<button class="a btn-orange-fill" type="submit" onclick="areaSearch();">검색</button>
				</div>  -->
			<div class="col-lg-12 mypageDiv">
				<div class="mypageSubDiv-auto">
					<div class="form-group">
						<div class="input-group">
							<div style="display: inline-block; margin-left: 17px;">
								<select class="btn-default form-control" id="content_m1"
									name="content_m1">
									<option value="">관광타입선택</option>
								</select>
							</div>
							<div style="display: inline-block; margin-left: 17px;">
								<select class="btn-default form-control" id="area_m1"
									name="area_m1">
									<option value="">지역선택</option>
								</select>
							</div>
							<div style="display: inline-block; margin-left: 17px;">
								<select class="btn-default form-control" id="area_m2"
									name="area_m2">
									<option value="">시/군/구 선택</option>
								</select>
							</div>
							<div style="display: inline-block; margin-left: 30px;">
								<a class="a btn-orange-fill form-control"
									onclick="areaSearch();"> <i class="fa fa-search"
									aria-hidden="true"></i></a>
							</div>



						</div>


					</div>
				</div>
			</div>



			<input type='hidden' id="allPage" name="allPage">

			
			<div class="col-lg-12 mypageDiv" id="areaSearch">
				<div class="mypageSubDiv-8">
					<ul class='arearesultUl' id='arearesultUl'></ul>
				</div>
			</div>
			
		</div>
		<!-- pageNumber area -->
		<div class="row text-center title" id="DestinationPageNumDiv"></div>
	</section>


	<c:import url="/WEB-INF/view/Destination/footer.jsp"></c:import>


	<c:import url="/WEB-INF/view/Destination/script.jsp"></c:import>
	<!-- Scripts -->
</body>

</html>
