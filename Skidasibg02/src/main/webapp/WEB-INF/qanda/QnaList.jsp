<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="./../common/common2.jsp"%>
<%-- 스프링 관련 설정 코드 --%>

<%
   int myoffset = 2;
   int mywidth = twelve - 2 * myoffset;
   int formleft = 3;
   int formright = twelve - formleft;
%>

<!DOCTYPE html>
<html lang="en">
<head>
   <title>Table V02</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
   
<!--===============================================================================================-->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/util.css">
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
<!--===============================================================================================-->
<style type="text/css">
   .container-table100{
      height: 100vh;
      align-items: baseline;
      background-image: url('resources/login_css/images/bg-01.jpg');
      background-size : cover;
   }
   .wrap-table100 {
         width: 1200px;
       border-radius: 10px;
       overflow: hidden;
   }
   .row .cell:nth-child(1) {
       width: 250px;
   }
   .row .cell:nth-child(2) {
       width: 250px;
   }
   .row .cell:nth-child(3) {
       width: 250px;
   }
   .row .cell:nth-child(4) {
       width: 250px;
   }
   .row .cell:nth-child(5) {
       width: 250px;
   }
   .row .cell:nth-child(6) {
       width: 120px;
   }
   .row .cell:nth-child(7) {
       width: 120px;
   }
   .row .cell:nth-child(8) {
       width: 120px;
   }
   .pagination { 
       padding-left: 0px;
       margin : 10px;
   }
   .form-control {
      width: 80%;
   }
   a:visited { 
      color:blue; 
   }
   a:hover {
        color:red;
        transition-delay: 0.1s;
   }
   .pagination>.active>a, 
   .pagination>.active>a:focus, 
   .pagination>.active>a:hover, 
   .pagination>.active>span, 
   .pagination>.active>span:focus, 
   .pagination>.active>span:hover {
       z-index: 3;
       color: #fff;
       cursor: default;
       background-color: white;
       border-color: #337ab7;
   }
   font {
      color: black;
   }
   .btn-default{
        background-color: #c4d3f6;
        color:#FFF;
        border-color: #6c7ae0;
        radius : 10px;
        border-radius: 8px;
   }
   .navbar {
       position: relative;
       min-height: 50px;
       margin-bottom: 0px;
       border: 1px solid transparent;
   }
   .table {
       border: 3px;
       border-style: solid;
       border-color: #6c7ae0;
   }
   .row .cell:nth-child(1) {
       width: 360px;
       padding-left: 20px;
   }
   .row .cell:nth-child(1) {
       width: 550px;
       padding-left: 20px;
   }
   .row .cell:nth-child(2) {
       width: 500px;
   }
</style>
<script type="text/javascript">
   function writeForm(){
         location.href='<%=contextPath%>/insert.qa';
   }
   function search(){
      if( $('#mode').val() == 'all' ){
         alert('검색 목록을 선택해주세요') ;
         //$('#mode').focus();
      }else{
         //alert('하하') ;
      }
      //alert( $('#mode').val() );
   }
   function searchAll(){
      //$('#mode').val('-');
      //$('#keyword').val('');
      location.href='<%=contextPath%>/list.qa';
   }
</script>   
</head>
<body>
   <div class="limiter">
      <div class="container-table100">
         <div class="wrap-table100">
            <div class="table">   
               <div class="row header">
                        <div class="cell">
                           글 번호
                        </div>
                        <div class="cell">
                           작성자
                        </div>
                        <div class="cell">
                           제목
                        </div>
                        <div class="cell">
                           조회수
                        </div>
                        <div class="cell">
                           작성일자
                        </div>
                        <div class="cell">
                           수정
                        </div>
                        <div class="cell">
                           삭제
                        </div>
                        <div class="cell">
                           답글
                        </div>
                     </div>
            
                  <form class="row">
                     <div class="cell" role="form" name="myform" action="<%=contextPath%>/list.qa" method="get">
                        <select class="form-control" name="mode" id="mode">
                           <option value="all" selected="selected">--선택하세요--
                           <option value="member_id" >작성자
                           <option value="qnatitle" >제목                           
                           <option value="qnacont" >글 내용                           
                        </select>
                     </div>
                     <div class="cell">
                        <input type="text" class="form-control" name="keyword"
                              id="keyword" placeholder="검색 키워드">
                     </div>
                     <div class="cell">
                        <button class="btn btn-default btn-warning" type="submit" onclick="search();">검색</button>
                        <button class="btn btn-default btn-warning" type="button" onclick="searchAll();">전체 검색</button>
                     </div>
                     <div class="cell"></div>
                     <div class="cell">   
                        <button class="btn btn-default" type="button"
                           onclick="writeForm();">글 쓰기</button>
                     </div>
                     <div class="cell">
                           <p class="form-control-static">${requestScope.pagingStatus}</p>
                     </div>      
                     <div class="cell"></div>
                     <div class="cell"></div>
                  </form>
               
                  <c:forEach var="bean" items="${requestScope.lists}">
                     <div class="row">
                        <div class="cell" data-title="Full Name">
                           ${bean.qnacode}
                        </div>
                        <div class="cell" data-title="Age">
                           ${bean.member_id}
                        </div>
                        <div class="cell" data-title="Job Title">
                           <c:forEach var="cnt" begin="1" end="${bean.qna_depth}">
                              <span class="badge re">re</span>
                           </c:forEach>
                           <a href="<%=contextPath%>/detailview.qa?qnacode=${bean.qnacode}&${requestScope.parameters}">
                              ${bean.qnatitle}
                           </a>
                        </div>   
                        <div class="cell" data-title="Location">
                              ${bean.qnahit}
                        </div>
                        <div class="cell" data-title="Location">
                           ${bean.qnawdate}                     
                        </div>                  
                        <div class="cell" data-title="Location">
                           <c:if test="${sessionScope.loginfo.member_id == bean.member_id}">
                              <a href="<%=contextPath%>/update.qa?qnacode=${bean.qnacode}&${requestScope.parameters}">
                                 수정
                              </a>
                           </c:if>
                           <c:if test="${sessionScope.loginfo.member_id != bean.member_id}">
                              수정
                           </c:if>
                        </div>
                        <div class="cell" data-title="Location">
                           <c:if test="${sessionScope.loginfo.member_id == bean.member_id}">
                              <a href="<%=contextPath%>/delete.qa?no=${bean.qnacode}&${requestScope.parameters}">
                                 삭제
                              </a>
                           </c:if>
                           <c:if test="${sessionScope.loginfo.member_id != bean.member_id}">
                              삭제
                           </c:if>
                        </div>
                        <div class="cell" data-title="Location">
                           <c:if test="${bean.qna_depth <3 && sessionScope.loginfo.member_id =='admin'}">
                              <a href="<%=contextPath%>/reply.qa?qnacode=${bean.qnacode}&${requestScope.parameters}&qna_groupno=${bean.qna_groupno}&qna_orderno=${bean.qna_orderno}&qna_depth=${bean.qna_depth}">
                                 답글 
                              </a>
                           </c:if>
                           <c:if test="${bean.qna_depth >= 3 || sessionScope.loginfo.member_id !='admin' }">
                              답글
                           </c:if>
                        </div>
                     </div>
            </c:forEach>
         </div>
         <div align="center">
            <footer>${requestScope.pagingHtml}</footer>         
         </div>      
      </div>
   </div>
</div>   
   <script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js"/>"/></script>
   <script src="<c:url value="/resources/vendor/bootstrap/js/popper.js"/>"/></script>
   <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"/></script>
   <script src="<c:url value="/resources/vendor/select2/select2.min.js"/>"/></script>
   <script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js"/>"/></script>
   
   <br><br><br><br>
   <script type="text/javascript">
      /* 방금 전 선택한 콤보 박스를 그대로 보여 주기 */ 
      $('#mode option').each(function (index){
         if( $(this).val() == '${requestScope.mode}' ){
            $(this).attr('selected', 'selected') ;
         }
      });   
      /* 이전에 넣었던 값 그대로 보존 */
      $('#keyword').val( '${requestScope.keyword}' ) ;      
   </script>   
</body>
</html>