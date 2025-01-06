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
<script type="text/javascript">
	function checkDuplicateId(){
		var member_id = document.myform.member_id.value ;
		if( member_id.length == 0 ){
			alert('아이디를 입력해 주세요') ;
			document.myform.id.focus() ; 
			return false ;
		}
		var url='<%=contextPath%>/idcheck.me?member_id=' + member_id ;
		window.open(url, 'mywin', 'height=150,width=300') ;
	}
	
	function findZipcode( ){
		var url='<%=contextPath%>/zipcheck.me';
		window.open(url, 'mywin',
			'height=600,width=720,status=yes,scrollbars=yes,resizable=no');
	}
		
	function isCheckFalse() {
		document.myform.isCheck.value = false;
	}
	
	function checkForm() {
		var isCheck = document.myform.isCheck.value;
		var name = document.myform.name.value;
		var pw = document.getElementById('pw').value;
		var pw2 = document.getElementById('pw2').value;
		var email = document.myform.email.value;
		var phone = document.myform.phone.value;
		var birth = document.myform.birth.value;
	
		//alert( isCheck ) ;
		if (isCheck == 'false') {
			alert('아이디 중복 체크를 우선 해주세용.');
			return false;
		}else if (name == null || name == ""){
			alert('이름을 입력해주세용.');
			return false;
		}else if (pw == null || pw == ""){
			alert('비밀번호 입력해주세용.');
			return false;
		}else if (pw2 == null || pw2 == ""){
			alert('비밀번호 확인을 해주세용.');
			return false;	
		}else if (email == null || email == ""){
			alert('이메일을 입력해주세용.');
			return false;
		}else if (phone == null || phone == ""){
			alert('핸드폰 번호를 입력해주세용.');
			return false;
		}else if (birth == null || birth == ""){
			alert('생년월일을 입력해주세용.');
			return false;
		}else if (pw != pw2){
			alert('비밀번호를 일치시켜주세용.');
			return false;
		}
	}
		
	function check_pw(){
		 var pw = document.getElementById('pw').value;
         var SC = ["!","@","#","$","%", "^", "&", "*", "(", ")"];
         var check_SC = 0;

         if(pw.length < 4 || pw.length>10){
             window.alert('비밀번호는 4글자 이상, 10글자 이하만 이용 가능합니다.');
             document.getElementById('pw').value='';
         }
         for(var i=0;i<SC.length;i++){
             if(pw.indexOf(SC[i]) != -1){
                 check_SC = 1;
             }
         }
         if(check_SC == 0){
             window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
             document.getElementById('pw').value='';
         }
         if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
             if(document.getElementById('pw').value==document.getElementById('pw2').value){
                 document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                 document.getElementById('check').style.color='blue';
             }
             else{
                 document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                 document.getElementById('check').style.color='red';
             }
         }
	}
</script>
</head>
<body>
	<div class="limiter">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<h4>회원가입</h4>
			</div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
				<form:form modelAttribute="member" id="myform" name="myform" class="form-horizontal" role="form"
					action="${apppath}/insert.me" method="post">
					<input type="hidden" name="isCheck" value="false"> 
					
					<div class="form-group">
						<label for="id"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">아이디</label>
						<div class="col-xs-<%=formright - 3%> col-lg-<%=formright - 2%>">
							<form:input path="member_id" type="text" name="member_id" id="member_id" class="form-control"
								placeholder="아이디" value="${requestScope.bean.id}"
								onkeyup="isCheckFalse();"/> 
								<form:errors cssClass="err" path="member_id" />
						</div>
						<div class="col-xs-<%=2%> col-lg-<%=2%>" align="center">
							<input type="button" class="btn btn-default" value="아이디 검사"
								onclick="checkDuplicateId();">
						</div>
					</div>
					
					<div class="form-group">
						<label for="name"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">이름</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="name" type="text" name="name" id="name" class="form-control"
								placeholder="이름" value="${requestScope.bean.name}"/>
								<form:errors cssClass="err" path="name" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="password"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">비밀번호</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="password" type="password" name="password" id="pw"
								class="form-control" placeholder="비밀번호"
								value="" onchange="check_pw();"/> 
							<form:errors cssClass="err"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="password"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">비밀번호 확인</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<input path="pw2" type="password" name="pw2" id="pw2"
								class="form-control" placeholder="비밀번호 확인"
								value="" onchange="check_pw();"/>
								&nbsp;<span id="check"></span>
						</div>
					</div>
					
					<div class="form-group">
						<label for="salary"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">이메일</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="email" type="text" name="email" id="email"
								class="form-control" placeholder="이메일"
								value="${requestScope.bean.salary}"/> 
								<form:errors cssClass="err" path="email" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="salary"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">핸드폰</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="phone" type="text" name="phone" id="phone"
								class="form-control" placeholder="핸드폰"
								value="${requestScope.bean.salary}"/> 
								<form:errors cssClass="err" path="phone" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="salary"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">생년월일</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<form:input path="birth" type="text" name="birth" id="birth"
								class="form-control" placeholder="생년월일"
								value="${requestScope.bean.salary}"/> 
								<form:errors cssClass="err" path="birth" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-<%=twelve%> col-lg-<%=twelve%>" align="center">
							<button type="submit" class="btn btn-default"
								onclick="return checkForm();">
								<b>회원 가입</b>
							</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//alert('dd') ;
			$(".datepicker").datepicker();
			$("#spanid").addClass('good-result');
		});
	</script>
</body>
</html>