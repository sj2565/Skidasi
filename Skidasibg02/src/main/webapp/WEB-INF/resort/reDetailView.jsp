<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common2.jsp"%>
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
	font {
		color: #6c7ae0;
	}
	.btn-default{
  		background-color: #c4d3f6;
  		color:#FFF;
  		border-color: #6c7ae0;
  		radius : 10px;
  		border-radius: 8px;
	}
	body {
    	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    	font-size: 14px;
    	line-height: 1.42857143;
    	color: #333;
    	background-color: #c4d3f6;
	}
	.limiter {
    	width: 50%;
    	margin: 0 auto;
	}
	.panel-primary {
    	border-color: #6c7ae0;
    	margin-top: 40px;
    	border-radius: 8px;
	}
	.panel-primary>.panel-heading {
    	color: #fff;
    	background-color: #6c7ae0;
    	border-color: #337ab7;
    	border-radius: 8px 8px 0px 0px;
	}
	.form-control{
		width: 70%;
	}
	.panel-heading {
    	padding: 20px 30px; 
	}
	.panel-title {
    	font-size: 18px;
    }
    .site-navbar-wrap a {
    	color: black;
	}
	.col-md-4 {
    	width: 100%;
	}
</style>
<script type="text/javascript">
		function gotoBack(){
			location.href='<%=contextPath%>/list.bo?${requestScope.parameters}';
			//alert('${requestScope.parameter}') ;
		}
</script>
</head>
<%
	int myoffset = 2; //전체 외관의 옵셋
	int mywidth = twelve - 2 * myoffset;
	int leftside = 0; //판넬의 좌측
	int rightside = twelve - leftside; //판넬의 우측
%>
<body>
	<div class="limiter">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<h1 class="panel-title" align="left">리조트 상세 보기</h1>
			</div>
			<div class="panel-body" align="left">
				<div class="col-md-12">
					<table class="table table-condendes table-striped">
						 <tr>
		                     <td width="25%">아이디</td>
		                     <td width="75%">${bean.resort_no}</td>
		                  </tr>
		                  <tr>
		                     <td width="25%">리조트 이름</td>
		                     <td width="75%">${bean.resort_name}</td>
		                  </tr>
		                  <tr>
		                     <td width="25%">소개글</td>
		                     <td width="75%">${bean.resort_cont}</td>
		                  </tr>      
		                  <tr>
		                     <td width="25%">면적</td>
		                     <td width="75%">${bean.resort_area}</td>
		                  </tr>
		                  <tr>
		                     <td width="25%">주소</td>
		                     <td width="75%">${bean.resort_addr}</td>
		                  </tr>
		                  <tr>
		                     <td width="25%">전화번호</td>
		                     <td width="75%">${bean.resort_tel}</td>
		                  </tr>
		                  <tr>
		                  	 <td colspan="1">
		                  		<img src="<%=uploadedFolder%>/${bean.resort_img}" width="300" height="300" alt="no image">
		                  	 </td>
		                  </tr>
					</table>
				</div>
				<hr>
				<div class="col-md-offset-5 col-md-4">
               		<!-- <button class="btn btn-default" onclick="history.back();">돌아 가기</button>
               		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
               		
               		<c:if test="${sessionScope.loginfo.member_id == 'admin'}">
                    <button class="btn btn-default" type="submit" 
               		onclick="location.href='<%=contextPath%>/update.rs?resort_no=${bean.resort_no}'">리조트 수정</button>
					</c:if>
					<c:if test="${sessionScope.loginfo.member_id != 'admin'}">
					</c:if>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<c:if test="${sessionScope.loginfo.member_id == 'admin'}">
                    <button class="btn btn-default" type="submit" 
               		onclick="location.href='<%=contextPath%>/delete.rs?resort_no=${bean.resort_no}'">리조트 삭제</button>
					</c:if>
					<c:if test="${sessionScope.loginfo.member_id != 'admin'}">
					</c:if>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${sessionScope.loginfo.member_id == 'admin'}">
	            	<button class="btn btn-default" type="submit" 
	            	onclick="location.href='<%=contextPath%>/insert.pr?resort_no=${bean.resort_no}'">이용권 추가</button>
					</c:if>
					<c:if test="${sessionScope.loginfo.member_id != 'admin'}">
					</c:if>
					
            	</div>
			</div>
		</div>
	</div>
</body>
</html>