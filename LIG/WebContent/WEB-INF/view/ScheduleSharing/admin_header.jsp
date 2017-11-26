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
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			
			<a class="navbar-brand" href="<c:url value='/Main/index.do' />">
			
			<!-- 회사 홈페이지 로고 하이퍼링크-->			
			<img src="<c:url value='/img/logo/${logo[0].filename}'/>" data-active-url="<c:url value='/img/logo/${logo[1].filename}'/>" alt="" ></a>
				
			
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right main-nav">
				<li><a href="<c:url value='/destination/index.do' />">여행지
						보기</a></li>
				<li><a href="<c:url value='/ScheduleSharing/PreScheduleSharingList.do' />">일정공유</a></li>
				<li><a href="<c:url value='/QuestionBoard/qboardlist.do' />">Q & A</a></li>
				<li><a href="<c:url value='/HomePageManagement/index.do' />">홈페이지관리</a></li>
				<li><a href="<c:url value='/MemberManagement/index.do' />">회원관리</a></li>
				<li><a href="<c:url value='/Statistiques/index.do'/>">통계</a></li>
				<li><a href="<c:url value='/Login/logout.do'/>"
							class="btn btn-white-fill">로그아웃</a></li>
			</ul>
	
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>