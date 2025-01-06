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
</style>
<script type="text/javascript">
		function gotoBack(){
			location.href='<%=contextPath%>/start.jsp';
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
				<h1 class="panel-title" align="left">정보 상세 보기</h1>
			</div>
			<div class="panel-body">
				<div class="col-sm-<%=rightside%> col-sm-<%=rightside%>">
					<table class="table table-hover table-condensed">
						<tr>
							<td width="25%">아이디</td>
							<td width="75%">${bean.member_id}</td>
						</tr>
						<tr>
							<td width="25%">이름</td>
							<td width="75%">${bean.name}</td>
						</tr>		
						<tr>
							<td width="25%">비밀 번호</td>
							<td width="75%">${bean.password}</td>
						</tr>
						<tr>
							<td width="25%">이메일</td>
							<td width="75%">${bean.email}</td>
						</tr>
						<tr>
							<td width="25%">전화번호</td>
							<td width="75%">${bean.phone}</td>
						</tr>
						<tr>
							<td width="25%">생일</td>
							<td width="75%">${bean.birth}</td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="col-sm-offset-5 col-sm-4">
					<button class="btn btn-default" onclick="gotoBack();">
						돌아 가기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>
</body>
</html>