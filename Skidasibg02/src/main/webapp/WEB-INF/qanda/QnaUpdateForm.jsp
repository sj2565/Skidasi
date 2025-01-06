<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common2.jsp"%>
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
			<div class="panel-heading">
				<h4>게시물 수정</h4>
			</div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
				<form:form modelAttribute="qanda" class="form-horizontal" role="form" action="${apppath}/update.qa" method="post">
					<input type="hidden" name="pageNumber" value="${param.pageNumber}">
					<input type="hidden" name="pageSize" value="${param.pageSize}">
					<input type="hidden" name="mode" value="${param.mode}">
					<input type="hidden" name="keyword" value="${param.keyword}">
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="no">글번호</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="fakeno" id="fakeno"								
								   		placeholder="글번호" value="${bean.qnacode}" disabled="disabled">
							<input type="hidden" name="qnacode" id="qnacode" value="${bean.qnacode}">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="writer">작성자</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="fakewriter" id="fakewriter"								
										placeholder="작성자" value="${bean.member_id}" disabled="disabled">
							<input type="hidden" name="member_id" id="member_id" value="${bean.member_id}">							
							<form:errors cssClass="err" path="member_id" />	 
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="qnatitle">글 제목</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="qnatitle" type="text" class="form-control" name="qnatitle" id="qnatitle"								
								placeholder="글 제목" value="${bean.qnatitle}" /> 
							<form:errors cssClass="err" path="qnatitle" /> 
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="qnapaw">비밀 번호</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="qnapaw" type="password" class="form-control" name="qnapaw"
								id="qnapaw" placeholder="비밀 번호를 넣어 주셔용^^" />
								<form:errors cssClass="err" path="qnapaw" />
								</div>
							</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="qnacont">글 내용</label>
						<div class="col-sm-<%=formright%>">
							<textarea path="qnacont" name="qnacont" id="qnacont" rows="5" cols="" 
								placeholder="글 내용" class="form-control" >${bean.qnacont}</textarea> 
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="qnahit">조회수</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="fakeqnahit" id="fakeqnahit"								
								placeholder="조회수" value="${bean.qnahit}" disabled="disabled">
							<input type="hidden" class="form-control" name="qnahit" id="qnahit" value="${bean.qnahit}">							
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="qna_remark">비고</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="qna_remark" type="text" class="form-control" name="qna_remark" id="qna_remark"						
								placeholder="비고" value="${bean.qna_remark}" /> 
							<form:errors cssClass="err" path="qna_remark" /> 
						</div>
					</div>
					
					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit" onclick="return checkForm();">수정하기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="reset" onclick="history.back();">취소</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>