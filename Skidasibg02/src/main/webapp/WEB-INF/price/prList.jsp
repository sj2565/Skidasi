<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common2.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
	}
	.wrap-table100 {
   		width: 740px;
    	border-radius: 10px;
    	overflow: hidden;
	}
	.row .cell:nth-child(1) {
    	width: 100px;
	}
	.row .cell:nth-child(2) {
    	width: 100px;
	}
	.row .cell:nth-child(3) {
    	width: 100px;
	}
	.row .cell:nth-child(4) {
	    width: 120px;
	}
	.row .cell:nth-child(5) {
	    width: 120px;
	}
	.row .cell:nth-child(6) {
	    width: 120px;
	}
	.row .cell:nth-child(7) {
	    width: 80px;
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
	
</style>
</head>

<body>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table">
					<div class="row header">
						<div class="cell">
							목록
						</div>
						<div class="cell">
							이용시간
						</div>
						<div class="cell">
							성인/소인
						</div>
						<div class="cell">
							가격
						</div>
						<div class="cell">
							리조트 번호
						</div>
						<div class="cell">
							수정
						</div>
						<div class="cell">
							삭제
						</div>
					</div>	
					
					<c:forEach var="bean" items="${requestScope.lists}">
						<div class="row">
							<div class="cell" data-title="Full Name">
								${bean.pr_no}
							</div>
							<div class="cell" data-title="Age">
								${bean.pr_hour}
							</div>
							<div class="cell" data-title="Job Title">
								${bean.pr_aorc}
							</div>
							<div class="cell" data-title="Location">
								${bean.pr_price}
							</div>
							<div class="cell" data-title="Location">
								${bean.resort_no}
							</div>
							<div class="cell" data-title="Location">
								<a href="<%=contextPath%>/update.pr?pr_no=${bean.pr_no}">
								수정</a>
							</div>
							<div class="cell" data-title="Location">
								<a href="<%=contextPath%>/delete.pr?pr_no=${bean.pr_no}">
								삭제</a>
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