<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- whologin 변수는 로그인 상태를 저장하고 있는 변수입니다. -->
<c:set var="whologin" value="0" />
<c:if test="${empty sessionScope.loginfo}">
	<!-- 로그인 하지 않은 경우 -->
	<c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.member_id == 'admin'}">
		<!-- 관리자로 로그인한 경우 -->
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.member_id != 'admin'}">
		<!-- 일반 사용자로 로그인한 경우 -->
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>

<!-- 부트 스트랩 -->
<% int twelve = 12 ; %>
<c:set var="twelve" value="12" />
<%!
	String YesForm = null ;
	String NoForm = null ;
%>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/Shopping"; //서블릿에 정의되어 있슴
	
	//폼 태그에서 사용할 변수
	//YesForm = contextPath + mappingName ;
	
	//폼이 아닌 곳에서 사용할 변수
	//NoForm = contextPath + mappingName + "?command=" ;
%>
<%	
	// 파일 업로드 관련
	String myurl = request.getRequestURL().toString() ;
	String uri = request.getRequestURI() ;
	int idx = myurl.indexOf( uri ) ;	
	//웹서버에 올릴 이미지의 저장 경로 
	String uploadPath = "/uploadimg" ;//개발자가 임의 지정 가능
	String uploadedFolder 
		= myurl.substring(0, idx) + contextPath + uploadPath ;	
	String realPath = application.getRealPath( uploadPath ) ;
%>
<%
	/* out.print( "YesForm : " + YesForm + "<br>") ;
	out.print( "NoForm : " + NoForm + "<br>") ;
	out.print( "myurl : " + myurl + "<br>") ;
	out.print( "uploadedFolder : " + uploadedFolder + "<br>") ;
	out.print( "realPath : " + realPath + "<br>") ; */ 
%>
<%!
	String MakeCommand(String ... args){
		if( args.length == 0 ){
			return YesForm  ;
		}else if( args.length == 1 ){
			return YesForm + "?command=" + args[0]   ;	
		}else{
			String imsi = args[1] ;
			return YesForm + "?command=" + args[0] + "&" + imsi  ;
		}
	}
%>
<c:set var="uploadPath" value="<%=uploadPath%>" scope="application"/> 

<c:set var="contextPath" value="<%=contextPath%>" scope="application"/> 

<!DOCTYPE>
<html>
<head>
	<title>SkiDasi</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		/* 유효성 검사시 보여 주는 빨간색 글자를 위한 스타일 입니다. */
		.err{ 
			font-size : 10pt;
			color:red;
			font-weight: bolder;
		}
		#myalert{ 
			font-size : 15px;
			margin-top: 7px;
			margin-right: 20px;
			color:blue;
		}
		.navbar-inverse {
		    background-color: #6c7ae0;
		    border-color: black;
		    font-color: black;
		}
		.navbar-inverse .navbar-nav>li>a {
    		color: white;
		}
		.navbar-inverse .navbar-brand {
			color: blue;
		}
		.navbar .navbar-nav > li > a:hover,
		.navbar .navbar-nav > li > a:focus,
		.navbar .navbar-nav > .active > a:hover,
		.navbar .navbar-nav > .active > a:focus {
    		color: black;
		}
		body {
			-ms-overflow-style: none; 
		} 
		::-webkit-scrollbar { 
			display: none; 
		}
		.navbar-inverse {
    		margin-bottom: 0;
		}
	</style>	
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=contextPath%>/main.co">
				<i class="fa fa-snowflake-o" aria-hidden="true">SkiDasi</i></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li>
						<a href="#" class="dropdown-toggle"> 
						<i class="fa fa-user-circle-o" aria-hidden="true">
							<font style= color:white>
								<c:if test="${whologin == 0}">
									미로그인
								</c:if> 
								<c:if test="${whologin != 0}">
									${sessionScope.loginfo.name}(${sessionScope.loginfo.member_id}) 님
								</c:if>
							</font>
						</i>	
						</a>
					</li>
					<li class="dropdown"><a href="<%=contextPath%>/search.res"><i class="fa fa-search" aria-hidden="true">검색</i></a></li>
					<li class="dropdown"><a href="<%=contextPath%>/list.bo"><i class="fa fa-bell" aria-hidden="true">공지사항</i></a></li>
					<li class="dropdown"><a href="<%=contextPath%>/list.qa"><i class="fa fa-question-circle-o" aria-hidden="true">질문</i></a></li>
					<c:if test="${whologin == 1}">	<!-- 일반회원 전용 메뉴 -->
					
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars" aria-hidden="true">마이페이지<b class="caret"></b></i></a>
						<ul class="dropdown-menu">
							<li>
								<a href="<%=contextPath%>/list.res">예약내역</a>
							</li>
							<li>
								<a href="<%=contextPath%>/update.me?member_id=${sessionScope.loginfo.member_id}">회원 정보 수정</a>
							</li>
							<li>
								<a href="<%=contextPath%>/detailview.me?member_id=${sessionScope.loginfo.member_id}">회원 정보 보기</a>
							</li>
							<li>
								<a href="<%=contextPath%>/delete.me?member_id=${sessionScope.loginfo.member_id}">회원 탈퇴</a>
							</li>
						</ul>
					</li>
					</c:if>
					<c:if test="${whologin == 2}"> <!-- 관리자 전용 메뉴 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars" aria-hidden="true">관리자메뉴<b class="caret"></b></i></a>
						<ul class="dropdown-menu">
							<li>
								<a href="<%=contextPath%>/list.res">예약내역확인</a>
							</li>
							<li>
								<a href="<%=contextPath%>/list.rs">리조트관리</a>
							</li>
							<li>
								<a href="<%=contextPath%>/list.pr">이용권관리</a>
							</li>
							<li>
								<a href="<%=contextPath%>/list.me">회원 목록 보기</a>
							</li>
							<li>
								<a href="<%=contextPath%>/detailview.me?member_id=${sessionScope.loginfo.member_id}">관리자 상세 보기</a>
							</li>
							<li>
								<a href="<%=contextPath%>/update.me?member_id=${sessionScope.loginfo.member_id}">관리자 정보 수정</a>
							</li>
						</ul>
					</li>
					</c:if>		
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><c:if test="${empty sessionScope.loginfo}">
							<a href="<%=contextPath%>/login.me"><span
								class="glyphicon glyphicon-log-in"> 로그인 </span> </a>
						</c:if> <c:if test="${not empty sessionScope.loginfo}">
							<a href="<%=contextPath%>/logout.me"><span
								class="glyphicon glyphicon-log-in"> 로그아웃 </span> </a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>
	<c:if test="${not empty requestScope.errmsg}">
		<div class="alert alert-danger alert-dismissable">
    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">닫기</a>
    		<strong>${requestScope.errmsg}</strong>
		</div>
	</c:if>
	
	<c:if test="${not empty sessionScope.errmsg}">
		<div class="alert alert-danger alert-dismissable">
    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">닫기</a>
    		<strong>${sessionScope.errmsg}</strong>
		</div>		
		<c:remove var="errmsg" scope="session"/> 
	</c:if>
	
	<c:if test="${not empty sessionScope.message}">
		<script type="text/javascript">
			/* alert('${sessionScope.message}') ;	 */ 
		</script>
		<% session.removeAttribute("message") ; %>
	</c:if>
</body>
</html>