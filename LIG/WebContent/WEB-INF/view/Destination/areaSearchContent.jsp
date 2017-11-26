<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/view/Destination/head.jsp"></c:import>
<script>
$(function () {
	$(document).on("click", '#contentTab a[href="#map"]', function() {
		//$('#contentTab a[href="#map"]').tab('show') // Select tab by name
		$("#map_view").css("width","500px");
		$("#map_view").css("height","300px");
		$("#map_view").css("visibility","visible");
		
		//visibility: hidden;
	});
	$(document).on("click", '#contentTab a[href="#outline"]', function() {
		//$('#contentTab a[href="#map"]').tab('show') // Select tab by name
		$("#map_view").css("width","0px");
		$("#map_view").css("height","0px");
		$("#map_view").css("visibility","hidden");
		
	});
	$(document).on("click", '#contentTab a[href="#comment"]', function() {
		//$('#contentTab a[href="#map"]').tab('show') // Select tab by name
		$("#map_view").css("width","0px");
		$("#map_view").css("height","0px");
		$("#map_view").css("visibility","hidden");
		
	});
    
 });
</script>
</head>
<body onload="initialize('${contentdata.mapx}','${contentdata.mapy}')">
	<section id="services" class="section section-padded">
		<div class="row content-px-bottom">
			<div class="col-lg-12">
			<c:choose>
			<c:when test="${contentdata.firstimage != null}" >
				<img  width='50%' height='230px'
					src="${contentdata.firstimage}">
			</c:when>
			<c:otherwise>
				<img  width='50%' height='230px'
					src="/LIG/img/unknown2.png">
			</c:otherwise>
				
			</c:choose>
				<div  style='float: right;width: 45%;'>
					<span class="a btn-orange-fill-default">${cat}</span>
					<h3>${contentdata.title}</h3>
					<br>
					<hr>
					<i class="fa fa-phone" aria-hidden="true"></i>전화번호:
					${contentdata.tel} <br> <i class="xi-home" aria-hidden="true"></i>주소:
					${contentdata.addr1} ${contentdata.addr2}<br><i class="xi-send" aria-hidden="true"></i>홈페이지:
					${contentdata.homepage} <br> <br>

				</div>
			</div>


		</div>
		<div class="container">
			<ul class="nav nav-tabs" role="tablist" id="contentTab">
				<li role="presentation" class="active"><a href="#outline"
					aria-controls="outline" role="tab" data-toggle="tab"><i class="xi-comment"
						aria-hidden="true"></i>개요</a></li>
				<li role="presentation"><a href="#map" aria-controls="map"
					role="tab" data-toggle="tab"><i class="fa fa-map-marker"
						aria-hidden="true"></i>지도</a></li>
				<li role="presentation"><a href="#comment"
					aria-controls="comment" role="tab" data-toggle="tab"><i class="xi-forum"
						aria-hidden="true"></i>후기</a></li>
			</ul>

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="outline">
					<div style="margin-left: 15px;">
						<h3>
							개요<i class="xi-border-color" aria-hidden="true"></i>
						</h3>
						<hr>
						<div class="row">
							<div class="col-lg-12">
								${contentdata.overview} <br>
							</div>
						</div>
					</div>

				</div>
				<div role="tabpanel" class="tab-pane" id="map">
					<div style="margin-left: 15px;">
						<h3>
							지도<i class="xi-compass" aria-hidden="true"></i>
						</h3>
						<hr>
					</div>
					
				</div>
				<div role="tabpanel" class="tab-pane" id="comment">
					<input id='contentid' type='hidden'
						value='${contentdata.contentid}'>
					<div style="margin-left: 15px;">
						<h3>
							후기<i class="xi-message-o" aria-hidden="true"></i>
						</h3>
						<hr>

						<div id='contentList'>
							<c:forEach var='list' items="${contentList}">
				${list.nickname} ${list.sub_sdate} <c:choose><c:when
									test="${list.mem_id == sessionScope.mem_id}">
									<input type="hidden" id="comment_del_value"
										name="comment_del_value" value="${list.id}">
									<input type="button" class="comment-del" id="comment_del"
										name="comment_del" value="x">
								</c:when>
								<c:when test="${sessionScope.mem_id == 'admin'}">
									<input type="hidden" id="comment_del_value"
										name="comment_del_value" value="${list.id}">
									<input type="button" class="comment-del" id="comment_del"
										name="comment_del" value="x">
								</c:when>
								</c:choose>
								<br>${list.contentval}<br>
								<hr>
							</c:forEach>
						</div>
						<%-- 		<c:forEach var='list' items="${contentList}">
		${list.memberid} ${list.sdate} <br>
		<textarea readonly>${list.contentval}</textarea><br>
		
		</c:forEach> --%>
						<div class="row content-px-top">
							<div class="col-xs-8 col-md-6 col-lg-4 vcenter">
								<div>
									<textarea class="input-contents comment-textarea" id='contentsArea' name='contentsArea'></textarea>
								</div>
							</div>
							<div class="col-xs-3 col-lg-3 vcenter-left">
								<button id='contentsButton' name='contentsButton' class='a btn-orange-fill'>댓글등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="map_view" style="width: 500px; height: 300px; margin-left:100px; visibility: hidden;"></div>
	</section>
	<c:if test="${insertCount > 0}">
		<script>
			alert("후기를 등록하였습니다.");
		</script>
	</c:if>
</body>

</html>
