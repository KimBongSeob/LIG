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


<c:import url="/WEB-INF/view/MyPage/ScheduleSharing/head.jsp"></c:import>

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

		<br>
		<h1 class="row skew-title text-center">
			<span>L</span><span>E</span><span>T</span><span>I</span><span>T</span><span>G</span><span>O</span><span
				class="last">와</span>   <span class="alt">일</span><span class="alt">정</span><span
				class="alt">공</span><span class="alt">유</span><span class="alt">하</span><span
				class="alt last">기</span>
		</h1>








		<!-- pageNumber area -->
		<form action='/LIG/mypage/mySharing.do' method='post'
			onsubmit="return addCheck(this);">
			<div class="card">
				<div class="container-fliud">
					<div class="wrapper row">

						<div class="col-lg-12 mypageDiv-notmargin">
							<div class="mypageSubDiv-6">
								<div class="form-group">
									<div class="">
										<div style="display: inline-block; margin-left: 17px;">
											<span class="col-md-6 font-base"><h3>제목</h3></span><span
												class="col-lg-12"><input class="input-subject"
												type='text' id='subject' name='subject' /></span>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 mypageDiv-notmargin">
							<div class="mypageSubDiv-6">
								<div class="form-group">
									<div class="">
										<div style="display: inline-block;">
											<span class="font-base"><h5>작성자</h5></span>
										</div>
										<div style="display: inline-block; margin-left: 17px;">
											<input class="input-nickname" type='text' id='mem_id'
												name='mem_id' value="<%=nickname%>" readonly />
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="col-lg-12 mypageDiv-notmargin">
							<div class="mypageSubDiv-6">
								<div class="form-group">
									<div class="">
										<div style="display: inline-block; margin-left: 17px;">
											<span class="col-md-7 font-base"><h3>여행 테마</h3></span>
											<textarea class="input-contents" id='share_content'
												name='share_content' style="overflow: hidden; resize: none;"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>

			
			<div class="col-lg-12 mypageDiv">
				<div class="mypageSubDiv-8">
					<div class="form-group">
						<div class="">

							<div style="display: inline-block; margin-left: 17px;">
								<label class="font-base"><h3>Start Date</h3></label>
								<input class="form-control" id="sdate_value" name="sdate_value" placeholder="날짜를 선택해주세요." type="text"  value="${dto[0].start_date}" readonly />
							</div>
							<div style="display: inline-block; margin-left: 30px;">
								<a class="a btn-orange-fill form-control" id="date-start"><i
									class="fa fa-calendar"></i></a>
							</div>
							<div style="display: inline-block; margin-left: 17px;">
								<label class="font-base"><h3>End Date</h3></label>
								<input class="form-control" id="edate_value" name="edate_value" placeholder="날짜를 선택해주세요." type="text" value="${dto[0].end_date}" readonly />
							</div>
							<div style="display: inline-block; margin-left: 30px;">
								<a class="a btn-orange-fill form-control" id="date-end"><i
									class="fa fa-calendar"></i></a>
							</div>
						</div>
					</div>

				</div>
			</div>
			
			
			<div id="tmp_div">
			</div>
			
			<div id="i_div">
			</div>
			<!-- 일차 영역 -->
			<div class="row">
				<div class="col-lg-12 mypageDiv">
					<div class="mypageSubDiv-5">
						<div class="form-group">
							<input type='hidden' id='plusCount' name='plusCount' value='${size}'>
							<div id='plusDiv'>
							<c:forEach var="list" items="${dto}" varStatus="status">
								<div id='plusDivSub' class='col-lg-4' name='plusDivSub'>
									<table class="table table-hover test">
										<thead>
											<tr>
												<th><span class="font-base">${status.count}일차</span></th>
											</tr>
										</thead>
										<tbody>
											<input type='hidden' id='divCount' value='${status.count}'>
											<tr>
												<td data-toggle="modal" data-target="#myModal">${list.dest_name_1}</td>
												<input type='hidden' value='${list.dest_id_1}' name='Destination'>
												<input type='hidden' value='${list.basic_addr_1}'>
												<input type='hidden' value='${list.detail_addr_1}'>
												<input type='hidden' value='${list.code_content_1}'>
												<input type='hidden' value='${list.code_area1}'>
												<input type='hidden' value='${list.code_sigungu_1}'>
											</tr>
											<tr>
											<c:if test="${list.dest_name_2 != null}">
												<td data-toggle="modal" data-target="#myModal">${list.dest_name_2}</td>
												<input type='hidden' value='${list.dest_id_2}' name='Destination'>
												<input type='hidden' value='${list.basic_addr_2}'>
												<input type='hidden' value='${list.detail_addr_2}'>
												<input type='hidden' value='${list.code_content_2}'>
												<input type='hidden' value='${list.code_area2}'>
												<input type='hidden' value='${list.code_sigungu_2}'>
											</c:if>
											<c:if test="${list.dest_name_2 == null}">
												<td data-toggle="modal" data-target="#myModal">&nbsp;</td>
												<input type='hidden' value='' name='Destination'>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
											</c:if>
											</tr>
											<tr>
											<c:if test="${list.dest_name_3 != null}">
												<td data-toggle="modal" data-target="#myModal">${list.dest_name_3}</td>
												<input type='hidden' value='${list.dest_id_3}' name='Destination'>
												<input type='hidden' value='${list.basic_addr_3}'>
												<input type='hidden' value='${list.detail_addr_3}'>
												<input type='hidden' value='${list.code_content_3}'>
												<input type='hidden' value='${list.code_area3}'>
												<input type='hidden' value='${list.code_sigungu_3}'>
											</c:if>
											<c:if test="${list.dest_name_3 == null}">
												<td data-toggle="modal" data-target="#myModal">&nbsp;</td>
												<input type='hidden' value='' name='Destination'>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
											</c:if>
											
											</tr>
											<tr>
											<c:if test="${list.dest_name_4 != null}">
												<td data-toggle="modal" data-target="#myModal">${list.dest_name_4}</td>
												<input type='hidden' value='${list.dest_id_4}' name='Destination'>
												<input type='hidden' value='${list.basic_addr_4}'>
												<input type='hidden' value='${list.detail_addr_4}'>
												<input type='hidden' value='${list.code_content_4}'>
												<input type='hidden' value='${list.code_area4}'>
												<input type='hidden' value='${list.code_sigungu_4}'>
											</c:if>
											<c:if test="${list.dest_name_4 == null}">
												<td data-toggle="modal" data-target="#myModal">&nbsp;</td>
												<input type='hidden' value='' name='Destination'>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
											</c:if>
											</tr>
											<tr>
											<c:if test="${list.dest_name_5 != null}">
												<td data-toggle="modal" data-target="#myModal">${list.dest_name_5}</td>
												<input type='hidden' value='${list.dest_id_5}' name='Destination'>
												<input type='hidden' value='${list.basic_addr_5}'>
												<input type='hidden' value='${list.detail_addr_5}'>
												<input type='hidden' value='${list.code_content_5}'>
												<input type='hidden' value='${list.code_area5}'>
												<input type='hidden' value='${list.code_sigungu_5}'>
											</c:if>
											<c:if test="${list.dest_name_5 == null}">
												<td data-toggle="modal" data-target="#myModal">&nbsp;</td>
												<input type='hidden' value='' name='Destination'>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
												<input type='hidden' value=''>
											</c:if>
											</tr>
										</tbody>
									</table>
								</div>
								
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="areaSelect"> <input type="hidden"
				id="areaSelectTr"> <input type="hidden" id="allValues"
				name="allValues" value="${result}">
			<div class='row'>
				<div class='col-lg-12'>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-fullsize">

							<!-- Modal content-->
							<div class="modal-content modal-fullsize">
								<div class="modal-header">

									<h4 class="modal-title">
										여행지 검색<span style='float: right;'><button
												class="btn btn-orange-fill" data-dismiss="modal">&times;</button></span>
									</h4>

								</div>
								<div class="modal-body">

									<div class="col-lg-12 mypageDiv">
										<div class="mypageSubDiv-7">
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
														<a class="a btn-orange-fill form-control"
															onclick="areaSearch_Modal();"> <i class="fa fa-search"
															aria-hidden="true"></i></a>
													</div>



												</div>


											</div>
										</div>
									</div>


									<input type='hidden' id="allPage" name="allPage">
									<div class='row'>
										<div class='col-lg-12'>
											<div id="areaSearch">
												<ul class='arearesultUl' id='arearesultUl'></ul>
											</div>
										</div>
										<!-- pageNumber area -->
										<div class="row text-center title" id="pageNumDiv"></div>
									</div>

								</div>
								<div class="modal-footer">
									<button id="close_button" type="button"
										class="btn btn-orange-fill" data-dismiss="modal">취소</button>

								</div>
							</div>
						</div>

					</div>


				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 mypageDiv">
					<div class="mypageSubDiv-8">
						<div class='col-lg-2' style='float: right;'>

							<button type="submit" class="a btn-orange-fill">등록</button>

						</div>
					</div>
				</div>
			</div>

		</form>
	</section>

	<c:import url="/WEB-INF/view/MyPage/ScheduleSharing/footer.jsp"></c:import>


	<c:import url="/WEB-INF/view/MyPage/ScheduleSharing/script.jsp"></c:import>
	<!-- Scripts -->
	<script>
		(function() {
			$('.skew-title').children('span').hover(function() {
				var $el, n;
				$el = $(this);
				n = $el.index() + 1;
				$el.addClass('flat');
				if (n % 2 === 0) {
					return $el.prev().addClass('flat');
				} else {
					if (!$el.hasClass('last')) {
						return $el.next().addClass('flat');
					}
				}
			}, function() {
				return $('.flat').removeClass('flat');
			});
		}.call(this));
	</script>

</body>
</html>
