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
<c:import url="/WEB-INF/view/Statistiques/head.jsp"></c:import>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var url="<%=cp%>/stat/statContent.do";
		$.ajax({
			type : "get",
			url : url,
			dataType : "json",
			success : function(args) {
				var myItem = args.data;
				var data=[];
				var data_basicItem = [ 'Task', 'Hours per Day' ];
				data.push(data_basicItem);
				
				for(var i = 0;i < myItem.length;i++){
					var temp=[];
					temp.push(myItem[i].name);
					temp.push(myItem[i].totalCount);
					
					data.push(temp);
				}
				var data_array = google.visualization.arrayToDataTable(data);
				var chart = new google.visualization.PieChart(document.getElementById('piechart'));
				chart.draw(data_array);
				
				
			},
			error : function(e) {
				alert(e.responseText);			
			}
			
		});
	}
</script>

<script type="text/javascript">
/*skills5 */
$('.counter-count').each(function(){
	$(this).prop('Counter',0).animate(
			{Counter:$(this).text()},{duration:5000,easing:'swing',step:function(now){$(this).text(Math.ceil(now))}}
			)
});

		
</script>

</head>
<body>
	<c:import url="/WEB-INF/view/Statistiques/header.jsp"></c:import>

	<section class="section section-padded">

		<div class="container">
			<div class="page-header">
				<h3>통계	</h3>
			</div>
			<br>
			<h5> * 회원 수 정보</h5>
			<div class="row-stat">
			<br><br>
			
					<div class="text-center" style="display: inline-block;">
						<div class="circle-tile text-center ">
							<a href="#">
							<div class="circle-tile-heading dark-blue">
							<i class="fa fa-users fa-fw fa-3x"></i>
								</div></a>
							<div class="circle-tile-content dark-blue">
								<div class="circle-tile-description text-faded">총 회원 수</div>
								<div class="circle-tile-number text-faded ">${count}</div>
							</div>
						</div>
					</div>
					
						<div class="text-center" style="display: inline-block;">
						<div class="circle-tile ">
							<a href="#">
							<div class="circle-tile-heading dark-blue">
							<i class="fa fa-male fa-fw fa-3x"></i>
								</div></a>
							<div class="circle-tile-content dark-blue">
								<div class="circle-tile-description text-faded">남자 회원 수</div>
								<div class="circle-tile-number text-faded ">${count_m}</div>
							</div>
						</div>
					</div>
					
						<div class="text-center" style="display: inline-block;">
						<div class="circle-tile ">
							<a href="#">
							<div class="circle-tile-heading dark-blue">
							<i class="fa fa-female fa-fw fa-3x"></i>
								</div></a>
							<div class="circle-tile-content dark-blue">
								<div class="circle-tile-description text-faded">여자 회원수 </div>
								<div class="circle-tile-number text-faded ">${count_w}</div>
							</div>
						</div>
					</div>				
				</div>
				
				
			<br> <br><br><br><br>
			<div class="row">
					<div class="col-md-15 col-sm-12"><h5> * 로그인 비율 데이터</h5>
						<div id="" style="width: 900px; height: 300px;" >
						<br>
							<div class="chart-horiz">
          	<!-- Actual bar chart -->
         						 <ul class="chart">
          							<li class="title" title="로그인 비율"></li><br>
          							<span>총 로그인 횟수</span><li class="current" ><span class="bar" data-number="${count_login_sum}"></span><span class="number">${count_login_sum}</span></li>
									<span>일반 로그인 횟수</span><li class="past" ><span class="bar" data-number="${count_login_Nomal}"></span><span class="number">${count_login_Nomal}</span></li>
									<span>소셜 로그인 횟수</span><li class="sns" ><span class="bar" data-number="${count_login_Sns}"></span><span class="number">${count_login_Sns}</span></li>
        						 </ul>
        					</div>		
						</div>
					</div>
				</div>
			<h5> * 회원들이 공유한 인기여행지 TOP5</h5>
						<div class="panel-body text-center" id="memberDiv">
							<table id="mytable"
								class="table table-striped table-bordered table-list text-center ">
								<thead>
									<tr>
										<th><div class="text-center">인기 여행지 순위</div></th>
										<th><div class="text-center">여행지</div></th>
										<th><div class="text-center">공유게시물수</div></th>
									</tr>
								</thead>			
			<tbody>

									<c:forEach var="count_v5" items="${count_v5}" begin="" varStatus="status">										
											<td>${status.count}</td>
											<td>${count_v5.dest_name}</td>
											<td>${count_v5.c}</td>
											</tr>
									</c:forEach>
								</tbody>
			</table>
			</div>
		
				<br><br><br>
				<div class="row">
					<div class="col-md-15 col-sm-12"><h5> * 여행지 비율 데이터</h5>
						<div id="piechart" style="width: 900px; height: 500px;" ></div>
					</div>
				</div>

</div>


	</section>

	<c:import url="/WEB-INF/view/Statistiques/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/Statistiques/script.jsp"></c:import>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>

</html>