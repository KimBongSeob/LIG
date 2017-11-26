<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<script>
	function list(page) {
		location.href = "${path}/QuestionBoard/qboardlist.do?curPage=" + page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
	function check_href_write() {
		var check = "<%=nickname%>"
		if(check != "null"){
			document.location.href='/LIG/QuestionBoard/qboardwrite.do';
		}else{
			alert("먼저 로그인을 하셔야 됩니다.");
		}
	}
</script>
<c:import url="/WEB-INF/view/MyPage/head.jsp"></c:import>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/boardlist.css' />">
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

							<li role="presentation" class="active"><a onclick="javascript:document.location.href='<c:url value='/myPage/index.do'/>'" 
							aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-calendar"></i>
									<span onclick="">일정조회</span></a></li>
									
							<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
								aria-controls="profile" role="tab" data-toggle="tab"> <i class="fa fa-users" aria-hidden="true" ></i> 
									<span onclick="">일정공유</span></a></li>
									
							<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
								aria-controls="messages" role="tab" data-toggle="tab"> <i
									class="glyphicon glyphicon-list-alt" style="display: inline-block;"></i>  
									<span>Q & A 게시판</span></a></li>
						


						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							

								<div role="tabpanel" class="tab-pane" id="home"></div>
								<div role="tabpanel" class="tab-pane" id="profile"></div>
								<div role="tabpanel" class="tab-pane active" id="messages">
									<section class="section section-padded">
		<center><h3> My Q&A 목록</h3> 
		<br/>
		
		<table class="mytable" border="1" cellpadding="0" cellspacing="0" id="myTable">
			<thead>
				<tr>
					<th style="text-align:center" width="100px">번호</th>
					<th style="text-align:center" width="500px">제목</th>
					<th style="text-align:center" width="130px">답변상태</th>
					<th style="text-align:center" width="100px">작성자</th>
					<th style="text-align:center" width="100px">작성일</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row" begin="" varStatus="status">
							<tr>
								<td align="center">${row.r }</td>
								
								<td align="center"><a href="/LIG/QuestionBoard/qboarddetail.do?num=${row.board_num}">
									<c:if test="${row.re_level > 0}">
												<img src="/LIG/img/board/level.gif"
													width="${60 * row.re_level}" height="16">
												<img src="/LIG/img/board/re.gif">
											</c:if> 
											<c:if test="${row.re_level ==0}">
												<img src="/LIG/img/board/level.gif"
													width="${60 * row.re_level}" height="16">
												
											</c:if> 
									${row.subject}</a></td>
								<td align="center"><c:if test="${complete_Re[row.ref] == '0'}">답변 대기</c:if><c:if test="${complete_Re[row.ref] == '1'}">답변 완료</c:if></td>
								<td align="center">${row.writer}</td>
								<td align="center"><fmt:formatDate value="${row.regdate}" type="date" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						<!-- List로 뽑아온 것은 본래 이름.인덱스번호  로 뽑아와야 되지만 위 코드는 row라는이름에 하나의 글정보씩가져오는것이므로 
                    이름.프로퍼티명으로 접근이 가능한것. -->
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center" colspan="5">작성된 Q&A가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		</center>
		<br/>
		<input type="button" style="margin-left:830px"class="a btn-orange-fill" id="write" value="글쓰기"
		onclick="check_href_write()">
		<div align="center">
							<div class="#" id="#">
								<ul class="pagination" id="pagenation">
								<c:if test="${count > 0}">
									<c:set var="pageCount"
										value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
									<c:set var="pageBlock" value="${10}" />
									<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
									<c:set var="startPage" value="${result * 10 + 1}" />
									<c:set var="endPage" value="${startPage + pageBlock-1}" />
									<c:if test="${endPage > pageCount}">
										<c:set var="endPage" value="${pageCount}" />
									</c:if>

									<c:if test="${startPage > 10}">
										<li class="paginate_button previous" aria-controls="dataTables-example">
										<a href="qboardlist.do?pageNum=${startPage - 10 }">[이전]</a>
										</li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>										
											<c:when test="${i == currentPage}">
												<li class="paginate_button active" aria-controls="dataTables-example">
													<a href="qboardlist.do?pageNum=${i}">${i}</a>
												</li>
											</c:when>
										<c:otherwise>
											<li class="paginate_button" aria-controls="dataTables-example">
												<a href="qboardlist.do?pageNum=${i}">${i}</a>										
											</li>
										</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:if test="${endPage < pageCount}">
										<li class="paginate_button next" aria-controls="dataTables-example">
										<a href="qboardlist.do?pageNum=${startPage + 10}">[다음]</a>
										</li>
									</c:if>
								</c:if>
							</ul>
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
			
		</c:when>
		<c:otherwise>
			<section id="sideMenu" class="section section-padded">
		<div class="row text-center title">
			<div class="col-lg-12 mypageDiv">
				<div class="mypageSubDiv">
					<!-- Nav tabs -->
					<div class="card">
						<ul class="nav nav-tabs" role="tablist">

								<li role="presentation"><a onclick="location.href='/LIG/myPage/index.do';"
									aria-controls="home" role="tab" data-toggle="tab"><i
										class="fa fa-calendar"></i> <span>일정조회</span></a></li>
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
									aria-controls="profile" role="tab" data-toggle="tab"> <i
										class="fa fa-users" aria-hidden="true"></i> <span onclick="">일정공유</span></a></li>
								<li role="presentation" class="active"><a href="#messages"
									aria-controls="messages" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-list-alt"></i>  <span>Q & A
											게시판</span></a></li>
								<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/member_view.do'/>'"
									aria-controls="settings" role="tab" data-toggle="tab"> <i
										class="glyphicon glyphicon-user" aria-hidden="true"></i>  <span>개인정보
											조회</span></a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							

								<div role="tabpanel" class="tab-pane" id="home"></div>
								<div role="tabpanel" class="tab-pane" id="profile"></div>
								<div role="tabpanel" class="tab-pane active" id="messages">
									<section class="section section-padded">
		<center><h3> My Q&A 목록</h3> 
		<br/>
		
		<table class="mytable" border="1" cellpadding="0" cellspacing="0" id="myTable">
			<thead>
				<tr>
					<th style="text-align:center" width="100px">번호</th>
					<th style="text-align:center" width="500px">제목</th>
					<th style="text-align:center" width="130px">답변상태</th>
					<th style="text-align:center" width="100px">작성자</th>
					<th style="text-align:center" width="100px">작성일</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row" begin="" varStatus="status">
						<c:set var="data" value="${number-status.index}"></c:set>
							<tr>
								<td align="center">${data }</td>
								
								<td align="center"><a href="/LIG/QuestionBoard/qboarddetail.do?num=${row.board_num}">
									<c:if test="${row.re_level > 0}">
												<img src="/LIG/img/board/level.gif"
													width="${60 * row.re_level}" height="16">
												<img src="/LIG/img/board/re.gif">
											</c:if> 
											<c:if test="${row.re_level ==0}">
												<img src="/LIG/img/board/level.gif"
													width="${60 * row.re_level}" height="16">
												
											</c:if> 
									${row.subject}</a></td>
								<td align="center"><c:if test="${complete_Re[row.ref] == '0'}">답변 대기</c:if><c:if test="${complete_Re[row.ref] == '1'}"><a href="/LIG/QuestionBoard/qboarddetail.do?num=${complete_Re_href[row.ref]}" >답변 완료</a></c:if></td>
								<td align="center">${row.writer}</td>
								<td align="center"><fmt:formatDate value="${row.regdate}" type="date" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						<!-- List로 뽑아온 것은 본래 이름.인덱스번호  로 뽑아와야 되지만 위 코드는 row라는이름에 하나의 글정보씩가져오는것이므로 
                    이름.프로퍼티명으로 접근이 가능한것. -->
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center" colspan="5">작성된 Q&A가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		</center>
		<br/>
		<input type="button" style="margin-left:830px"class="a btn-orange-fill" id="write" value="글쓰기"
		onclick="check_href_write()">
		<div align="center">
							<div class="#" id="#">
								<ul class="pagination" id="pagenation">
								<c:if test="${count > 0}">
									<c:set var="pageCount"
										value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
									<c:set var="pageBlock" value="${10}" />
									<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
									<c:set var="startPage" value="${result * 10 + 1}" />
									<c:set var="endPage" value="${startPage + pageBlock-1}" />
									<c:if test="${endPage > pageCount}">
										<c:set var="endPage" value="${pageCount}" />
									</c:if>

									<c:if test="${startPage > 10}">
										<li class="paginate_button previous" aria-controls="dataTables-example">
										<a href="qboardlist.do?pageNum=${startPage - 10 }">[이전]</a>
										</li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>										
											<c:when test="${i == currentPage}">
												<li class="paginate_button active" aria-controls="dataTables-example">
													<a href="qboardlist.do?pageNum=${i}">${i}</a>
												</li>
											</c:when>
										<c:otherwise>
											<li class="paginate_button" aria-controls="dataTables-example">
												<a href="qboardlist.do?pageNum=${i}">${i}</a>										
											</li>
										</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:if test="${endPage < pageCount}">
										<li class="paginate_button next" aria-controls="dataTables-example">
										<a href="qboardlist.do?pageNum=${startPage + 10}">[다음]</a>
										</li>
									</c:if>
								</c:if>
							</ul>
						</div>
					</div>
					
	</section>
								
								</div>
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
