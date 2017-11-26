<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%
	String id = null;
	String nickName = null;
	if (session.getAttribute("mem_id") != null) {
		id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
	}
	if (session.getAttribute("nickName") != null) {
		nickName = (String) session.getAttribute("nickName");// 로그인 정보 가져오기.
	}
	session.setMaxInactiveInterval((60 * 60) * 12);
%>
<%
	String cp = request.getContextPath();// /springMvc
	request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<c:import url="/WEB-INF/view/MyPage/UserInfo/head.jsp"></c:import>

<script>

function Form_nickName_check(){
	var nickName = document.signup.nickName.value;
	var url="<%=cp%>/MemberShip/nickNameCheck.do";

		if (nickName == "") {
			alert("닉네임을 입력해주세요.");
			return;
		}
		$.ajax({
			type : "post" // 포스트방식
			,
			url : url // url 주소
			,
			data : "nickName=" + nickName,
			dataType : "json",
			success : function(args) { //응답이 성공 상태 코드를 반환하면 호출되는 함수
				if (args.count > 0) {
					$("#nickName_check_value").attr("value", "0");
					alert("이미 존재하는 닉네임 입니다.");
				} else {
					$("#nickName_check_value").attr("value", "1");
					alert("등록 가능한 닉네임 입니다.");
				}
			},
			error : function(e) { // 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
				alert(e.responseText);
			}
		});
	}

	function membership_check(list) {
		var signup = eval("document.signup");
		var registration_date = document.signup.registration_date.value;
		
	
		if (!signup.passwd.value) {
			alert("비밀번호를 입력하세요.");
			document.signup.passwd.focus();
			return false;
		}
		if (!signup.passwd_2.value) {
			alert("비밀번호를 재입력 해주세요.");
			document.signup.passwd_2.focus();
			return false;
		}
		if (signup.passwd.value != signup.passwd_2.value) {
			alert("비밀번호를 동일하게 입력해주세요.");
			document.signup.passwd_2.focus();
			return false;
		}
		if (signup.nickName_check_value.value == "-1") {
			//값이 변경되었으면 = return false;
			if(signup.nickName_change_value.value != "-1"){
				alert("먼저 닉네임 중복검사를 하셔야 합니다.");
				return false;
			}
		}
	}
	
		 function changeNick(signup){	 
			 signup.nickName_change_value.value = "0";
	   		 
		 }
	
</script>

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

							<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/myPage/index.do'/>'" aria-controls="home"
								role="tab" data-toggle="tab"><i class="fa fa-calendar"></i>
									<span>일정조회</span></a></li>
							<li role="presentation"><a
								onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
								aria-controls="profile" role="tab" data-toggle="tab"> <i
									class="fa fa-users" aria-hidden="true"></i> <span onclick="">일정공유</span></a></li>
							<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
								aria-controls="messages" role="tab" data-toggle="tab" > <i
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
							
								<section class="section section-padded sectionmem">

									<div class="container">
										<div class="row">
											<div class=".col-md">
												<h4 class="entry-title">회원정보수정</h4>
												<hr>
												<br>

												<form class="form-horizontal" id="signup" name="signup"
													modelAttribute="dto" method="post" action="modify.do" 
													onsubmit="return membership_check(this);">


													<fieldset disabled>
														<div class="form-group">
															<label for="disabledTextInput"
																class="control-label col-sm-3"> 아이디 </label>
															<div class="col-md-5 col-sm-9">
																<input type="text" id="disabledTextInput"
																	class="form-control" name="mem_id"
																	value="${dto.mem_id}">

															</div>
														</div>
													</fieldset>


													<div class="form-group">
														<label class="control-label col-sm-3">닉네임 </label>
														<div class="col-md-5 col-sm-9">
															<input type="text" class="form-control" name="nickName"
																id="nickName" value="${dto.nickName}" onChange="changeNick(this.form)">
														</div>

														<div style="display: inline-block; margin-left: -300px;" >
															<input type="button" class="btn btn-check" value="중복검사" id="nickName_check_button" name="nickName_check_button"
																	onclick="Form_nickName_check()">
															<input type="hidden" value="-1" id="nickName_check_value" name="nickName_check_value">
															<input type="hidden" value="-1" id="nickName_change_value" name="nickName_change_value">
														</div>
<!-- onChange="changeNick(this.form)" onclick="Form_nickName_check()"  -->
													</div>

													<fieldset disabled>
													<div class="form-group registration-date">
														<label class="control-label col-sm-3"
															for="registration-date">생년월일</label>
														<div class="col-md-5 col-sm-8">
															<div class="input-group registration-date-time">
																<span class="input-group-addon membership"
																	id="basic-addon1"> <span
																	class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
																<input class="form-control" value="${dto.jumin}"
																	name="registration_date" id="date-start">
																<!-- <input class= "form-control" id="date-start"> -->
															</div>
														</div>
													</div>
													</fieldset>


													<div class="form-group">
														<label class="control-label col-sm-3">이메일</label>
														<div class="col-md-5 col-sm-9">
															<div class="input-group">
																<span class="input-group-addon membership"> <i
																	class="glyphicon glyphicon-envelope"></i>
																</span><input type="email" class="form-control" name="email"
																	id="email" value="${dto.email }">
															</div>

														</div>
													</div>

													<div class="form-group">
														<label class="control-label col-sm-3">핸드폰 번호 </label>
														<div class="col-md-5 col-sm-9">
															<div class="input-group">
																<span class="input-group-addon membership"> <i
																	class="glyphicon glyphicon-phone"></i>
																</span> <input type="text" class="form-control" name="hphone"
																	id="hphone" value="${dto.hphone}">
															</div>
														</div>
													</div>

													<br>

													<div
														style="display: inline-block; margin-left: -300px; color: #ff8040;">
														※ 비밀번호를 변경하시려면 다시 입력해 주세요.</div>
													<div class="form-group">
														<label class="control-label col-sm-3"> 비밀번호 변경</label>
														<div class="col-md-5 col-sm-8">
															<div class="input-group">
																<span class="input-group-addon membership"><i
																	class="glyphicon glyphicon-lock"></i></span> <input
																	type="password" class="form-control" name="passwd"
																	id="passwd"  value="${dto.passwd }">
															</div>
														</div>
													</div>

													<div class="form-group">
														<label class="control-label col-sm-3">비밀번호 확인 </label>
														<div class="col-md-5 col-sm-7">
															<div class="input-group">
																<span class="input-group-addon membership"> <i
																	class="glyphicon glyphicon-lock"></i></span> <input
																	type="password" class="form-control" name="passwd_2"
																	id="passwd_2" value="${dto.passwd }">
															</div>
														</div>
													</div>




													<div class="form-group">
														<div style="display: inline-block; margin: 30 400;">
															<input type="submit" value="수정완료" id="modify"
																name="modify" class="a btn-orange-fill">
														</div>
													
													
													<div style="display: inline-block; margin-left: -380px;">
														<input type="button" value="회원탈퇴"
															class="a btn-orange-fill"
															onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/delete.do'/>'">
													</div>
													</div>
												</form>
												</div>
										</div>
									</div>
								</section>


							</div>

						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/view/MyPage/UserInfo/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/MyPage/UserInfo/script.jsp"></c:import>

</body>
</html>