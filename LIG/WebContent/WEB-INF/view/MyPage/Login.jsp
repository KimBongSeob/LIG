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
if(session.getAttribute("mem_id") != null){
   id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
   session.setMaxInactiveInterval((60*60)*12);
} 
%>

<%
String result = (String)request.getAttribute("result");
%>

<script>
	function submitContent(form) {
		if (form.id.value == '' || form.pwd.value == '') {
			alert("아이디와 비밀번호를 정확히 입력해 주세요.");
			form.id.focus();
			return false;
		}
	}
</script>

<c:if test="${result == 'false'}">
<script>
alert("아이디와 비밀번호를 정확히 입력해주세요.");
</script>
</c:if>

<!-- 로그인폼 -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>로그인</h1>
			<br>
			<form method="post" action="/LIG/Login/Login.do" onsubmit="return submitContent(this)">
				<input class="login-modal-input" type="text" name="id" placeholder="아이디 "> 
				<input class="login-modal-input" type="password" name="pwd" placeholder="비밀번호"> 
				<input type="submit" name="login" class="login loginmodal-submit" value="Login"> 
			</form>
			
			<!-- <div id="my-signin2"></div> -->
			<input type="button" name="google" class="login loginmodal-button-google" value="Google+" onclick="login()"> 
			<input type="hidden" id="my-signin2">

			<input type="button" name="facebook" class="login loginmodal-button-facebook" value="Facebook" onclick="fblogin()">
			
			<!-- <input type="button" name="naver_id_login" class="button" onclick="naver()">
			<input type="hidden" id="naver_id_login"> -->
			
			<div id="naver_id_login"></div>
			
			<!-- <input type="button" name="twitter" value="Twitter" onclick="twitter_login()"> -->
			
			
			
			<div class="login-help">
					<br><a style="float:right; font-size:14px;" href="/LIG/MemberShip/index.do">회원가입</a>
			</div>
		</div>
	</div>
</div>
<div id="fb-root"></div>
<!-- 로그인폼 -->
<!-- 소셜 Login 연동 부분 script -->
<script src="<c:url value='/js/hello.js'/>"></script>
<script src="<c:url value='/js/naver.js'/>"></script>

<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=122576235130816";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk')); 


function getUserData() {
    FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
        console.log(JSON.stringify(response));
        $("#name").text("이름 : "+response.name);
        $("#email").text("이메일 : "+response.email);
        $("#gender").text("성별 : "+response.gender);
        $("#birthday").text("생년월일 : "+response.birthday);
        $("#id").text("아이디 : "+response.id);
    });
}

function fblogin(){
	FB.login(function(response) {
        if (response.authResponse) {
            access_token = response.authResponse.accessToken; //get access token
            user_id = response.authResponse.userID; //get FB UID
            console.log('첫 로그인 access_token = '+access_token);
            console.log('user_id = '+user_id);
            $("#access_token").text("접근 토큰 : "+access_token);
            $("#user_id").text("FB UID : "+user_id);
        
            //getUserData();
            
            FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
                console.log(JSON.stringify(response));
                $("#name").text("이름 : "+response.name);
                $("#email").text("이메일 : "+response.email);
                $("#gender").text("성별 : "+response.gender);
                $("#birthday").text("생년월일 : "+response.birthday);
                $("#id").text("아이디 : "+response.id);

                var json_data = JSON.stringify(response);
                var token = access_token;
                console.log('페북 로그인 ajax 코드 토큰 = '+access_token);
                var url="<%=cp%>/Login/Login_sns.do";
                $.ajax({
                    type : "post",
                    url : url,
                    data : "json_data="+json_data+"&token="+token,
                    dataType : "json",
                    success : function(args) {
                    	document.location.href="/LIG/Main/index.do";
                    },
                    error : function(e) {
                    }
                 });              
            });
        }
    }, {scope: 'email,public_profile,user_birthday',
        return_scopes: true});
}
  
window.fbAsyncInit = function() {
    //SDK loaded, initialize it
    FB.init({
        appId      : '122576235130816',
        cookie     : true,  // enable cookies to allow the server to access
                // the session
        xfbml      : true,  // parse social plugins on this page
        version    : 'v2.8' // use graph api version 2.8
    });
  
    //check user session and refresh it
    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
            //user is authorized
            //document.getElementById('loginBtn').style.display = 'none';
            console.log('페북 로그인 상태 액세스 토큰 = '+response.authResponse.accessToken);
            getUserData();
        } else {
            //user is not authorized
        }
    });
};
  
//load the JavaScript SDK
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.com/ko_KR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

</script>

<!------------------------------------------------------------------------------------------------------> 

  <script>
    function onSuccess(googleUser) {	
      console.log('사용자 이름 : ' + googleUser.getBasicProfile().getName());
      console.log('사용자 email : ' + googleUser.getBasicProfile().getEmail());
      console.log('사용자 ID : ' + googleUser.getBasicProfile().getId());
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 290,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }

  </script>

  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
  
<!------------------------------------------------------------------------------------------------------> 
  
<script type="text/javascript">
function login(){
	hello.init({
		google: '683494592836-vedqdj0lu7v2kopskqlb9larv9ceculg.apps.googleusercontent.com'
	}
	, {redirect_uri: 'http://localhost:8082/LIG/Main/index.do'});
	
	hello('google').login({scope: 'email'}).then(function(auth) {
		hello(auth.network).api('/me').then(function(r) {
			//console.log(JSON.stringify(auth));
			access_token = auth.authResponse.access_token;
			//console.log(access_token);
			
			//getGoogleMe(); // 로그인 하자마자 바로 사용자 정보 호출한다.
			
			hello('google').api('me').then(
			function(json) {
				//console.log(JSON.stringify(json));
				name = json.name;
	    		email = json.email;
	    		domain = json.domain;
	    		thumbnail = json.thumbnail;
				console.log('name   : ' + name);
	    		console.log('email  : ' + email);
	    		//console.log('domain : ' + domain);
	    		//console.log('thumbnail : ' + thumbnail);
	    		
	    		var json_data = JSON.stringify(json);
	            var token = access_token;
	            console.log('구글 로그인 ajax 코드 토큰 = '+token);
	            var url="<%=cp%>/Login/Login_sns.do";
	            $.ajax({
	                type : "post",
	                url : url,
	                data : "json_data="+json_data+"&token="+token,
	                dataType : "json",
	                success : function(args) {
	                	document.location.href="/LIG/Main/index.do";
	                },
	                error : function(e) {
	                }
	             }); 
	    		
	    		loginComplete();// JSNI에 정의 되어있다.
	    		
			}, 
			function(e) {
	    		console.log('me error : ' + e.error.message);
	    	});
			
		});
	});
}
function getGoogleMe(){
	hello('google').api('me').then(
			function(json) {
				console.log(JSON.stringify(json));
				name = json.name;
	    		email = json.email;
	    		domain = json.domain;
	    		thumbnail = json.thumbnail;
				console.log('name   : ' + name);
	    		console.log('email  : ' + email);
	    		console.log('domain : ' + domain);
	    		console.log('thumbnail : ' + thumbnail);
	    		loginComplete();// JSNI에 정의 되어있다.
			}, 
			function(e) {
	    		console.log('me error : ' + e.error.message);
	    	});
}
function logout(){
	hello('google').logout().then(
			function() {
				console.log('logout');
			},
			function(e) {
				console.log('Signed out error: ' + e.error.message);
	    	});
}
</script>

<!------------------------------------------------------------------------------------------------------>

<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->

<script type="text/javascript">

var naver_id_login = new naver_id_login("NQRKnEswAENdOdpR_GzM", "http://localhost:8082/LIG/Main/index.do");

var state = naver_id_login.getUniqState();

naver_id_login.setButton("green", 3,60);
//naver_id_login.setDomain(".service.com");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();

function naverSignInCallback() {
	// naver_id_login.getProfileData('프로필항목명');
	// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
	console.log(naver_id_login.getProfileData('id'));
	console.log(naver_id_login.getProfileData('name'));
	console.log(naver_id_login.getProfileData('email'));
	console.log(naver_id_login.getProfileData('nickname'));
	console.log(naver_id_login.getAccessToken());
	
	var id = naver_id_login.getProfileData('id');
	var name = naver_id_login.getProfileData('name');
	var email = naver_id_login.getProfileData('email');
	var nickname = naver_id_login.getProfileData('nickname');
	var token = naver_id_login.getAccessToken();
	
	var data = new Object();
	data.id = id;
	data.name = name;
	
	var json_data = JSON.stringify(data);
	console.log(json_data);
    console.log('네이버 로그인 ajax 코드 토큰 = '+token);
    var url="<%=cp%>/Login/Login_sns.do";
    $.ajax({
        type : "post",
        url : url,
        data : "json_data="+json_data+"&token="+token,
        dataType : "json",
        success : function(args) {
        	document.location.href="/LIG/Main/index.do";
        },
        error : function(e) {
        }
     }); 
    
}

// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");




	/* var naver_id_login = new naver_id_login("NQRKnEswAENdOdpR_GzM", "http://localhost:8080/LIG/Main/index.do");

	var state = naver_id_login.getUniqState();
	
	//naver_id_login.setButton("green", 3,60);
	//naver_id_login.setDomain(".service.com");
	
	
	var nil_state = naver_id_login.setState(state);
	var nil_pop = naver_id_login.setPopup();
	var nil_init = naver_id_login.init_naver_id_login();
	
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		console.log(naver_id_login.getProfileData('id'));
		console.log(naver_id_login.getProfileData('name'));
		console.log(naver_id_login.getProfileData('email'));
		console.log(naver_id_login.getProfileData('nickname'));
	}
	
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()"); */

	
</script>