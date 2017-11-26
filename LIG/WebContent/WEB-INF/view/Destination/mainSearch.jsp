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
<c:import url="/WEB-INF/view/Destination/head.jsp"></c:import>

</head>

<body>
	<c:import url="/WEB-INF/view/Destination/Login.jsp"></c:import>
	<c:choose>
		<c:when test="${sessionScope.mem_id != null}">
			<c:choose>
				<c:when test="${sessionScope.mem_id == 'admin'}">
					<c:import url="/WEB-INF/view/Destination/admin_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/view/Destination/login_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/view/Destination/header.jsp"></c:import>
		</c:otherwise>

	</c:choose>



	<section id="sideMenu" class="section section-padded">
		<div class="row text-center title">
			<h2>여행지 보기</h2>
			<h4 class="light muted">떠나고 싶은 여행지를 직접 검색해보세요!</h4>
		</div>


		<div class="row text-center title">
			<!--<div>
					<select class="btn-warning" id="content_m1" name="content_m1">
						<option value="">관광타입선택</option>
					</select>
					<select class="btn-warning" id="area_m1" name="area_m1">
						<option value="">지역선택</option>
					</select>
					<select class="btn-warning" id="area_m2" name="area_m2">
						<option value="">시/군/구 선택</option>
					</select>
					<button class="a btn-orange-fill" type="submit" onclick="areaSearch();">검색</button>
				</div>  -->
			<div class="col-lg-12 mypageDiv">
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
								<a class="a btn-orange-fill form-control"
									onclick="areaSearch();"> <i class="fa fa-search"
									aria-hidden="true"></i></a>
							</div>



						</div>


					</div>
				</div>
			</div>



			<input type='hidden' id="allPage" name="allPage" value="${page}">


			<div class="col-lg-12 mypageDiv" id="areaSearch">
				<div class="mypageSubDiv-8" ${width}>
					<ul class='arearesultUl' id='arearesultUl'>
						<c:forEach var="item" items="${myItem}" varStatus="status">
						<c:choose>
							<c:when test="${status.index % 3 == 0 && status.index != 0}">
								<c:choose>
									<c:when test="${item.firstimage == null }">
										<c:set var="firstimage" value="/LIG/img/unknown.png"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="firstimage" value="${item.firstimage}"></c:set>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${item.addr1 == null }">
										<c:set var="addr1" value=""></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="addr1" value="${item.addr1}"></c:set>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${item.addr2 == null }">
										<c:set var="addr2" value=""></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="addr2" value="${item.addr2}"></c:set>
									</c:otherwise>
								</c:choose>
								<li class='arearesultLi-30 clear'>
									<div class='service'><div class='icon-holder Destination'>
										<img src='${firstimage}' alt='' width='330px' height='200px'></div>
										<a href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${item.contentid}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
											<p class='heading Destination'>${item.title}</p><p class='destination'>${addr1} ${addr2}</p>
										</a>
									</div>
								</li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${item.firstimage == null }">
										<c:set var="firstimage" value="/LIG/img/unknown.png"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="firstimage" value="${item.firstimage}"></c:set>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${item.addr1 == null }">
										<c:set var="addr1" value=""></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="addr1" value="${item.addr1}"></c:set>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${item.addr2 == null }">
										<c:set var="addr2" value=""></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="addr2" value="${item.addr2}"></c:set>
									</c:otherwise>
								</c:choose>
								<li class='arearesultLi-30' ${li_width}>
									<div class='service'><div class='icon-holder Destination'>
										<img src='${firstimage}' alt='' width='330px' height='200px'></div>
										<a href="javascript:window.open('/LIG/destination/areaSearchContent.do?contentid=${item.contentid}','여행지 상세보기','width=850px,height=800px,top=100px,left=100px,resizable=no,scrollbars=yes');">
											<p class='heading Destination'>${item.title}</p><p class='destination'>${addr1} ${addr2}</p>
										</a>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
		<!-- pageNumber area -->
		<div class="row text-center title" id="DestinationPageNumDiv">
			<c:if test="${page > 0}">
				<fmt:parseNumber var="startPage" value ="${startPage}"/>
				<fmt:parseNumber var="pageBlock" value ="${pageBlock}"/>
				<c:if test="${startPage > pageBlock}">
				<script>
					alert("<< 이전");
				</script>
					<a
						onclick="pageSearch('1','${select_data}','${area_m1}','${area_m2}')"
						href="#"><span class='pageNumSize'>[<<]</span></a>
					<a
						onclick="pageSearch('${startPage - pageBlock}','${select_data}','${area_m1}','${area_m2}')"
						href="#"><span class='pageNumSize'>[이전]</span></a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a
						onclick="pageSearch('${i}','${select_data}','${area_m1}','${area_m2}')"
						href="#"><span class='pageNumSize'>[${i}]</span></a>
				</c:forEach>
				<fmt:parseNumber var="endPage" value ="${endPage}"/>
				<fmt:parseNumber var="pageCount" value ="${pageCount}"/>
				<c:if test="${endPage < pageCount}">
					<a
						onclick="pageSearch('${startPage + pageBlock}','${select_data}','${area_m1}','${area_m2}')"
						href="#"><span class='pageNumSize'>[다음]</span></a>
					<a onclick="pageSearch('${page}','${select_data}','${area_m1}','${area_m2}')" href="#"><span class='pageNumSize'>[>>]</span></a>
				</c:if>

			</c:if>
		</div>
	</section>


	<c:import url="/WEB-INF/view/Destination/footer.jsp"></c:import>


	<c:import url="/WEB-INF/view/Destination/script.jsp"></c:import>
	<!-- Scripts -->
</body>

</html>
