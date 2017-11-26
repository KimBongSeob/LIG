<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String cp = request.getContextPath();// /projectName
	request.setCharacterEncoding("UTF-8");
%>
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
<title>Let It Go</title>
<c:import url="/WEB-INF/view/ScheduleSharing/head.jsp"></c:import>

</head>
<body>
	<c:import url="/WEB-INF/view/ScheduleSharing/Login.jsp"></c:import>
	<c:choose>
		<c:when test="${sessionScope.mem_id != null}">
			<c:choose>
				<c:when test="${sessionScope.mem_id == 'admin'}">
					<c:import url="/WEB-INF/view/ScheduleSharing/admin_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/view/ScheduleSharing/login_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/view/ScheduleSharing/header.jsp"></c:import>
		</c:otherwise>

	</c:choose>
	<section id="sideMenu" class="section section-padded">
		<div class="row text-center title">
			<h2>일정공유</h2>
			<h4 class="light muted" style="line-height: 2em;">떠나고 싶은 여행지를 직접
				검색해보세요!</h4>
		</div>


		<div class="row text-center title" style="margin-top: -90px;">
			<form id="searchForm" name="search" method="get">
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
					<div class="mypageSubDiv">
						<div class="form-group">
							<div class="input-group">
								<div style="display: inline-block; margin-left:-17px;margin-bottom: 10px;">
									<div id="search" style="float: left;">
										<input type="text" class="btn-default form-control"
											name="searchWord" id="searchWord" size="40" maxlength="30"
											placeholder="제목,여행지명,여행지역으로 검색" />
									</div>
									<div style="float: left; margin-left: 17px;">
										<input type="submit" class="a btn-orange-fill form-control"
											value="일정 찾기" onclick='fun_search("searchWord");'>
									</div>
								</div>
								<div style="clear: left;">
									<div style="float: left;margin-left:-17px">
										<select class="btn-default form-control" id="content_m1"
											name="content_m1">
											<option value="">관광타입선택</option>
										</select>
									</div>
									<div style="float: left; margin-left: 17px;">
										<select class="btn-default form-control" id="area_m1"
											name="area_m1">
											<option value="">지역선택</option>
										</select>
									</div>
									<div style="float: left; margin-left: 17px;">
										<select class="btn-default form-control" id="area_m2"
											name="area_m2">
											<option value="">시/군/구 선택</option>
										</select>
									</div>
									<div style="display: inline-block; margin-left: 17px;">
										<a class="a btn-orange-fill form-control"
											onclick='fun_search("searchall");'> <i
											class="fa fa-search" aria-hidden="true"></i></a>
									</div>




								</div>

							</div>

						</div>
					</div>


					<div class="col-lg-12" id="areaSearch">
						<div class="mypageSubDiv-8">
							<div class="arearesultUl " id='arearesultUl'>

								<c:forEach items="${itemList_a}" var="list" varStatus="status">

									<div class="arearesultLi-30">
										<div style="margin-top: 20px; margin-bottom: -20px">
											<c:if test="${sessionScope.mem_id == 'admin'}">
												<form name="del" method="get"
													action="/LIG/ScheduleSharing/scheduleSharing/delitem.do"
													onsubmit="return checkdeletingid();">
													<input type="hidden" name="group_id"
														value="${list.group_id}"> <input type="submit"
														value="삭제" class="a btn-orange-fill"/>

												</form>

											</c:if>

										</div>
										<div class="service">


								<div class="icon-holder Destination">

									<img src="${list.firstimage}" alt="" width="330px"
										height="200px">


									<c:if test="${ empty  list.firstimage}">

										<img src="${pageContext.request.contextPath}/img/unknown.png"
											alt="" width="330px" height="200px">
									</c:if>

								</div>
								<a
									href="/LIG/ScheduleSharing/ScheduleContent.do?group_id=${list.group_id}">

									<p class="heading Destination">${list.start_date}-${list.end_date }</p>
									<p class="destination">${list.subject}</p>

								</a>

							</div>
						</div>
					</c:forEach>
							</div>
						</div>
					</div>
					<div class="row text-center title">
						<ul class="pagination">

							<c:if test="${pageCount > 0}">
								<c:if test="${startPage > pageBlock}">
									<a
										href="<c:url value='/ScheduleSharing/ScheduleSharingList.do?pageNum=${startPage - pageBlock }'/>">[이전]&ensp;</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a
										href="<c:url value='/ScheduleSharing/ScheduleSharingList.do?pageNum=${i}'/>">[${i}]</a>
								</c:forEach>

								<c:if test="${endPage < pageCount}">
									<a
										href="<c:url value='/ScheduleSharing/ScheduleSharingList.do?pageNum=${startPage + pageBlock }'/>">&ensp;[다음]</a>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- pageNum에 따른 글번호이동 -->
	</section>

	<c:import url="/WEB-INF/view/ScheduleSharing/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/ScheduleSharing/script.jsp"></c:import>
</body>
</html>
