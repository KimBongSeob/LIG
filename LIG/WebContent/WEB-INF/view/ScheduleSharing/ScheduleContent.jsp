<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
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
<!-- 	     name = null id = 0; -->
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

		<div class="card2">

			<!-- 테마여행 상세 상단 -->

			<form id="items" name="items" method="get"
				action="/LIG/ScheduleSharing/additems.do">
				<c:forEach var="dto" items="${dto}" varStatus="status">
					<c:if test="${status.index == 0}">
						<input type="hidden" name="group_id" value="${dto.group_id}">
						<!-- <div class="day">당일</div> -->

						<div>
							<ul>
								<li class="subject"
									style="border-bottom: 1px solid #ada8a2; text-align: center;"><h2 class="subject">${dto.subject}</h2></li>
					
								<li style="text-align: center; margin-top:20px"><span
									class="glyphicon glyphicon-tent" style="color: #3d3223" >&nbsp;<strong>여행테마</strong>&nbsp;|&nbsp;</span> <span style="color:#605e5a;">
										${dto.share_content}</span> </li>
						
								<li style="text-align: center;"><span
									class="glyphicon glyphicon-user" style="color: #3d3223">&nbsp;<strong>작성자</strong>&nbsp;|&nbsp;</span>
									<span style="color:#605e5a;">${dto.mem_id}</span></li>
								</li>

								<li style="text-align: center;"><span
									class="glyphicon glyphicon-calendar" style="color: #3d3223">&nbsp;<strong>여행기간</strong>&nbsp;|&nbsp;</span>
									<span style="color:#605e5a;">${dto.start_date}</span> <!-- <a href="javascript:gotoNick();">다른 일정 보기</a> -->
									<span style="color:#605e5a;" >&nbsp;~ &nbsp;&nbsp;${dto.end_date}</span> <!-- <a href="javascript:gotoNick();">다른 일정 보기</a> -->
								</li>
								<br />
								<li style="text-align: center;"><span
									class="glyphicon glyphicon-ok" style="color: #3d3223"></span>&nbsp;&nbsp;&nbsp;<span class="like" style="font-style:oblique ;color: #3d3831; text-decoration:underline;"><strong>이
										일정이 마음에 드셨나요&nbsp;?</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span> <c:choose>
											<c:when test="${sessionScope.mem_id != null}">
												<input type="submit" value="일정등록하기"
													class="a btn-orange-fill-bt btora"
													style="font-size: 15px; margin: 0 auto; text-align: center; vertical-align: middle;" />
											</c:when>
											<c:otherwise>
												<input value="일정등록하기" class="a btn-orange-fill-bt btora form-control"
													style="padding-top:10px; padding-bottom:10px;font-size: 15px; margin: 0 auto; text-align: center; vertical-align: middle;"
													onclick="javascript:alert('먼저 로그인을 하셔야 됩니다.')" readonly/>
											</c:otherwise>

										</c:choose>
								</span></li>


							</ul>
						</div>
		</div>
		<!-- card -->
		<!-- 테마여행 상세 컨텐츠 -->


		<div class="row text-center title" id="areaSearch">
		<div class="mypageSubDiv-8">
			<div class="arearesultUl_con">
				<!-- style="float: left; margin-bottom: 20px; text-align: center;"> -->

				<div class="arearesultLi_con">
					<div class="service_con">
						<table class="table table-striped">
							<tr>
								<td class="day" style="color: #4c4b4a">${dto.day_no}&nbsp;일차</td>
							</tr>


							<tr>

								<td><c:choose>
										<c:when
											test="${dto.dest_name_1 ==null || dto.dest_name_1==''} ">
										</c:when>
										<c:when
											test="${dto.dest_name_2 ==null || dto.dest_name_1==''} ">
										</c:when>
										<c:when
											test="${dto.dest_name_3 ==null || dto.dest_name_1==''} ">
										</c:when>
										<c:when
											test="${dto.dest_name_4 ==null || dto.dest_name_1==''} ">
										</c:when>
										<c:when
											test="${dto.dest_name_5 ==null || dto.dest_name_1==''} ">
										</c:when>
										<c:otherwise>
											<a
												href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_1}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
												${dto.dest_name_1}<br>
											</a>
											<a
												href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_2}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
												${dto.dest_name_2}<br>
											</a>
											<a
												href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_3}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
												${dto.dest_name_3}<br>
											</a>
											<a
												href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_4}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
												${dto.dest_name_4}<br>
											</a>
											<a
												href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${list.dest_id_5}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
												${dto.dest_name_5}<br>
											</a>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
					</div>
				</div>


				</c:if>


				<div class="arearesultUl_con">
					<c:if test="${status.index > 0}">
						<div class="arearesultLi_con">
							<div class="service_con">
								<table class="table table-striped">
									<tr>
										<td class="day"style="color: #4c4b4a";>${dto.day_no}&nbsp;일차</td>
									</tr>
									<tr>
										<td><c:choose>
												<c:when
													test="${dto.dest_name_1 ==null || dto.dest_name_1==''} ">
												</c:when>
												<c:when
													test="${dto.dest_name_2 ==null || dto.dest_name_1==''} ">
												</c:when>
												<c:when
													test="${dto.dest_name_3 ==null || dto.dest_name_1==''} ">
												</c:when>
												<c:when
													test="${dto.dest_name_4 ==null || dto.dest_name_1==''} ">
												</c:when>
												<c:when
													test="${dto.dest_name_5 ==null || dto.dest_name_1==''} ">
												</c:when>
												<c:otherwise>
													<a
														href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_1}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
														${dto.dest_name_1}<br>
													</a>
													<a
														href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_2}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
														${dto.dest_name_2}<br>
													</a>
													<a
														href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_3}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
														${dto.dest_name_3}<br>
													</a>
													<a
														href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_4}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
														${dto.dest_name_4}<br>
													</a>
													<a
														href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${dto.dest_id_5}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
														${dto.dest_name_5}<br>
													</a>
												</c:otherwise>
											</c:choose></td>
									</tr>

								</table>

							</div>
					</div>
					</c:if>
				</c:forEach>
				</form>
				</div>
						</div>
	</section>
	<c:import url="/WEB-INF/view/ScheduleSharing/script.jsp"></c:import>

	<c:import url="/WEB-INF/view/ScheduleSharing/footer.jsp"></c:import>
</body>
</html>