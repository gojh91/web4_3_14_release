<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String navbar = request.getContextPath() + "/resources/navbar/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=navbar%>css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=navbar%>css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=navbar%>css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=navbar%>css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=navbar%>css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=navbar%>css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=navbar%>css/style.css" type="text/css">
</head>
<body>
	<div>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Search model -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form" action="search.do">
				<input type="text" name = "keyword" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="inner-header">
                <div class="logo">
                    <a href="./index.html"><img src="<%=navbar%>img/logo.jpg" alt=""></a>
                </div>
                <div class="header-right">
                    <img src="<%=navbar%>img/icons/search.png" alt="" class="search-trigger">
                    <img src="<%=navbar%>img/icons/man.png" alt="">
                    <a href="#">
                        <img src="<%=navbar%>img/icons/bag.png" alt="">
                        <span>2</span>
                    </a>
                </div>
                <div class="user-access">
                	<c:if test="${checkLogin == 1}">
                		<%-- <a>${loginMember.mb_nickName}</a> --%>
						<a onclick="location.href='memberLogout.do'">Logout</a>
					</c:if>
					<c:if test="${checkLogin != 1}">
						<a onclick="location.href='login.do'">Sign in</a>
						<a class="in" onclick="location.href='memberWriteForm.do'">Register</a>
					</c:if>
                    
                </div>
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a class="active" href="./index.html">Home</a></li>
                        <li><a href="./categories.html">Social</a>
                            <ul class="sub-menu">
                                <li><a href="memberBoardList.do">Social Network</a></li>
                                <li><a href="shopping-cart.html">Chat</a></li>
                                <li><a href="check-out.html">List</a></li>
                            </ul>
                        </li>
                        <li><a href="reviewList.do">Review</a></li>
                        <li><a href="./check-out.html">About</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    </div>
    <script src="<%=navbar%>js/jquery-3.3.1.min.js"></script>
    <script src="<%=navbar%>js/bootstrap.min.js"></script>
    <script src="<%=navbar%>js/jquery.magnific-popup.min.js"></script>
    <script src="<%=navbar%>js/jquery.slicknav.js"></script>
    <script src="<%=navbar%>js/owl.carousel.min.js"></script>
    <script src="<%=navbar%>js/jquery.nice-select.min.js"></script>
    <script src="<%=navbar%>js/mixitup.min.js"></script>
    <script src="<%=navbar%>js/main.js"></script>
</body>
</html>