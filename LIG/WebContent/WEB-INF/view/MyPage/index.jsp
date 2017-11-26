<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String id = null;
	String nickname = null;
	String token = null;
	if(session.getAttribute("mem_id")==null)response.sendRedirect(request.getContextPath()+"/Main/index.do");
	
	if (session.getAttribute("mem_id") != null) {
		id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
	}
	if (session.getAttribute("nickname") != null) {
		nickname = (String) session.getAttribute("nickname");// 로그인 정보 가져오기.
	}
	if (session.getAttribute("access_token") != null) {
		token = (String) session.getAttribute("access_token");
		//System.out.println("마이페이지 액세스 토큰::"+token);
	}
	session.setMaxInactiveInterval((60 * 60) * 12);
%>


<html>
<head>
<c:import url="/WEB-INF/view/MyPage/head.jsp"></c:import>



<link type="text/css" rel='stylesheet'
	href='/LIG/css/fullcalendar.min.css'>
<link type="text/css" rel='stylesheet' media='print'
	href='/LIG/css/fullcalendar.print.css'>
<script type="text/javascript" src='/LIG/js/jquery.min.js'></script>
<script type="text/javascript" src='/LIG/js/fullcalendar.min.js'></script>
<script type="text/javascript" src='/LIG/js/gcal.js'></script>
<script type="text/javascript" src='/LIG/js/ko.js'></script>
<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>

<script>

	function checkIt() {
		var userinput = eval("document.userinput");

		if (!userinput.passwd.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (userinput.passwd.value != userinput.passwd2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}

	}

$(document).ready(function() {
	$("#modify").click(function() {
		document.userinput.action = "/LIG/MyPage/UserInfo/modify.do";
		document.userinput.submit();

	});
/* 	$("#delete").click(function() {
		document.userinput.action = "/LIG/MyPage/UserInfo/delete.do";
		document.userinput.submit();
	}); */
	
	
	//캘린더
	$('#calendar').fullCalendar({
		/* defaultDate : '2017-09-12', */
		editable : false, //이벤트 드래그
		eventLimit : false, //이벤트 제한
		events : events,
		eventColor : '#FFA38B',
		lang :"ko",
		displayEventTime : false,

	});

	
<%-- 	$("#mRegister").click(function(){
		
		var group_id=$("#eventGroupId").val();
		var subject=$("#eventSubject").html();
		var start=$("#eventStartDate").val();
		var end=$("#eventEndDate").val(); 
		var share_content=CKEDITOR.instances.share_content.getData();
		
		console.log(group_id + " : " + subject + " : " +  start + ": " + end  + " :  " +share_content);
		
		
		$.ajax({	
			url:"<%= request.getContextPath()%>/MyPage/UserInfo/shareDateInsert.do",
			type:"post",
			dataType:"text",
			data:{
				group_id:group_id,
				start:start,
				end:end,
				subject:subject,
				share_content:share_content
			},
			success:function(result){
				console.log(result);
				if($.trim(result)=="success"){
					alert("공유 했습니다.");
					$(".close").click();
				}else{
					alert("공유하기에 실패 하였습니다.");
				}	
			}
			
		});
		
		
	}); --%>
	
	
});

//캘린더
var events = new Array();
<c:forEach var="event" items="${events}">
	eventDetails = new Object();
	eventDetails.id = '${event.group_id}';
	eventDetails.title = '${event.subject}';
	eventDetails.start = '${event.start_date}';
	eventDetails.end = '${event.end_date}';
	events.push(eventDetails);
</c:forEach>

function detailEvent(groupid){
	
	
	$.ajax({
		type:"post",
		url:"<%= request.getContextPath()%>/MyPage/UserInfo/groupEvtDtail.do?group_id="+groupid,
		dataType:"html",
		success:function(result){
			console.log(result);
			$("#evtDetail").html(result);		
		}
	});
		
	
}

function evtModal(group_id, subject, start, end){
	CKEDITOR.instances.share_content.setData("");
	$("#eventGroupId").val(group_id);
	$("#eventSubject").html(subject);
	$("#eventStartDate").val(start.substring(0, 10));
	$("#eventEndDate").val(end.substring(0,10)); 

}

function dateToChange(date){
	function ch(num){
		num=num + '';
		return num.length <2 ? '0' +num :num;
	}
	return date.getFullYear() + '-' + ch(date.getMonth()+1) +'-'+ch(date.getDate());
}

</script>


<style type="text/css">
#calendar {
	max-width: 900px;
	margin: 0 auto;
}

/* 주말색변경 */
.fc-sun {color:#e31b23}
.fc-sat {color:#007dc3}

</style>

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
	<!-- action="/LIG/MyPage/modify.do" -->
	
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
							<div role="tabpanel" class="tab-pane active" id="home">
							<div id='calendar'></div>
							
							
							<div>
							
							</div>	
							
			<!-- 일정 리스트  -->
                     <br><br><br><br>
                     <div class="table-responsive">
                     <p>&nbsp;</p>
                     <h2 style="color: rgb(130, 98, 79);"><i class="glyphicon glyphicon-list-alt" style="display:inline-block; color: rgb(130, 98, 79); font-size: 40px;">&ensp;</i>일정 리스트</h2>
                     <p></p>
                     <table  class="pop_table">
                     <thead>
                        <tr><td colspan="5">
                           <div class="text-left">
                           <!-- <input type="button" class="a btn-orange-fill2 radius" value="전체선택" id="checkall" /> -->
                           <button class="a btn-orange-fill2 radius" id="checkall" >전체선택</button>
                           <input type="hidden"     id="checkConfirm" />
                           <button class="a btn-orange-fill2 radius" id="btnDelete" style="padding:12px 12px 16px 12px;"><i class="glyphicon glyphicon-trash"></i></button>
                           </div>
                        </td></tr>
                        </thead>
                        <tbody>
                        <tr>
                           <th></th>
                           <th>주제</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th width="170">공유하기</th>

                        </tr>
                        <c:forEach items="${events}" var="ev"> 
                           <tr>
                              <td><input type="checkbox"  class="my-chackbox"  data-idx="${ev.group_id }" name="chk" /></td>
                              <td  style="cursor: pointer;" onclick="detailEvent('${ev.group_id }')">${ev.subject }</td>
                              <td  style="cursor: pointer;" onclick="detailEvent('${ev.group_id }')">
                              <fmt:formatDate value="${ev.start_date }" pattern="yyyy-MM-dd"/>
                              </td >
                              <td  style="cursor: pointer;" onclick="detailEvent('${ev.group_id }')">
                              <fmt:formatDate pattern="yyyy-MM-dd" value="${ev.end_date }" /></td>
                              <td width="170"><button  class="a btn-orange-fill2 radius" style="padding: 8px 25px 8px 25px;" onclick="window.location.href='/LIG/MyPage/mySharing.do?group_id=${ev.group_id}'">공유</button></td>
                           </tr>      
                        </c:forEach>
                        </tbody>
                     
                     </table>
                     
                     </div>
                     
         <!-- 일정 리스트  끝-->
							
							<div class="row">
							   <div class="col-xs-12 ">
						<div>
								<!-- <h3 id="eventsGroup">상세일정</h3> -->
								
						</div>
						</div>
						   <div class="col-xs-12 ">    

							   <div id="evtDetail">
							   
							   </div>
  
							   </div>
							</div>
												
							</div>
							<div role="tabpanel" class="tab-pane" id="profile"></div>
							<div role="tabpanel" class="tab-pane" id="messages"></div>
							<div role="tabpanel" class="tab-pane" id="settings">
								
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

							<li role="presentation" class="active"><a onclick="javascript:document.location.href='<c:url value='/myPage/index.do'/>'" 
							aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-calendar"></i>
									<span onclick="">일정조회</span></a></li>
									
							<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/mypage/scheduleSharing/selectList.do'/>'"
								aria-controls="profile" role="tab" data-toggle="tab"> <i class="fa fa-users" aria-hidden="true"></i> 
									<span onclick="">일정공유</span></a></li>
									
							<li role="presentation"><a onclick="location.href='/LIG/MyQuestionBoard/qboardlist.do';"
							aria-controls="messages" role="tab" data-toggle="tab"> 
							<i class="glyphicon glyphicon-list-alt" style="display: inline-block;"></i>  
									<span>Q & A 게시판</span></a></li>
						
							<li role="presentation"><a onclick="javascript:document.location.href='<c:url value='/MyPage/UserInfo/member_view.do'/>'"
									aria-controls="settings" role="tab" data-toggle="tab"> <i class="glyphicon glyphicon-user" aria-hidden="true" style="display: inline-block;"></i> 
										 <span>개인정보 조회</span></a></li>


						</ul>
						<br><br>
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
							<div id='calendar'></div>
							
							
							<div>
							
							</div>	
							
			<!-- 일정 리스트  -->
                     <br><br><br><br>
                     <div class="table-responsive">
                     <p>&nbsp;</p>
                     <h2 style="color: rgb(97, 67, 50);"><i class="glyphicon glyphicon-list-alt" style="display:inline-block; color: rgb(130, 98, 79); font-size: 40px;">&ensp;</i>일정 리스트</h2>
                     <p></p>
                     <table  class="pop_table">
                     <thead>
                        <tr><td colspan="5">
                           <div class="text-left">
                           <!-- <input type="button" class="a btn-orange-fill2 radius" value="전체선택" id="checkall" /> -->
                           <button class="a btn-orange-fill2 radius" id="checkall" >전체선택</button>
                           <input type="hidden"     id="checkConfirm" />
                           <button class="a btn-orange-fill2 radius" id="btnDelete" style="padding:12px 12px 16px 12px;"><i class="glyphicon glyphicon-trash"></i></button>
                           </div>
                        </td></tr>
                        </thead>
                        <tbody>
                        <tr>
                           <th></th>
                           <th>주제</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th width="170">공유하기</th>

                        </tr>
                        <c:forEach items="${events}" var="ev"> 
                           <tr>
                              <td><input type="checkbox"  class="my-chackbox"  data-idx="${ev.group_id }" name="chk" /></td>
                              <td  style="cursor: pointer;" onclick="detailEvent('${ev.group_id }')">${ev.subject }</td>
                              <td  style="cursor: pointer;" onclick="detailEvent('${ev.group_id }')">
                              <fmt:formatDate value="${ev.start_date }" pattern="yyyy-MM-dd"/>
                              </td >
                              <td  style="cursor: pointer;" onclick="detailEvent('${ev.group_id }')">
                              <fmt:formatDate pattern="yyyy-MM-dd" value="${ev.end_date }" /></td>
                              <td width="170"><button  class="a btn-orange-fill2 radius" style="padding: 8px 25px 8px 25px;" onclick="window.location.href='/LIG/MyPage/mySharing.do?group_id=${ev.group_id}'">공유</button></td>
                           </tr>      
                        </c:forEach>
                        </tbody>
                     
                     </table>
                     
                     </div>
                     
         <!-- 일정 리스트  끝-->
							
							<div class="row">
							   <div class="col-xs-12 ">
						<div>
								<!-- <h3 id="eventsGroup">상세일정</h3> -->
								
						</div>
						</div>
						   <div class="col-xs-12 ">    

							   <div id="evtDetail">
							   
							   </div>
  
							   </div>
							</div>
												
							</div>
							<div role="tabpanel" class="tab-pane" id="profile"></div>
							<div role="tabpanel" class="tab-pane" id="messages"></div>
							<div role="tabpanel" class="tab-pane" id="settings">
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


	</section>

</c:otherwise>
			</c:choose>



<!-- 
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
       
      <form action="" method="post" name="mform" id="mform">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      
      
        <h4 class="modal-title text-center" id="eventSubject">주제</h4>
        <input type="hidden" id="eventGroupId" >
        <input type="text" id="eventStartDate" >
        <input type="text" id="eventEndDate" >
      </div>
      <div class="modal-body">
        <p></p>
        <textarea name="share_content" id="share_content"></textarea>
  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="mRegister">등록하기</button>
      </div>
      
     </form> 
      
      
    </div>/.modal-content
  </div>/.modal-dialog
</div>/.modal
 -->
<script>

$(function(){
	
	
	$("#checkall").click(function(){
		allCheck();
	});
	
	$("#btnDelete").click(function(){
		evtDelete();
	})
	
});

function allCheck(){
	console.log("allcheck");
	var confirm =$("#checkConfirm").val();
	
	if(confirm=='on'){
		$("input[name=chk]").prop("checked", false);
		$("#checkConfirm").val("off");
	}else{
		$("input[name=chk]").prop("checked", true);
		$("#checkConfirm").val("on");
	}


}


function evtDelete(){
	
	if(confirm("정말 삭제 하시겠습니까?")){
		
		$("input[name=chk]").each(function(index){
			
			if($(this).prop("checked")){
				
				var idx=$(this).attr("data-idx");
				console.log(idx);
			 
				$.ajax({
					url:"<%= request.getContextPath() %>/MyPage/UserInfo/evtGroupDelete.do",
					type:"POST",
					dataType:"text",
					data:{
						idx: idx
					},
					success:function(result){
						if($.trim(result)=="success"){
							location.reload();
						}
					}
							
				}); 
				
			}
				
			
		});
		
	}
	

	
}








</script>


	
	<c:import url="/WEB-INF/view/MyPage/footer.jsp"></c:import>
	<c:import url="/WEB-INF/view/MyPage/script.jsp"></c:import>
</body>
</html>