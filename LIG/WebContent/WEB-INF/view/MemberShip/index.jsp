<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();// /springMvc
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
<c:import url="/WEB-INF/view/MemberShip/head.jsp"></c:import>

<script>


function Form_id_check(){
	var mem_id = document.signup.mem_Id.value;
	var url="<%=cp%>/MemberShip/idCheck.do";
	
	if(mem_id == ""){
		alert("아이디를 입력해주세요.");
		return;
	}
	$.ajax({
		type:"post"		// 포스트방식
		,url:url		// url 주소
		,data:"mem_Id="+mem_id
		,dataType:"json"
		,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			if(args.count > 0 ){ 
				$("#id_check_value").attr("value","0");
				alert("이미 존재하는 아이디 입니다.");
			}else{
				$("#id_check_value").attr("value","1");
				alert("등록 가능한 아이디 입니다.");
			}
		}
	    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
	    	alert(e.responseText);
	    }
	});
	
}
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

		if (!signup.mem_Id.value) {
			alert("아이디를 입력해주세요.");
			document.signup.mem_Id.focus();
			return false;
		}
		if (!signup.nickName.value) {
			alert("닉네임을 입력해주세요.");
			document.signup.nickName.focus();
			return false;
		}
		if (!signup.email.value) {
			alert("이메일을 입력해주세요.");
			document.signup.email.focus();
			return false;
		}
		if (!signup.hphone.value) {
			alert("핸드폰 번호를 입력해주세요.");
			document.signup.hphone.focus();
			return false;
		}
		if (!signup.gender.value) {
			alert("성별을 체크해주세요.");
			return false;
		}
		if (!signup.registration_date.value) {
			alert("생년월일을 체크해주세요.");
			document.signup.registration_date.focus();
			return false;
		}
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

		//중복검사
		if (list.id_check_value.value == "-1") {
			alert("먼저 아이디 중복검사를 하셔야 합니다.");
			return false;
		} else if (list.id_check_value.value == "0") {
			alert("이미 존재하는 아이디 입니다. 다시 중복검사를 해주세요.");
			return false;
		}
		if (list.nickName_check_value.value == "-1") {
			alert("먼저 닉네임 중복검사를 하셔야 합니다.");
			return false;
		} else if (list.nickName_check_value.value == "0") {
			alert("이미 존재하는 닉네임 입니다. 다시 중복검사를 해주세요.");
			return false;
		}

		if (registration_date == "") {
			alert("회원가입란을 모두 입력해주세요.");
			return false;
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/view/MemberShip/Login.jsp"></c:import>
	<c:import url="/WEB-INF/view/MemberShip/header.jsp"></c:import>


	<section class="section section-padded">

		<div class="container">
			<div class="row">
				<div class=".col-md">
					<h4 class="entry-title">회원가입</h4>
					<hr>
					<br>

					<form class="form-horizontal" action="Insert.do" method="post"
						name="signup" id="signup"
						onsubmit="return membership_check(this);">


						<div class="form-group">
							<label class="control-label col-sm-3"><span
								class="text-danger">*&nbsp;</span>아이디 </label>
							<div class="col-md-5 col-sm-9">
								<input type="text" class="form-control" name="mem_Id"
									id="mem_Id" placeholder="아이디를 입력해주세요.">
									
							</div>

								<div class="col-xs-offset-7">
									<input type="button" class="btn btn-check" value="중복검사" id="id_check_button" name="id_check_button"
										onclick="Form_id_check()">
										<input type="hidden" value="-1" id="id_check_value" name="id_check_value">
								</div>
							
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3"><span
								class="text-danger">*&nbsp;</span>닉네임 </label>
							<div class="col-md-5 col-sm-9">
								<input type="text" class="form-control" name="nickName"
									id="nickName" placeholder="닉네임을 입력해 주세요." value="">
							</div>
							
								<div class="col-xs-offset-7">
									<input type="button" class="btn btn-check" value="중복검사"
										id="nickName_check_button" name="nickName_check_button"
										onclick="Form_nickName_check()">
										<input type="hidden" value="-1" id="nickName_check_value" name="nickName_check_value">
								</div>
							
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">이메일</label>
							<div class="col-md-5 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon membership"> <i
										class="glyphicon glyphicon-envelope"></i></span> <input
										type="email" class="form-control" name="email" id="email"
										placeholder="이메일을 입력해주세요." value="">
								</div>

							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-sm-3"> 핸드폰 번호 </label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon membership"> <i
										class="glyphicon glyphicon-phone"></i></span> <input
										type="text" class="form-control" name="hphone" id="hphone"
										placeholder="핸드폰 번호를 입력해주세요." value="">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">성 별</label>
							<div class="col-md-8 col-sm-9">
								<label> <input name="gender" id="gender" type="radio"
									value="0"> Male
								</label>     <label> <input name="gender" id="gender"
									type="radio" value="1"> Female
								</label>
							</div>
						</div>

						<!-- 	style="margin-top:70px;" -->
						<div class="form-group registration-date">
							<label class="control-label col-sm-3" for="registration-date">생년월일</label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group registration-date-time">
									<span class="input-group-addon membership" id="basic-addon1"> <span
										class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
									<input class="form-control" name="registration_date"
										id="registration-date" type="date">
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-sm-3"> <span
								class="text-danger">*&nbsp;</span> 비밀번호
							</label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon membership"><i
										class="glyphicon glyphicon-lock"></i></span> <input
										type="password" class="form-control" name="passwd" id="passwd"
										placeholder="비밀번호를 입력해주세요." value="">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3"><span
								class="text-danger">*&nbsp;</span>비밀번호 확인 </label>
							<div class="col-md-5 col-sm-7">
								<div class="input-group">
									<span class="input-group-addon membership"> <i
										class="glyphicon glyphicon-lock"></i></span> <input
										type="password" class="form-control" name="passwd_2"
										id="passwd_2" placeholder="비밀번호를 다시 확인해주세요." value="">
								</div>
							</div>

						</div>


						<div class="form-group">
							<br>
							<div class="col-xs-offset-9">
								<input name="JoinCheck" type="submit" value="회원가입"
									class="btn btn-danger" onclick="JoinCheck()">
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>



	<c:import url="/WEB-INF/view/MemberShip/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/MemberShip/script.jsp"></c:import>
	<!-- Scripts -->
</body>

</html>