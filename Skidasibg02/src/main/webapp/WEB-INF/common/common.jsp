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
	<title>skiDasi</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap" rel="stylesheet">
	<!--===============================================================================================-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/navbar_css/css/style.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/navbar_css/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/navbar_css/css/owl.carousel.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/navbar_css/fonts/icomoon/style.css">
	
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
			color:black;
		}
		.site-navbar-wrap a {
    		color: white;
		}
		.row {
		    border-bottom: 1px solid white;
		}
		body {
			-ms-overflow-style: none; 
		} 
		::-webkit-scrollbar { 
			display: none; 
		} 
	</style>	
</head>
<body>

    <div class="site-navbar-wrap">
      <div class="site-navbar-top">
        <div class="container py-3">
          <div class="row align-items-center">
          
            <div class="col-6">
              <div class="d-flex mr-auto">
                <a href="#" class="d-flex align-items-center mr-4">
                  <span class="icon-envelope mr-2"></span>
                  <span class="d-none d-md-inline-block">info@domain.com</span>
                </a>
                <a href="#" class="d-flex align-items-center mr-auto">
                  <span class="icon-phone mr-2"></span>
                  <span class="d-none d-md-inline-block">+1 234 4567 8910</span>
                </a>
              </div>
            </div>
            
            <div class="col-6 text-right">
              <div class="mr-auto">
                <a href="#" class="p-2 pl-0"><span class="icon-twitter"></span></a>
                <a href="#" class="p-2 pl-0"><span class="icon-facebook"></span></a>
                <a href="#" class="p-2 pl-0"><span class="icon-linkedin"></span></a>
                <a href="#" class="p-2 pl-0"><span class="icon-instagram"></span></a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="site-navbar site-navbar-target js-sticky-header">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-2">
              <h1 class="my-0 site-logo"><a href="#">Skidasi</a></h1>
            </div>
            <div class="col-10">
              <nav class="site-navigation text-right" role="navigation">
                <div class="container">
                  <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
                  <a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>
                  <ul class="site-menu main-menu js-clone-nav d-none d-lg-block">
                    <li class="active"><a href="<%=contextPath%>/main.co" class="nav-link">Home</a></li>
                    
                    <li>
                    <a href="#" class="nav-link">
                    <c:if test="${whologin == 0}">
									LoginCheck
					</c:if>
					<c:if test="${whologin != 0}">
									${sessionScope.loginfo.name}(${sessionScope.loginfo.member_id}) 님
					</c:if>
					</a>
                    </li>
                                           
                    <li class="has-children">
                    <c:if test="${whologin == 1}">
                      <a href="#" class="nav-link">MyPage</a>
                      <ul class="dropdown arrow-top">
                        <li><a href="<%=contextPath%>/list.res" class="nav-link">예약내역</a></li>
                        <li><a href="<%=contextPath%>/update.me?member_id=${sessionScope.loginfo.member_id}">회원 정보 수정</a></li>
						<li><a href="<%=contextPath%>/detailview.me?member_id=${sessionScope.loginfo.member_id}">회원 정보 보기</a></li>
						<li><a href="<%=contextPath%>/delete.me?member_id=${sessionScope.loginfo.member_id}">회원 탈퇴</a></li>
                      </ul>
                    </c:if>  
                    </li>
                    <li class="has-children">
                    <c:if test="${whologin == 2 }">
                      <a href="#" class="nav-link">AdminPage</a>
                      <ul class="dropdown arrow-top">
                        <li><a href="<%=contextPath%>/list.res" class="nav-link">예약확인</a></li>
                        <li><a href="<%=contextPath%>/list.rs" class="nav-link">리조트관리</a></li>
                        <li><a href="<%=contextPath%>/list.pr" class="nav-link">이용권관리</a></li>
                        <li><a href="<%=contextPath%>/list.me">회원 목록 보기</a></li>
						<li><a href="<%=contextPath%>/detailview.me?member_id=${sessionScope.loginfo.member_id}">관리자 상세 보기</a></li>
						<li><a href="<%=contextPath%>/update.me?member_id=${sessionScope.loginfo.member_id}">관리자 정보 수정</a></li>
                      </ul>
                    </c:if>  
                    </li>
                   
                    <li><a href="<%=contextPath%>/search.res" class="nav-link">Search</a></li>
                    <li><a href="<%=contextPath%>/list.bo" class="nav-link">Notice</a></li>
                    <li><a href="<%=contextPath%>/list.qa" class="nav-link">Q&A</a></li>
                    
                    <li>
                    <c:if test="${empty sessionScope.loginfo}">
                    <a href="<%=contextPath%>/login.me" class="nav-link">Login</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.loginfo}">
                    <a href="<%=contextPath%>/logout.me" class="nav-link">Logout</a>
                    </c:if>
                    </li>
                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
   
    <!-- 
    <script src="<c:url value="/resources/navvar_css/js/jquery-3.3.1.min.js"/>"/></script>
    <script src="<c:url value="/resources/navvar_css/js/popper.min.js"/>"/></script>
    <script src="<c:url value="/resources/navvar_css/js/bootstrap.min.js"/>"/></script>
    <script src="<c:url value="/resources/navvar_css/js/jquery.sticky.js"/>"/></script>
    <script src="<c:url value="/resources/navvar_css/js/main.js"/>"/></script>-->
  </body>
</html>