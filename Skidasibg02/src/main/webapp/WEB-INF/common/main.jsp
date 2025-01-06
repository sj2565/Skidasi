<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%-- 스프링 관련 설정 코드 --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--===============================================================================================-->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
<!--===============================================================================================-->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<!--===============================================================================================-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main_css/css/owl.carousel.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main_css/css/owl.theme.default.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main_css/css/style.css">
<!--===============================================================================================-->

<style type="text/css">
	.mb-3{
	    line-height: 1.5;
	    font-weight: 400;
	    padding-bottom: 500px;
	    font-family: "Poppins", Arial, sans-serif;
	}
</style>

</head>
  <body>
		<div class="home-slider owl-carousel js-fullheight">
      <div class="slider-item js-fullheight">
      	<img src = "https://cdn.imweb.me/upload/S201812065c08d5ab5a9a4/5cd9129cd4c40.jpg" alt ="resort">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
	          <div class="col-md-12 ftco-animate">
	          	
	          </div>
	        </div>
        </div>
      </div>

      <div class="slider-item js-fullheight">
      	<img src = "https://t1.daumcdn.net/cfile/tistory/2657A94A52A5A15A1B" alt="resort">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
	          <div class="col-md-12 ftco-animate">
	          	
	          </div>
	        </div>
        </div>
      </div>

      <div class="slider-item js-fullheight">
      	<img src = "https://t1.daumcdn.net/cfile/tistory/2514343352D5E74C2F" alt="resort">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
	          <div class="col-md-12 ftco-animate">
	          	
	          </div>
	        </div>
        </div>
      </div>
    </div>

    <script src="<c:url value="/resources/main_css/js/jquery.min.js"/>"/></script>
    <script src="<c:url value="/resources/main_css/js/popper.js"/>"/></script>
    <script src="<c:url value="/resources/main_css/js/bootstrap.min.js"/>"/></script>
    <script src="<c:url value="/resources/main_css/js/owl.carousel.min.js"/>"/></script>
    <script src="<c:url value="/resources/main_css/js/main.js"/>"/></script>
  </body>
</html>