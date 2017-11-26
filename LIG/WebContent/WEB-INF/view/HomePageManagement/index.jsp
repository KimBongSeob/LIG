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
<c:import url="/WEB-INF/view/HomePageManagement/head.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/view/HomePageManagement/header.jsp"></c:import>

	<section class="section section-padded">

		<div class="container">
			<div class="page-header">
				<h4>
					홈페이지 관리<span class="pull-right label label-default"></span>
				</h4>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel with-nav-tabs panel-default">
						<div class="panel-heading">
							<ul class="nav nav-tabs logo" style="margin-top:5px; margin-bottom: -10px;">
								<li class="active"><a href="#tab1default" data-toggle="tab">로고 수정</a></li>
								<li><a href="#tab2default" data-toggle="tab">메인 페이지 이미지 수정</a></li>
							</ul>
						</div>

						<div class="panel-body">
							<div class="tab-content">

								<!-- 탭1 -->
								<!-- panel with-nav-tabs -->
								<div class="tab-pane fade in active" id="tab1default">
									<br>
									<!-- 로고1 -->
									<form action="submitLogo1.do" method="post"	enctype="multipart/form-data">
										<div class="container">
											<div class="col-md-5">
												<div class="form-group">
													<label>Upload Logo(basic)</label>
													<div class="input-group" style="margin-top:11px;">
														<span class="input-group-btn"> <span class="btn btn-file btn-danger">파일 선택 
															<input type="file" accept="image/png, image/jpeg, image/gif"  id="imgInp" name="report">
														</span>
														</span> 
														<input id='urlname' type="text" class="form-control logo" readonly>
													</div>
													<img id='img-upload'/> <br>
													<button type="submit" class="btn btn-check">제출</button>
													<button id="clear" class="btn btn-check">Clear</button>

												</div>
											</div>
										</div>
									</form>

									<br>
									<!-- 로고2 -->
									<form action="submitLogo2.do" method="post"	enctype="multipart/form-data">
										<div class="container">
											<div class="col-md-5">
												<div class="form-group"  style="margin-top:11px;">
													<label>Upload Logo(hover)</label>
													<div class="input-group">
														<span class="input-group-btn"> 
														<span class="btn btn-file btn-danger">
														파일 선택 <input type="file" accept="image/png, image/jpeg, image/gif" id="imgInp" name="report">
														</span>
														</span> 
														<input id='urlname' type="text" class="form-control logo" readonly>
													</div>
													<img id='img-upload-load' /> <br>
													<button type="submit" class="btn btn-check">제출</button>
													<button id="clear" class="btn btn-check">Clear</button>

												</div>
											</div>
										</div>
									</form>
								</div>


								<!-- 탭2 -->
								<div class="tab-pane fade" id="tab2default">
									<br>
									<!-- 내용2 -->
									<form action="submitMainImg1.do" method="post" enctype="multipart/form-data">
										<div class="container">
											<div class="col-md-5">
												<div class="form-group">
													<label>Upload MainPage_1</label>
													<div class="input-group"  style="margin-top:11px;">
														<span class="input-group-btn"> <span
															class="btn btn-file btn-danger">
															파일 선택 <input type="file" accept="image/png, image/jpeg, image/gif" id="imgInp" name="report">
														</span>
														</span> <input id='urlname' type="text" class="form-control logo" readonly>
													</div>
													<img id='img-upload'/> <br>
													<button type="submit" class="btn btn-check">제출</button>
													<button id="clear" class="btn btn-check">Clear</button>

												</div>
											</div>
										</div>
									</form>

									<br>
									<form action="submitMainImg2.do" method="post" enctype="multipart/form-data">
										<div class="container">
											<div class="col-md-5">
												<div class="form-group">
													<label>Upload MainPage_2</label>
													<div class="input-group" style="margin-top:11px;">
														<span class="input-group-btn"> <span
															class="btn btn-file btn-danger">
											파일 선택 <input type="file" accept="image/png, image/jpeg, image/gif"  id="imgInp" name="report">
														</span>
														</span> <input id='urlname' type="text" class="form-control logo"
															readonly>
													</div>
													<img id='img-upload'/> <br>
													<button type="submit" class="btn btn-check">제출</button>
													<button id="clear" class="btn btn-check">Clear</button>

												</div>
											</div>
										</div>
									</form>


									<br>
									<form action="submitMainImg3.do" method="post" enctype="multipart/form-data">
										<div class="container">
											<div class="col-md-5">
												<div class="form-group" style="margin-top:11px;">
													<label>Upload MainPage_3</label>
													<div class="input-group">
														<span class="input-group-btn"> <span
															class="btn btn-file btn-danger">
														파일 선택<input type="file" accept="image/png, image/jpeg, image/gif" id="imgInp" name="report">
														</span>
														</span> <input id='urlname' type="text" class="form-control logo"
															readonly>
													</div>
													<img id='img-upload'/> <br>
													<button type="submit" class="btn btn-check">제출</button>
													<button id="clear" class="btn btn-check">Clear</button>
												</div>
											</div>
										</div>
									</form>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<c:import url="/WEB-INF/view/HomePageManagement/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/HomePageManagement/script.jsp"></c:import>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>

</html>