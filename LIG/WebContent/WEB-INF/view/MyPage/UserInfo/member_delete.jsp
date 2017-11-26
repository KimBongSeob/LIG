<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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

<%-- 
<%
	String result = (String) request.getAttribute("result");
%>   --%>
<html>
<head>
<c:import url="/WEB-INF/view/MyPage/UserInfo/head.jsp"></c:import>


<c:if test="${memberDelResult == 'false'}">
	<script>
alert("비밀번호를 정확히 입력해주세요.");
</script>
</c:if> 

</head>

<body>
	<c:import url="/WEB-INF/view/MyPage/UserInfo/Login.jsp"></c:import>
	
	<c:choose>
		<c:when test="${sessionScope.mem_id != null}">
			<c:choose>
				<c:when test="${sessionScope.mem_id == 'admin'}">
					<c:import url="/WEB-INF/view/MyPage/UserInfo/admin_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/view/MyPage/UserInfo/login_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/view/MyPage/UserInfo/header.jsp"></c:import>
		</c:otherwise>

	</c:choose>
	
	
	
	<!-- action="/LIG/MyPage/modify.do" -->
	<section id="sideMenu" class="section section-padded">
		<div class="row text-center title">
			<div class="col-lg-12 mypageDiv">
				<div class="mypageSubDiv">
					<!-- Nav tabs -->
					<div class="card">
						<ul class="nav nav-tabs" role="tablist">

							<li role="presentation"><a href="#home" aria-controls="home"
								role="tab" data-toggle="tab"><i class="fa fa-calendar"></i>
									<span>일정조회</span></a></li>
							<li role="presentation"><a
								onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
								aria-controls="profile" role="tab" data-toggle="tab"> <i
									class="fa fa-users" aria-hidden="true"></i> <span onclick="">일정공유</span></a></li>
							<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
								aria-controls="messages" role="tab" data-toggle="tab"> <i
									class="glyphicon glyphicon-list-alt" style="display: inline-block;"></i>  <span>Q & A
										게시판</span></a></li>
							<li role="presentation" class="active"><a
								onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/member_view.do'/>'"
								aria-controls="settings" role="tab" data-toggle="tab"> <i
									class="glyphicon glyphicon-user" aria-hidden="true" style="display: inline-block;"></i>  <span>개인정보
										조회</span></a></li>
						</ul>


						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane" id="home"></div>
							<div role="tabpanel" class="tab-pane" id="profile"></div>
							<div role="tabpanel" class="tab-pane" id="messages"></div>
							<div role="tabpanel" class="tab-pane active" id="settings">
								<%-- <div role="tabpanel" class="tab-pane" id="settings">
						<a href="<c:url value='/MyPage/UserInfo/member_view.do'/>">개인정보조회</a>
						<a href="<c:url value='/MyPage/UserInfo/delete.do'/>">회원탈퇴</a>
							</div>  --%>
								<section class="section section-padded sectionmem">
									<div class="container">
										<div class="row">

											<div class=".col-md">
												<h4 class="entry-title">회원탈퇴</h4>
												<hr>
												<br>

												<form class="form-horizontal" method="post" action="deletemem.do" 
												onsubmit="return membership_check(this);" 
												name="userinput" modelAttribute="dto" >													

													<fieldset disabled>
														<div class="form-group">
															<label for="disabledTextInput"
																class="control-label col-sm-3"> 아이디 </label>
															<div class="col-md-5 col-sm-9">
																<input type="text" id="disabledTextInput"
																	class="form-control" name="mem_Id"
																	value="${dto.mem_id}">

															</div>
														</div>
													</fieldset>
													
													<div class="form-group">
														<label class="control-label col-sm-3"> <span
															class="text-danger">*&nbsp;</span> 비밀번호
														</label>
														<div class="col-md-5 col-sm-8">
															<div class="input-group">
																<span class="input-group-addon membership"><i
																	class="glyphicon glyphicon-lock"></i></span> <input
																	type="password" class="form-control" name="passwd"
																	id="passwd" placeholder="비밀번호를 입력해주세요." value="">
															</div>
														</div>
													</div>

													<div class="form-group">
													
														<div style="display: inline-block; margin: 20 auto;">
															<input type="submit" value="회원탈퇴" id="deletemem"
																name="deletemem" class="a btn-orange-fill">
														</div>
														
													</div>

												</form>
												
											</div>
										</div>
										</div>
								</section>
							</div>
						</div>
						
					</div><!-- card -->					
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/view/MyPage/UserInfo/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/MyPage/ScheduleSharing/script.jsp"></c:import>
</body>
</html>