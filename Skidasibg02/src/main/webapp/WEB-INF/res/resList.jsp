<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common2.jsp" %>
<!DOCTYPE html>
<html>
<head>
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
	* {
		box-sizing: border-box;
	}
	body {
	  	font-family: "Indie Flower";
	  	line-height: 1.618em;
	  	background-color: #c4d3f6;
	  	background-size: 10px 10px;
	}
	img {
		width: 550px;
		height: auto;
	}
	.wrapper {
	  	width: 100%;
	 	padding: 0 2rem;
	  	text-align: center;
	}
	.polaroid {
	  	background: #fff;
	  	padding: 1rem;
	  	box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.2);
	}
	.caption {
	  	font-size: 4rem;
	  	text-align: center;
	  	line-height: 2em;
	}
	.item {
	  	display: inline-block;
	  	margin-top: 2rem;
	  	filter: grayscale(100%);
	}
	.item .polaroid:before {
	  	content: '';
	  	position: absolute;
	  	z-index: -1;
	  	transition: all 0.35s;
	}
	.item:nth-of-type(4n+1) {
	  	transform: scale(0.8, 0.8) rotate(5deg);
	  	transition: all 0.35s;
	}
	.item:nth-of-type(4n+1) .polaroid:before {
	  	transform: rotate(6deg);
	  	height: 20%;
	  	width: 47%;
	  	bottom: 30px;
	  	right: 12px;
	  	box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
	}
	.item:nth-of-type(4n+2) {
	  	transform: scale(0.8, 0.8) rotate(-5deg);
	  	transition: all 0.35s;
	}
	.item:nth-of-type(4n+2) .polaroid:before {
	  	transform: rotate(-6deg);
	  	height: 20%;
	  	width: 47%;
	  	bottom: 30px;
	  	left: 12px;
	  	box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
	}
	.item:nth-of-type(4n+4) {
	  	transform: scale(0.8, 0.8) rotate(3deg);
	  	transition: all 0.35s;
	}
	.item:nth-of-type(4n+4) .polaroid:before {
	 	transform: rotate(4deg);
	  	height: 20%;
	  	width: 47%;
	  	bottom: 30px;
	  	right: 12px;
	  	box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
	}
	.item:nth-of-type(4n+3) {
	  	transform: scale(0.8, 0.8) rotate(-3deg);
	  	transition: all 0.35s;
	}
	.item:nth-of-type(4n+3) .polaroid:before {
	  	transform: rotate(-4deg);
	  	height: 20%;
	  	width: 47%;
	  	bottom: 30px;
	  	left: 12px;
	  	box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
	}
	.item:hover {
	  	filter: none;
	  	transform: scale(1, 1) rotate(0deg) !important;
	  	transition: all 0.35s;
	}
	.item:hover .polaroid:before {
	  	content: '';
	  	position: absolute;
	  	z-index: -1;
	  	transform: rotate(0deg);
	  	height: 90%;
	  	width: 90%;
	  	bottom: 0%;
	  	right: 5%;
	  	box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
	  	transition: all 0.35s;
	}
	.btn-default{
  		background-color: #6c7ae0;
  		color:#FFF;
  		border-color: #6c7ae0;
  		radius : 10px;
  		border-radius: 8px;
	}
	
</style>
</head>
<body>
<div class="wrapper">
	<div class="form-group">
		
	</div>	
	
	<c:forEach var="bean" items="${requestScope.lists}">
		<div class="item">
			<div class="polaroid">
				<a href="<%=contextPath%>/insert.res?pr_no=${bean.pr_no}">
					<img src="<%=uploadedFolder%>/${bean.resort_img}" alt="no image">
					<div class="caption">${bean.resort_name}, ${bean.pr_price}원(<c:if test="${bean.pr_aorc == 'ch'}">어린이</c:if><c:if test="${bean.pr_aorc == 'ad'}">성인</c:if>)</div>
	    		</a>  
	   		</div>
		</div>
	</c:forEach>

</div>
</body>
</html>