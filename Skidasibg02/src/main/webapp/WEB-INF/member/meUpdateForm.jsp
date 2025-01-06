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
<style type="text/css">
	.form-group{ margin-bottom : 3px; }
</style>
<script type="text/javascript">
	function checkForm() {
		var password = document.myform.password.value;
		//alert( password ) ;
		if (password == null || password == "") {
			alert('비밀번호를 입력하세요.');
			return false;
		}
		//var pw = document.getElementById('pw').value;
        var SC = ["!","@","#","$","%", "^", "&", "*", "(", ")"];
        var check_SC = 0;

        if(password.length < 4 || password.length>10){
        	window.alert('비밀번호는 4글자 이상, 10글자 이하만 이용 가능합니다.');
            document.getElementById('password').value='';
            return false;
        }
        for(var i=0;i<SC.length;i++){
            if(password.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
        } 
        if(check_SC == 0){
            window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
            document.getElementById('password').value='';
            return false;
        }
	}
</script>
</head>
<body>
	<div class="limiter">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading"><h4>회원정보 수정</h4></div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=contextPath%>" />
				<form:form modelAttribute="member" class="form-horizontal" role="form" name="myform" action="${apppath}/update.me" method="post">
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="name" id="name"								
								   		placeholder="이름" value="${requestScope.bean.name}">
							<span class="err">${errname}</span>
						</div>
					</div>					
										
					<div class="form-group">
						<label class="control-label col-sm-3" for="member_id">아이디</label>
						<div class="col-sm-9">
							<input path="member_id" type="text" class="form-control" name="fakeid" id="fakeid"								
								placeholder="아이디" disabled="disabled" value="${requestScope.bean.member_id}" />
							<input type="hidden" name="member_id" id="member_id" value="${requestScope.bean.member_id}" >	
								<span Class="err">${errid}</span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="password">비밀번호</label>
						<div class="col-sm-9">							
							<input type="password" name="password" id="password" 
								placeholder="바꿀 비밀 번호를 넣어 주셔요" class="form-control" value="">
								<span class="err">${errpassword}</span> 
						</div>
					</div>		
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="email">이메일 주소</label>
						<div class="col-sm-9">							
							<input type="text" name="email" id="email" 
								placeholder="E-mail" class="form-control" value="${requestScope.bean.email}">
								<span class="err">${erremail}</span> 
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="phone">전화번호</label>
						<div class="col-sm-9">							
							<input type="phone" name="phone" id="phone" 
								placeholder="ex) 01012345678" class="form-control" value="${requestScope.bean.phone}">
								<span class="err">${errphone}</span> 
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-3" for="birth">생년월일</label>
						<div class="col-sm-9">							
							<input type="text" name="birth" id="birth" 
								placeholder="ex) 19990101" class="form-control" value="${requestScope.bean.birth}">
								<span class="err">${errbirth}</span> 
						</div>
					</div>	
						
					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button type="submit" class="btn btn-default" onclick="return checkForm();"><b>정보수정</b></button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="reset">취소</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>