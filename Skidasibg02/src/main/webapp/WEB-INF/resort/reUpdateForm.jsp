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
<script type="text/javascript">
function checkForm() {
	var resort_name = document.myform.resort_name.value;
	if (resort_name == '' || resort_name == null) {
		alert('리조트 이름을 입력하세요.');
		return false;
	}
	
	var resort_area = document.myform.resort_area.value;
	if (resort_area == '' || resort_area == null) {
		alert('면적을 입력하세요.');
		return false;
	}
	
	var resort_tel = document.myform.resort_tel.value;
	if (resort_tel == '' || resort_tel == null) {
		alert('전화번호를 입력하세요.');
		return false;
	}
	var resort_addr = document.myform.resort_addr.value;
	if (resort_addr == '' || resort_addr == null) {
		alert('주소를 입력하세요.');
		return false;
	}
	
	var resort_cont = document.myform.resort_cont.value;
	if(resort_cont == '' || resort_cont == null){
		alert('리조트 설명을 입력하세요.');
		return false;
	}
	
	var resort_img = document.myform.resort_img.value;
	if(resort_img == '' || resort_img == null){
		alert('이미지를 첨부하세요.');
		return false;
	}
	
}
</script>
</head>
<body>
	<div class="limiter">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading"><h4>리조트 수정</h4></div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
		<form:form modelAttribute="resort" id="myform" name="myform" class="form-horizontal" role="form"
					action="${apppath}/update.rs" method="post" enctype="multipart/form-data">
					<div class="form-group">
					<input type="hidden" id="resort_no" name="resort_no" value="${bean.resort_no }">
						<label for="resort_name" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">리조트 이름</label>
						<div class="col-xs-<%=formright - 2%> col-lg-<%=formright - 2%>">
							<form:input path="resort_name" type="text" name="resort_name" id="resort_name" class="form-control"
								placeholder="리조트 이름" value="${bean.resort_name}"
								onkeyup="isCheckFalse();"/> 
								<form:errors cssClass="err" path="resort_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="resort_area"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">면적</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="resort_area" type="text" name="resort_area" id="resort_area" class="form-control"
								placeholder="면적" value="${bean.resort_area}"/>
								<form:errors cssClass="err" path="resort_area" />
						</div>
					</div>
					<div class="form-group">
						<label for="resort_tel"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">전화 번호</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="resort_tel" type="text" name="resort_tel" id="resort_tel"
								class="form-control" placeholder="전화 번호를 넣어 주세요." value="${bean.resort_tel}" /> 
							<form:errors cssClass="err" path="resort_tel" />
						</div>
					</div>
					<div class="form-group">
						<label for="resort_addr" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">주소</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="resort_addr" type="text" name="resort_addr" id="resort_addr"
								class="form-control" placeholder="주소"
								value="${bean.resort_addr}"/> 
								<form:errors cssClass="err" path="resort_addr" />
						</div>
					</div>
					<div class="form-group">
						<label for="resort_cont" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">소개글</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<textarea path="resort_cont" name="resort_cont" id="resort_cont" rows="5" cols="" 
								placeholder="글 내용" class="form-control" >${bean.resort_cont }</textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="resort_cont" class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">등록된 이미지</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<img src="<%=uploadedFolder%>/${bean.resort_img}" width="200" height="200" alt="저장된 이미지가 없습니다.">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="resort_img">바꿀 이미지</label>
						<div class="col-sm-<%=formright%>">
							<!-- name바꾸면 업로드 안됨! 변경금지 -->
							<input type="file" class="form-control" name="imgfile" id="resort_img">
							<form:errors cssClass="err" path="resort_img" />							
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-<%=twelve%> col-lg-<%=twelve%>" align="center">
							<button type="submit" class="btn btn-default"
								onclick="return checkForm();">
								<b>리조트 정보 수정</b>
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-default" onclick="history.back();">취소</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>