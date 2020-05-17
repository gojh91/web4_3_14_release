<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="go.home.project.model.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String context = request.getContextPath();
	Member member = (Member)request.getAttribute("member");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery와 Postcodify를 로딩한다. 주소찾기 api -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script type="text/javascript">
	var flag = false;
	function validCheck() {
		if(flag == false){
			alert("Check duplicate");
		}
		return flag;
	}
	function nickNamechk() { 
		var nickName = '<%= member.getMb_nickName()%>'
		if(nickName != frm.mb_nickName.value){
			$.ajax({	
				url : "<%=context%>/LoginRest/nickNameChk.do",
				data : {mb_nickName : frm.mb_nickName.value},
				success : function(data) {
					if (data != 0){
						alert("Nickname is duplicate");
					}else{
						alert("Nickname is available");
						flag = true;
					}
				}
			});
		} else {
			alert("Nickname is available");
			flag = true;
		}
	}
	$(function() {
		//주소 검색 api
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="memberUpdate.do" method="post" name="frm"
		onsubmit="return validCheck()">
		<table>
			<tr align="center">
				<th>아이디</th>
				<td><input type="text" class="fieldBox" name="mb_id"
					value="${member.mb_id }" class="postcodify_address"
					readonly="readonly"></td>
				<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉네임</th>
				<td><input type="text" class="fieldBox" name="mb_nickName"
					value="${member.mb_nickName }" class="postcodify_address" size="30"
					required></td>
			</tr>

			<tr>
				<th></th>
				<td></td>
				<th></th>
				<td><input type="button" value="중복확인" onclick="nickNamechk()"></td>
			</tr>

			<tr align="center">
				<th>비밀번호</th>
				<td><input type="password" class="fieldBox" name="mb_pw"
					placeholder="비밀번호를 입력하세요." size="20" required></td>
			</tr>

			<tr align="center">
				<th>이름</th>
				<td><input type="text" class="fieldBox" name="mb_name"
					value="${member.mb_name }" required></td>
				<!--
				<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진</th>
							<td><input type="text" class="fieldBox" id="imgsrc" name="mb_imgSrc" value="${member.mb_imgSrc}"></td>
							<td><button type="button" id="uploadBtn"
							         style="font-size: 0.95em; font-weight: bold;" class="topBtn">이미지 첨부</button></td>
			    <td>
			         <img src="${pageContext.request.contextPath}/upload/${member.mb_imgSrc}" 
			             style="margin-left: 10px; height: 110px; width: 110px;"></td>
			    -->
			</tr>
			<tr align="center">
				<th>성별</th>
				<td class="fieldBox"><input type="radio" name="mb_sex"
					value="1"
					<c:if test="${member.mb_sex eq '1'}">checked = "checked"</c:if>>남성
					<input type="radio" name="mb_sex" value="2"
					<c:if test="${member.mb_sex eq '2'}">checked = "checked"</c:if>>여성
					<input type="radio" name="mb_sex" value="9"
					<c:if test="${member.mb_sex eq '9'}">checked = "checked"</c:if>>비공개
				</td>
			</tr>

			<tr align="center">
				<th>전화번호</th>
				<td><input type="text" class="fieldBox" name="mb_phone"
					placeholder="010-1234-1234" value="${member.mb_phone }" required></td>
				<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생년월일</th>
				<td><input type="date" class="fieldBox" name="mb_birthDate"
					value="${member.mb_birthDate }" required></td>
			</tr>

			<tr align="center">
				<th>이메일</th>
				<td><input type="text" class="fieldBox" name="mb_email"
					value="${member.mb_email }"></td>
			</tr>

			<tr align="center">
				<th>주소</th>
				<td align="left" colspan="8">
					<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 --> <input
					type="text" name="mb_postCode" value="${member.mb_postCode }"
					class="postcodify_postcode5" readonly="readonly" size="4" required
					style="width: 70px;"> <input type="text" name="mb_addr1"
					value="${member.mb_addr1 }" class="postcodify_address"
					readonly="readonly" size="30" required style="width: 250px;">
					<input type="text" name="mb_addr2" value="${member.mb_addr2 }"
					class="postcodify_details" placeholder="상세주소 입력" size="40" required
					style="width: 250px;">
					<button type="button" id="postcodify_search_button"
						style="font-size: 0.9em; font-weight: bold;" class="topBtn">주소검색</button>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td><button type="submit" style="margin-top: 20px;"
						class="topBtn" >저장</button></td>
				<td><button type="button" style="margin-top: 20px"
						class="topBtn"
						onclick="location.href='memberDeleteForm.do?mb_id=${member.mb_id}'">삭제</button></td>
				<td><button type="button" style="margin-top: 20px"
						class="topBtn" onclick="history.back()">돌아가기</button></td>
			</tr>
		</table>
		<br />
	</form>
</body>
</html>