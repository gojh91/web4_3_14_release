<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="review" items="${reviewList}" varStatus="status">
		<h4 class="title">
			<a href="reviewDetail.do?bd_num=${review.bd_num}">${review.bd_title}</a>
		</h4>
		<ul class="post-footer">
			<li><a><i id="likeBtn" class="ion-heart" style="color: red;"
					onclick="location.href='JYaddLikeCnt.do?bd_num=${review.bd_num}'"></i>${review.bd_likeCnt}</a></li>
			<li><a><i class="ion-chatbubble" style="color: red;"></i>${review.bd_replyCnt}</a></li>
			<li><a><i class="ion-calendar" style="color: red;"></i> 
			<fmt:parseDate var="parsedRegDate" pattern="yyyy-MM-dd HH:mm:SS.s" value="${review.bd_regDate}" /> 
			<fmt:formatDate	value="${parsedRegDate}" pattern="yy-MM-dd" /></a></li>
		</ul>
	</c:forEach>
</body>
</html>