<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="resinfo" items="${reslist}">
		<a href="HgresInfo.do?res_num=${resinfo.getRes_num()}">
			<div id="search_resinfoboard_result">
				<div id="search_resinfoboard_result_left">
					<%-- <img src="${pageContext.request.contextPath}${board.getBd_imgSrc()}" --%>
					<img
						src="${pageContext.request.contextPath}${resinfo.getRes_imgSrc1()}"
						style="margin: 20px 45px; height: 110px; width: 110px;">
				</div>
				<div id="search_resinfoboard_result_right">
					<p style="font-weight: bold; font-size: 18px">${resinfo.getRes_name()}</p>
					<p>${resinfo.getRes_phone()}</p>
					<p>${resinfo.getRes_foodType()}
					<p>주차공간 : ${resinfo.getRes_parking()}</p>
					<p>${resinfo.getRes_addr()}</p>
				</div>
			</div>
		</a>

	</c:forEach>

</body>
</html>