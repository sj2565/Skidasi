<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common2.jsp"%>
<%-- 스프링 관련 설정 코드 --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 3 ;
	int formright = twelve - formleft ; 
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
</style>
</head>
<body>
	<div class="limiter">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading"><h4>이용권정보 수정</h4></div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
				<form:form modelAttribute="price" id="myform" name="myform" class="form-horizontal" role="form" action="${apppath}/update.pr" method="post">
					<div class="form-group">
						<input type="hidden" name="pr_no" id="pr_no" value="${bean.pr_no}">
						<input type="hidden" name="resort_no" id="resort_no" value="${bean.resort_no}">
						<label for="id" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">리조트 이름</label>
						<div class="col-xs-<%=formright - 2%> col-lg-<%=formright - 2%>">
							<input type="text" name="resort_name" id="resort_name" 
									class="form-control" value="${bean.resort_name }" readonly="readonly"/> 
						</div>
					</div>
					<div class="form-group">
						<label for="pr_hour" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">이용시간</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:select path="pr_hour" itemValue="4">
								<form:option value="" disabled="disabled">선택해주세요.</form:option>
								<form:option value="4">4시간</form:option>
								<form:option value="6">6시간</form:option>
								<form:option value="8">8시간</form:option>
							</form:select>
							<form:errors cssClass="err" path="pr_hour"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="pr_aorc" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">구분</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:select path="pr_aorc" id="pr_aorc" name="pr_aorc" >
								<form:option value="ad">성인</form:option>
								<form:option value="ch">소인</form:option>
							</form:select>
							<form:errors cssClass="err" path="pr_aorc"/>
						</div>
					</div>
							
					<div class="form-group">
						<label for="pr_price" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">가격</label>
							<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input type="text" path="pr_price" id="pr_price" name="pr_price" value="${bean.pr_price }"/>
							<form:errors cssClass="err" path="pr_price"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-<%=twelve%> col-lg-<%=twelve%>" align="center">
							<button type="submit" class="btn btn-default">
								<b>이용권 수정</b>
							</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-default" onclick="history.back();">초기화</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>