<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="preloader">
		<img src="<c:url value='/img/loader.gif'/>" alt="Preloader image">
	</div>
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/Main/index.do' />">
				<img src="<c:url value='/img/logo/${logo[0].filename}'/>" data-active-url="<c:url value='/img/logo/${logo[1].filename}'/>" alt="" >
				
				</a><!-- 회사 홈페이지 로고 하이퍼링크-->
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
					<li><a href="<c:url value='/destination/index.do' />">여행지 보기</a></li>
					<li><a href="<c:url value='/crgistration/index.do'/>">일정등록</a></li>
					<li><a href="<c:url value='/ScheduleSharing/PreScheduleSharingList.do' />">일정공유</a></li>
					<li><a href="<c:url value='/QuestionBoard/qboardlist.do' />">Q & A</a></li>
<!--                    <li><a href="#services">로그인</a></li>
					<li><a href="#team">회원가입</a></li>-->
					
					<li><a href="<c:url value='/myPage/index.do'/>" class="btn btn-white-fill">마이페이지</a></li>
                    <li><a href="<c:url value='/Login/logout.do'/>"
							class="btn btn-white-fill" onclick="FB.logout();">로그아웃</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
<header id="intro">								
	<div class="IntroContainer">
			<div class="table">
				<div class="header-text">
					<div class="row menu">
						<div class="col-md-12 text-center">
							<h3 class="light white">여유를 가지고 싶을 땐</h3>
							<h1 class="white typed">소중한 사람과 함께 Let it go</h1>
                            <!--<span class="white typed" style="width:1px;word-break:break-all;word-wrap:break-word;"><span>여유를 가지고 싶을 땐</span><div style="width:100px;word-break:break-all;word-wrap:break-word;">text</div></span>-->
							<span class="typed-cursor">|</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 mypageDiv">
					<div class="back"><img src="<c:url value='/img/back2.png'/>"></div>	
		
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
								<a class="a btn-orange-fill form-control" onclick="areaSearch()"> <i class="fa fa-search"
									aria-hidden="true"></i></a>
							</div>



						</div>


					</div>
				</div>
			</div>
			
			<form action="/LIG/Main/mainSearch.do" method="post" id="moveSearchForm" name="moveSearchForm">
				<input type="hidden" id="myItem" name="myItem">
				<input type="hidden" id="alldata" name="alldata">
			</form>
	<!-- Slider main container -->
	<div class="swiper-container main-slider" id="myCarousel">
		<div class="swiper-wrapper">
		<c:forEach var="list" items="${list}" varStatus="status">
			<div class="swiper-slide slider-bg-position"
				style="background: url('../img/MainPage/${list.filename}') " data-hash="slide${status.count}" >			
			</div>

		</c:forEach>
		</div>
		
		
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Navigation -->
		<div class="swiper-button-prev">
			<i class="fa fa-chevron-left"></i>
		</div>
		<div class="swiper-button-next">
			<i class="fa fa-chevron-right"></i>
		</div>
	</div>



</header>

<script>
FB.logout(function(response) {
	  // user is now logged out
	});
</script>