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

<c:import url="/WEB-INF/view/MemberManagement/head.jsp"></c:import>

</head>

<body>
	<c:import url="/WEB-INF/view/MemberManagement/header.jsp"></c:import>
	<script type="text/javascript">
      /* 전체/부분 체크  */
      $(document).ready(function() {
         $('#checkall').on('click', function() {
            if ($("#mytable #checkall").is(':checked')) {
               $("#mytable input[type=checkbox]").each(function() {
                  $(this).prop("checked", true);
               });

            } else {
               $("#mytable input[type=checkbox]").each(function() {
                  $(this).prop("checked", false);
               });
            }
         });
      });
   </script>

	<script type="text/javascript">
   /* Del_btn */
     $(function(){   
   			$("#Del_btn").click(function(){ 
            
        var rowData = new Array(); 
        var tdArr = new Array();
        var checkbox = $("input[name=RowCheck]:checked");
        checkbox.each(function(i) {
        	 var tr = checkbox.parent().parent().eq(i);
             var td = tr.children();
             /* td.eq(2).text()는 현재 member id */
             tdArr.push(td.eq(2).text());
        });
          
      
        var url="<%=cp%>/MemberManagement/All_Delbtn.do";
		jQuery.ajaxSettings.traditional = true; //배열 형태로 서버쪽 전송을 위한 설정

								$.ajax({    type : "post",
											url : url,
											data : "tdArr=" + tdArr,
											dataType : "json",
											success : function(args) {
												var size = args.size;
												var number = args.number;
												var pageBlock = args.pageBlock;
												var startPage = args.startPage;
												var endPage = args.endPage;
												var pageCount = args.pageCount;

												$("#member_all_count").empty();
												$("#member_all_count").append("(전체 회원 수: "+ args.data.length+ " )");
												$("#memberDiv > table > tbody").empty(); //전체삭제				         

												if (pageCount > 0) {
													for (var i = 0; i < args.data.length; i++) {
														if (args.data[i].gender == "0") {
															args.data[i].gender = "남자"
														} else {
															args.data[i].gender = "여자"
														}
														$("#memberDiv > table > tbody").append("<tr data-status=\"pending\"><td><input type=\"checkbox\" class=\"checkthis\" name=\"RowCheck\" /></td><td>"
																				+ (number - i)+ "</td><td>"+ args.data[i].mem_Id+ "</td><td>"+ args.data[i].nickName+ "</td><td>"+ args.data[i].email
																				+ "</td><td>"+ args.data[i].gender+ "</td><td>"+ args.data[i].jumin+ "</td><td>"+ args.data[i].hphone+ "</td></tr>");
													}
												}
											},
											error : function(e) {
												alert(e.responseText);
											}
										}); //ajax
							});
		});
	</script>




	<section class="section section-padded">
		<br>
		<div class="container">
			<div class="row">
				<span id="member_all_count">(전체 회원 수: ${count1} )</span>
				<%-- <div class="panel panel-default panel-table" ></div> --%>
				<div class="col-md-20 col-md-offset-0">
					<div class="panel panel-default panel-table align-center">
						<div class="panel-heading">
							<div class="row">
								<div class="pull-right">
									<form>
										<select name="searchn">
											<option value="0">아이디</option>
											<option value="1">닉네임</option>
											<option value="2">핸드폰 번호</option>
										</select> <input type="text" name="search" size="15" maxlength="50" />
										<input type="submit" value="검색" /> &nbsp; &nbsp; &nbsp;
										&nbsp;
									</form>
								</div>
								<div class="col col-xs-4">
									<h4>회원정보</h4>

								</div>
							</div>
						</div>

						<div class="panel-body text-center" id="memberDiv">
							<table id="mytable"
								class="table table-striped table-bordered table-list text-center ">
								<thead>
									<tr>
										<th class="col-check"><div class="text-center">
												<input type="checkbox" id="checkall" />
											</div></th>
										<th><div class="text-center">No</div></th>
										<th><div class="text-center">아이디</div></th>
										<th><div class="text-center">닉네임</div></th>
										<th><div class="text-center">이메일</div></th>
										<th><div class="text-center">성별</div></th>
										<th><div class="text-center">생년월일</div></th>
										<th><div class="text-center">핸드폰번호</div></th>

									</tr>
								</thead>


								<tbody>

									<c:forEach var="list" items="${list}" begin=""
										varStatus="status">
										<tr data-status="pending">
											<td><input type="checkbox" class="checkthis"
												name="RowCheck" /></td>
											<c:set var="data" value="${number-status.index}"></c:set>

											<td>${data}</td>
											<td>${list.mem_Id}</td>
											<td>${list.nickName}</td>
											<td>${list.email}</td>
											<c:choose>
												<c:when test="${list.gender == '0' }">
													<td>남자</td>
												</c:when>
												<c:when test="${list.gender == '1' }">
													<td>여자</td>
												</c:when>
											</c:choose>

											<td>${list.jumin}</td>
											<td>${list.hphone}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="pull-right">
								<button type="button" id="Del_btn" name="Del_btn"
									class="btn btn-green btn-danger">
									<span
										class="glyphicon glyphicon-trash align-center btn-group-sm"
										aria-hidden="true"></span> &ensp;삭제
								</button>
							</div>


							<div class="panel-footer">
								<div class="row">
									<div class="col col-xs-offset-3 col-xs-6">
										<ul class="pagination">

											<c:if test="${pageCount > 0}">
												<c:if test="${startPage > 5}">
													<a
														href="<c:url value='/MemberManagement/index.do?pageNum=${startPage - 5 }'/>">[이전]&ensp;</a>
												</c:if>

												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<a
														href="<c:url value='/MemberManagement/index.do?pageNum=${i}'/>">[${i}]</a>
												</c:forEach>

												<c:if test="${endPage < pageCount}">
													<a
														href="<c:url value='/MemberManagement/index.do?pageNum=${startPage + 5 }'/>">&ensp;[다음]</a>
												</c:if>
											</c:if>
											<!-- pageNum에 따른 글번호이동 -->
										</ul>
									</div>


									<div class="col col-xs-3">
										<div class="pull-right">

											<form name="pageRanks" action="pageRanks.do">
												<button type="submit" name="excel" class="btn btn-primary">
													<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
													엑셀 다운로드
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>



	<c:import url="/WEB-INF/view/MemberManagement/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/MemberManagement/script.jsp"></c:import>
	<!-- Scripts -->
</body>

</html>