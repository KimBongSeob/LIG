<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<div class="table-responsive">
  <%--  <h3 >${ev.subject }의 상세일정</h3> --%>
<table class="hon_table">
  <thead>
   <tr>
      <th colspan="2" style="text-align:center;">
       <h3>${eventSubject.subject }</h3>   
      </th>
   </tr>
  </thead>
  <tbody>
 
  <tr>
     <th>시작 날짜</th>
     <td>${eventSubject.start_date }</td>
  </tr>
  
  <tr>
    <th>종료 날짜</th>
    <td>${eventSubject.end_date }</td>
  </tr>
         
<c:forEach items="${evtDetail }"  var="e" varStatus="idx">
  
     <tr>
       <td colspan="2"><h4>${e.day_no} 일차</h4></td>
     </tr>
     
   <c:if test="${not empty e.dest_name_1}">
      <tr>
       <th>여행지</th>
       <td>${e.dest_name_1}</td> 
     </tr>  
     <tr>
       <th>주소</th>
       <td>${e.basic_addr_1 } ${e.detail_addr_1 }</td>
     </tr>
        
   </c:if>
      
   
   <c:if test="${not empty e.dest_name_2}">
      <tr>
       <th>여행지</th>
       <td>${e.dest_name_2}</td> 
     </tr>  
     <tr>
       <th>주소</th>
       <td>${e.basic_addr_2 } ${e.detail_addr_2 }</td>
     </tr>
         
   </c:if>
   
   
   <c:if test="${not empty e.dest_name_3}">
      <tr>
       <th>여행지</th>
       <td>${e.dest_name_3}</td> 
     </tr>  
     <tr>
       <th>주소</th>
       <td>${e.basic_addr_3 } ${e.detail_addr_3 }</td>
     </tr>

   </c:if>
   
      
   <c:if test="${not empty e.dest_name_4}">
      <tr>
       <th>여행지</th>
       <td>${e.dest_name_4}</td> 
     </tr>  
     <tr>
       <th>주소</th>
       <td>${e.basic_addr_4 } ${e.detail_addr_4 }</td>
     </tr>

   </c:if>
   
   
   <c:if test="${not empty e.dest_name_5}">
      <tr>
       <th>여행지</th>
       <td>${e.dest_name_5}</td> 
     </tr>  
     <tr>
       <th>주소</th>
       <td>${e.basic_addr_5 } ${e.detail_addr_5 }</td>
     </tr>
        
   </c:if>
   

</c:forEach>
</tbody>


</table>
</div>


