<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common2.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%
   int myoffset = 2;
   int mywidth = twelve - 2 * myoffset;
   int formleft = 3;
   int formright = twelve - formleft;
   int mysearch = 2;
   //int label = 3 ; //양식의 왼쪽에 보여지는 라벨의 너비 
   //int content = twelve - label ; //우측의 내용 입력(input, select, textarea)의 너비
%>

<html>
<head>
<title>BootStrap Sample</title>
		
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css">
<!--===============================================================================================-->

<style>
	.container-table100{
		height: 100vh;
		align-items: baseline;
		background-image: url('resources/login_css/images/bg-01.jpg');
		background-size : cover;
		}
	.table {
	    border: 3px;
	    border-style: solid;
	    border-color: #6c7ae0;
	}
	.navbar {
	    position: relative;
	    min-height: 50px;
	    margin-bottom: 0px;
	    border: 1px solid transparent;
	}
	.btn-default{
  		background-color: #c4d3f6;
  		color:#FFF;
  		border-color: #6c7ae0;
  		radius : 10px;
  		border-radius: 8px;
	}
	font {
		color: black;
		
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
th, td {
  text-align: left;
  padding: 8px;
}
tr {
  border-bottom: 1px solid #ddd;
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
	<div class="skicontainer col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="wrap-table100">	
			<div class="panel-body">
				
				<div class="panel panel-default panel-primary">
         <div class="panel-heading">
            <form class="form-inline" role="form">
               <h2>Q&A 목록</h2>
               
            </form>
         </div>
         <table class="table table-striped table-hover">
			<thead>
			<tr>
							<td colspan="8" align="center">
                  <form class="form-inline" role="form" name="myform" action="<%=contextPath%>/list.qa" method="get" style = "display: flex; float: right;" >
                     <div class="form-group">
                        <select class="form-control" name="mode" id="mode">
                           <option value="all" selected="selected">-- 선택하세요--
                           <option value="member_id" >작성자
                           <option value="qnatitle" >제목                           
                           <option value="qnacont" >글 내용                           
                        </select>
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control btn-xs" name="keyword"
                           id="keyword" placeholder="검색 키워드">
                     </div>
                     <button class="btn btn-default btn-warning" type="submit" onclick="search();"><b>검색</b></button>
                     &nbsp;
                     
					 <button class="btn btn-default btn-warning btn-right 100%" type="button"
							onclick="writeForm();"><b>글 쓰기</b></button>
					
	
								</form>
							</td>
					</tr>
	  <tr>
	  <th>글 번호</th>
	  <th>작성자</th>
	  <th>제목</th>
	  <th>작성일자</th>
	  <th>답변여부</th>
	  <th>조회수</th>
	  <th>수정하기</th>
	  <th>삭제</th>
	  </tr>
			</thead>
				
					<c:forEach var="bean" items="${requestScope.lists}">			  
	  <tr>
							<td>${bean.qnacode}</td>
							<td>${bean.member_id}</td>
							<td>
								<c:forEach var="cnt" begin="1" end="${bean.qna_depth}">
									<span class="badge re">re</span>
								</c:forEach>
								<a href="<%=contextPath%>/detailview.qa?qnacode=${bean.qnacode}&${requestScope.parameters}">
									${bean.qnatitle}
								</a>
							</td>
							<td>${bean.qnawdate}</td>					
							<td>
								<c:if test="${bean.qna_depth <3 && sessionScope.loginfo.member_id =='admin'}">
									<a href="<%=contextPath%>/reply.qa?qnacode=${bean.qnacode}&${requestScope.parameters}&qna_groupno=${bean.qna_groupno}&qna_orderno=${bean.qna_orderno}&qna_depth=${bean.qna_depth}">
										답글
									</a>
								</c:if>
								<c:if test="${bean.qna_depth >= 3 || sessionScope.loginfo.member_id !='admin' }">
									답글
								</c:if>
							</td>
							<td>
								${bean.qnahit}							
							</td>
							<td>
								<c:if test="${sessionScope.loginfo.member_id == bean.member_id}">
									<a href="<%=contextPath%>/update.qa?qnacode=${bean.qnacode}&${requestScope.parameters}">
										수정
									</a>
								</c:if>
								
							</td>
							<td>
								<c:if test="${sessionScope.loginfo.member_id == bean.member_id}">
									<a href="<%=contextPath%>/delete.qa?no=${bean.qnacode}&${requestScope.parameters}">
										삭제
									</a>
								</c:if>
								
							</td>	
						</tr>
						
				</c:forEach>
	</table>

</div>
		<br><br>
			<div align="right">
				<footer>${requestScope.pagingHtml}</footer>		
					
			</div>		
		</div>
	</div>
</div>
</div>
</div>


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
<!--===============================================================================================-->	
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>					
</body>
</html>


