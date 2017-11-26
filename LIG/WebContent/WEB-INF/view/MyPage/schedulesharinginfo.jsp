<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String id = null;
	String nickname = null;
	String token = null;
	if (session.getAttribute("mem_id") != null) {
		id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
	}
	if (session.getAttribute("nickname") != null) {
		nickname = (String) session.getAttribute("nickname");// 로그인 정보 가져오기.
	}
	if (session.getAttribute("access_token") != null) {
		token = (String) session.getAttribute("access_token");
		//System.out.println("마이페이지 액세스 토큰::"+token);
	}
	session.setMaxInactiveInterval((60 * 60) * 12);
%>
<!DOCTYPE html>
<html>

<head>
<c:import url="/WEB-INF/view/MyPage/head.jsp"></c:import>

</head>

<body>
	<c:import url="/WEB-INF/view/MyPage/Login.jsp"></c:import>
	<c:choose>
		<c:when test="${sessionScope.mem_id != null}">
			<c:choose>
				<c:when test="${sessionScope.mem_id == 'admin'}">
					<c:import url="/WEB-INF/view/MyPage/admin_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/view/MyPage/login_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/view/MyPage/header.jsp"></c:import>
		</c:otherwise>

	</c:choose>


<c:choose>
		<c:when test="${sessionScope.access_token != null}">
		

	<section id="sideMenu" class="section section-padded">
		<div class="row text-center title">
			<div class="col-lg-12 mypageDiv">
				<div class="mypageSubDiv">
					<!-- Nav tabs -->
					<div class="card">
						<ul class="nav nav-tabs navthree" role="tablist">
							<c:if test="${select == null }">
								<li role="presentation" class="active"><a onclick="location.href='/LIG/myPage/index.do';"
									aria-controls="home" role="tab" data-toggle="tab"><i
										class="fa fa-calendar"></i> <span>일정조회</span></a></li>
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
									aria-controls="profile" role="tab" data-toggle="tab"> <i
										class="fa fa-users" aria-hidden="true"></i> <span onclick="">일정공유</span></a></li>
								<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
									aria-controls="messages" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-list-alt"></i>  <span>Q & A
											게시판</span></a></li>
								<%-- <li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/member_view.do'/>'"
									aria-controls="settings" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-user" aria-hidden="true"></i>  <span>개인정보
											조회</span></a></li> --%>
							</c:if>

							<c:if test="${select == 1 }">
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/myPage/index.do'/>'"
									aria-controls="home" role="tab" data-toggle="tab"><i
										class="fa fa-calendar"></i> <span>일정조회</span></a></li>
								<li role="presentation" class="active"><a href="#profile"
									aria-controls="profile" role="tab" data-toggle="tab"> <i
										class="fa fa-users" aria-hidden="true"></i> <span onclick="">일정공유</span></a></li>
								<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
									aria-controls="messages" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-list-alt"></i>  <span>Q & A
											게시판</span></a></li>
								<%-- <li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/member_view.do'/>'"
									aria-controls="settings" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-user" aria-hidden="true"></i>  <span>개인정보
											조회</span></a></li> --%>
							</c:if>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<c:if test="${select == null }">
								<div role="tabpanel" class="tab-pane active" id="home"></div>
								<div role="tabpanel" class="tab-pane" id="profile">
							</c:if>
							<c:if test="${select == 1 }">
								<div role="tabpanel" class="tab-pane" id="home"></div>
								<div role="tabpanel" class="tab-pane active" id="profile">
							</c:if>
							<div class="row">
								<span class="glyphicon glyphicon-align-left" style="float:left; margin-left:30px; margin-bottom:-15px; font-size:50px; color:rgba(210, 78, 78, 0.78);">
									일정공유조회
								</span>
							</div>
							<br><hr>
							<div class='row'>
								<div class="col-lg-12">
								<div class="row" style="margin-bottom:35px; margin-top:90px;">
								<span style="float:left; margin-left:30px;width:100px; -webkit-transform: scale(2);">
												<input type="checkbox" id="all_delcheck" name="all_delcheck"><span style="font-size: 12px;margin-left: 5.5px; color:rgba(210, 78, 78, 0.78);">전체선택</span>
												</span>
												<span style="float:left; margin-left:60px; margin-top:-10px; "><button class="a btn-orange-fill radius" type="button" id="delbutton"><span
										class="glyphicon glyphicon-trash align-center btn-group-sm"
										aria-hidden="true"></span></button></span>
												<span style="float:right; margin-right:80px; margin-top:-10px;"><a class="a btn-orange-fill radius" href="<c:url value='/mypage/scheduleSharing/index.do'/>">일정공유 등록</a></span>
												
								</div>
								<hr>
								
									<%-- <c:set var="count" value="0"></c:set> --%>
									
									<ul class='arearesultUl' id='arearesultUl' style="margin-top:50px;">
							
										<c:forEach var="i" begin="0"  end="${endRow-1}">
											
											<c:if test="${itemList[i].firstimage != null}">
											<li class='arearesultLi'>
												<span style="float:left; width:50px; -webkit-transform: scale(1.5); margin-top:20px; margin-left:-15px;">
												<input type="checkbox" id="delcheck" name="delcheck">
												</span>
												<input type="hidden" id="group_id" name="group_id" value="${itemList[i].group_id}">
													<a href="/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}">
												<div class='service' style="background-image: url(${itemList[i].firstimage});">
													<div class='icon-holder'>
														<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt=''><p>${itemList[i].start_date} ~ ${itemList[i].end_date}<br>
															${itemList[i].subject}</p>
															</a>
													</div>
													<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt='' style="text-decoration:none; text-shadow: rgb(0, 0, 0) 1px 1px 5px, rgb(206, 170, 156) 1px 1px 5px;" >
														<p class='description overflow' style="color: #f5f5f5; background-color: rgba(132, 119, 112, 0.53); ">${itemList[i].share_content}</p>
													</a>
												</div>
											</li>
											</c:if>
											<c:if test="${itemList[i].firstimage == null}">
											<li class='arearesultLi'>
												<span style="float:left; width:50px; -webkit-transform: scale(1.5); margin-top:20px; margin-left:-15px;">
												<input type="checkbox" id="delcheck" name="delcheck">
												</span>
												<input type="hidden" id="group_id" name="group_id" value="${itemList[i].group_id}">
												<div class='service' style="background-image: url(/LIG/img/unknown2.png);">
													<div class='icon-holder' >
														<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt='' ><p>${itemList[i].start_date} ~ ${itemList[i].end_date}<br>
															${itemList[i].subject}</p></a>
													</div>
													<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt='' style="text-decoration:none; text-shadow: rgb(0, 0, 0) 1px 1px 5px, rgb(206, 170, 156) 1px 1px 5px;">
														<p class='description overflow' style="color: #f5f5f5; background-color: rgba(132, 119, 112, 0.53); ">${itemList[i].share_content}</p>
													
												</div>
											</li>
											
											</c:if>
										</c:forEach>
									</a>
									</ul>

								</div>

								<div class="row">
									<div class="col col-xs-offset-3 col-xs-6">
										<ul class="pagination">

											<c:if test="${pageCount > 0}">
												<c:if test="${startPage > pageBlock}">
													<a
														href="<c:url value='/mypage/scheduleSharing/selectList.do?pageNum=${startPage - pageBlock }'/>">[이전]&ensp;</a>
												</c:if>

												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<a
														href="<c:url value='/mypage/scheduleSharing/selectList.do?pageNum=${i}'/>">[${i}]</a>
												</c:forEach>

												<c:if test="${endPage < pageCount}">
													<a
														href="<c:url value='/mypage/scheduleSharing/selectList.do?pageNum=${startPage + pageBlock }'/>">&ensp;[다음]</a>
												</c:if>
											</c:if>

											<!-- pageNum에 따른 글번호이동 -->


										</ul>
									</div>
								</div>


							</div>
							<div role="tabpanel" class="tab-pane" id="messages"></div>
							<div role="tabpanel" class="tab-pane" id="settings"></div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	
	
	</c:when>
				
				<c:otherwise>
				
	<section id="sideMenu" class="section section-padded">
		<div class="row text-center title">
			<div class="col-lg-12 mypageDiv">
				<div class="mypageSubDiv">
					<!-- Nav tabs -->
					<div class="card">
						<ul class="nav nav-tabs" role="tablist">
							<c:if test="${select == null }">
								<li role="presentation" class="active"><a onclick="location.href='/LIG/myPage/index.do';"
									aria-controls="home" role="tab" data-toggle="tab"><i
										class="fa fa-calendar"></i> <span>일정조회</span></a></li>
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
									aria-controls="profile" role="tab" data-toggle="tab"> <i
										class="fa fa-users" aria-hidden="true"></i> <span onclick="">일정공유</span></a></li>
								<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
									aria-controls="messages" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-list-alt"></i>  <span>Q & A
											게시판</span></a></li>
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/member_view.do'/>'"
									aria-controls="settings" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-user" aria-hidden="true"></i>  <span>개인정보
											조회</span></a></li>
							</c:if>

							<c:if test="${select == 1 }">
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/myPage/index.do'/>'"
									aria-controls="home" role="tab" data-toggle="tab"><i
										class="fa fa-calendar"></i> <span>일정조회</span></a></li>
								<li role="presentation" class="active"><a onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
									aria-controls="profile" role="tab" data-toggle="tab"> <i
										class="fa fa-users" aria-hidden="true"></i> <span onclick="">일정공유</span></a></li>
								<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
									aria-controls="messages" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-list-alt"></i>  <span>Q & A
											게시판</span></a></li>
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/member_view.do'/>'"
									aria-controls="settings" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-user" aria-hidden="true"></i>  <span>개인정보
											조회</span></a></li>
							</c:if>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<c:if test="${select == null }">
								<div role="tabpanel" class="tab-pane active" id="home"></div>
								<div role="tabpanel" class="tab-pane" id="profile">
							</c:if>
							<c:if test="${select == 1 }">
								<div role="tabpanel" class="tab-pane" id="home"></div>
								<div role="tabpanel" class="tab-pane active" id="profile">
							</c:if>
							<div class="row">
								<span class="glyphicon glyphicon-align-left" style="float:left; margin-left:30px; margin-bottom:-15px; font-size:50px; color:rgba(210, 78, 78, 0.78);">
									일정공유조회
								</span>
							</div>
							<br><hr>
							<div class='row'>
								<div class="col-lg-12">
								<div class="row" style="margin-bottom:35px; margin-top:90px;">
								<span style="float:left; margin-left:30px;width:100px; -webkit-transform: scale(2);">
												<input type="checkbox" id="all_delcheck" name="all_delcheck"><span style="font-size: 12px;margin-left: 5.5px; color:rgba(210, 78, 78, 0.78);">전체선택</span>
												</span>
												<span style="float:left; margin-left:60px; margin-top:-10px; "><button class="a btn-orange-fill radius" type="button" id="delbutton"><span
										class="glyphicon glyphicon-trash align-center btn-group-sm"
										aria-hidden="true"></span></button></span>
												<span style="float:right; margin-right:80px; margin-top:-10px;"><a class="a btn-orange-fill radius" href="<c:url value='/mypage/scheduleSharing/index.do'/>">일정공유 등록</a></span>
												
								</div>
								<hr>
								
									<%-- <c:set var="count" value="0"></c:set> --%>
									
									<ul class='arearesultUl' id='arearesultUl' style="margin-top:50px;">
									
										<c:forEach var="i" begin="0"  end="${endRow-1}">
											
											<c:if test="${itemList[i].firstimage != null}">
											<li class='arearesultLi'>
												<span style="float:left; width:50px; -webkit-transform: scale(1.5); margin-top:20px; margin-left:-15px;">
												<input type="checkbox" id="delcheck" name="delcheck">
												</span>
												<input type="hidden" id="group_id" name="group_id" value="${itemList[i].group_id}">
												<div class='service' style="background-image: url(${itemList[i].firstimage});">
													<div class='icon-holder'>
														<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt=''><p>${itemList[i].start_date} ~ ${itemList[i].end_date}<br>
															${itemList[i].subject}</p>
															</a>
													</div>
													<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt='' style="text-decoration:none; text-shadow: rgb(0, 0, 0) 1px 1px 5px, rgb(206, 170, 156) 1px 1px 5px;" >
														<p class='description overflow' style="color: #f5f5f5; background-color: rgba(132, 119, 112, 0.53); ">${itemList[i].share_content}</p>
													</a>
												</div>
											</li>
											</c:if>
											<c:if test="${itemList[i].firstimage == null}">
											<li class='arearesultLi'>
												<span style="float:left; width:50px; -webkit-transform: scale(1.5); margin-top:20px; margin-left:-15px;">
												<input type="checkbox" id="delcheck" name="delcheck">
												</span>
												<input type="hidden" id="group_id" name="group_id" value="${itemList[i].group_id}">
												<div class='service' style="background-image: url(/LIG/img/unknown2.png);">
													<div class='icon-holder' >
														<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt='' ><p>${itemList[i].start_date} ~ ${itemList[i].end_date}<br>
															${itemList[i].subject}</p></a>
													</div>
													<a href='/LIG/ScheduleSharing/ScheduleContent.do?group_id=${itemList[i].group_id}' alt='' style="text-decoration:none; text-shadow: rgb(0, 0, 0) 1px 1px 5px, rgb(206, 170, 156) 1px 1px 5px;">
														<p class='description overflow' style="color: #f5f5f5; background-color: rgba(132, 119, 112, 0.53); ">${itemList[i].share_content}</p>
													</a>
												</div>
											</li>
											
											</c:if>
										</c:forEach>
									
									</ul>

								</div>

								<div class="row">
									<div class="col col-xs-offset-3 col-xs-6">
										<ul class="pagination">

											<c:if test="${pageCount > 0}">
												<c:if test="${startPage > pageBlock}">
													<a
														href="<c:url value='/mypage/scheduleSharing/selectList.do?pageNum=${startPage - pageBlock }'/>">[이전]&ensp;</a>
												</c:if>

												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<a
														href="<c:url value='/mypage/scheduleSharing/selectList.do?pageNum=${i}'/>">[${i}]</a>
												</c:forEach>

												<c:if test="${endPage < pageCount}">
													<a
														href="<c:url value='/mypage/scheduleSharing/selectList.do?pageNum=${startPage + pageBlock }'/>">&ensp;[다음]</a>
												</c:if>
											</c:if>

											<!-- pageNum에 따른 글번호이동 -->


										</ul>
									</div>
								</div>


							</div>
							<div role="tabpanel" class="tab-pane" id="messages"></div>
							<div role="tabpanel" class="tab-pane" id="settings"></div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>			
	
	</c:otherwise>
			</c:choose>
	
	
	

	<c:import url="/WEB-INF/view/MyPage/footer.jsp"></c:import>


	<c:import url="/WEB-INF/view/MyPage/script.jsp"></c:import>
	<!-- Scripts -->

</body>

</html>
