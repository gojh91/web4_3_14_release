<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${loginMember.mb_nickName} 님 
	<button onclick="location.href='memberUpdateForm.do'">개인정보변경</button>
	<button onclick="location.href='memberLogout.do'">로그아웃</button>
	<c:set var="num" value="${pg.total - pg.start + 1}"></c:set>
	<table>
		<c:forEach var="member" items="${listMember }">
			<tr>
				<td align="center">${num }</td><td align="center">${member.mb_id }</td>
				<td align="center"><a href="memberDetail.do?mb_id=${member.mb_id}">${member.mb_nickName}</a></td>
				<td align="center">${member.mb_pw }</td>
				<td align="center">${member.mb_name }</td>
				<td>${member.mb_imgSrc }</td>
				<td align="center">${member.mb_sex }
				<td>${member.mb_phone }</td>
				<td align="center">${member.mb_birthDate}</td>       <!-- String형일때 Select문에 Format을 표시 -->
				<td>${member.mb_email }</td>
				<td align="center">${member.mb_postCode }</td>
				<td>${member.mb_addr1 }</td>
				<td>${member.mb_addr2 }</td>
				<td>${member.mb_remark }</td>
				<td align="center">${member.mb_authority }</td>
				<td align="center">${member.mb_status }</td>
				<td align="center">${member.mb_regDate}</td>        <!-- String형일때 Select문에 Format을 표시 -->
				<td align="center">${member.mb_wdDate}</td>         <!-- String형일때 Select문에 Format을 표시 -->
				<td><button type="button" class="btn" 
						style="font-size:0.9em; width:110px;" 
						onclick="location.href='memberUpdateForm2.do?mb_id=${member.mb_id}'">회원정보 수정</button></td>	
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="memberList.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="memberList.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="memberList.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
</body>
</html>