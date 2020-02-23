<%@ include file="navbar.jsp"%>  

<%@page import="oracle.java.meal_ting.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery와 Postcodify를 로딩한다. 주소찾기 api -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script type="text/javascript">

function idchk() {
	if (!frm.mb_id.value) {
		alert("아이디를 입력한 후에 확인하세요");
		frm.mb_id.focus();
		return false;
	} else location.href="confirmId.do?mb_id="+frm.mb_id.value+"&mb_nickName="+frm.mb_nickName.value;
}

function nickNamechk() {
	if (!frm.mb_nickName.value) {
		alert("닉네임를 입력한 후에 확인하세요");
		frm.mb_nickName.focus();
		return false;
	} else location.href="confirmNickName.do?mb_id="+frm.mb_id.value+"&mb_nickName="+frm.mb_nickName.value;
}	

function pwCheck() {
	/* alert("passCheck  Start.."); */
	if (frm.mb_pw.value != frm.mb_pw_chk.value) {
     	alert("비밀번호와 비밀번호 확인이 틀립니다");
		frm.mb_pw.focus();
		return false;
	} 
	
	var flag = false;
	// checkbox 접근후 체크된 개수 파악   name으로 접근, values는 배열의 형태
	var values = document.getElementsByName("agree");  /* 형태는 배열이 됨 */
	var count = 0;
 	for (var i=0; i<values.length; i++) {
		if(values[i].checked) {
			//alert(values[i].value);
			count++;
		}
	}
	if(count < 3) {
		alert("3개 다 동의하셔야 합니다.");	
	} else {
		// alert(count+" 개 선택했습니다.");	
		flag = true;
	} 
	return flag;	
	
}	

/* 체크박스 전체선택, 전체해제 */
function checkAll(){
      if( $("input[name=agreeall]").is(':checked') ){
        $("input[name=agree]").prop("checked", true);
      }else{
        $("input[name=agree]").prop("checked", false);
      }
}

/* Radio button 성별 입력한 값 체크 */
function sexCheck() {
	var radioVal = $(":input:radio[name=mb_sex]:checked").val();
	alert(radioVal);
}		

$(function() {
	//주소 검색 api
	$("#postcodify_search_button").postcodifyPopUp();	
});	
</script>

<style type="text/css">
.topBtn::after {
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.topBtn {
	background: none;
	border: 3px solid #000;
	border-radius: 5px;
	color: #000;
	font-size: 0.6em;
	font-weight: bold;
	padding: 8px 8px;
	position: relative;
}

.topBtn::before, .topBtn::after {
	background: #000;
	content: '';
	position: absolute;
	z-index: -1;
}

.topBtn:hover {
	color: #fff;
}

.topBtn::after {
	height: 0;
	left: 50%;
	top: 50%;
	width: 0;
}

.topBtn:hover:after {
	height: 100%;
	left: 0;
	top: 0;
	width: 100%;
}

.boundBox {
	border: 2px solid red;
	border-radius: 5px;
}

.titleFont {
	font-size: 1.6em;
	font-weight: bold;
}

.fieldBox, .postcodify_postcode5, .postcodify_address, .postcodify_details {
	background: none;
	border: 2px solid red;
	border-radius: 5px;
	color: #000;
	font-size: 1em;
	font-weight: bold;
	padding: 7px 7px;
	position: relative;
	width: 450px;
}

th {
	font-size: 1.2em;
}
</style>

<title>회원가입 - MEAL-TING</title>
</head>
<body>

<br /><br /><br /><br />
<h2 align="center" class="titleFont" style="font-size:2em;">회원가입 등록</h2>
<br />
<c:if test="${msg!=null}">${msg}</c:if>

<div align="center">
  <div style="width: 1300px;">
     <form action="memberWrite.do" method="get" name="frm" onsubmit="return pwCheck()"> 
		<fieldset class="boundBox">
			<!-- <legend class="titleFont" style="width:10px; font-size:2em;">회원가입 등록</legend> -->
		    <br /><br />
		
				<table>   
					<tr align="center">
						<th>아이디</th>
						<td><input type="text" class="fieldBox" name="mb_id" value="${mb_id }"
							class="postcodify_address" size="30" required></td>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉네임</th>
						<td><input type="text" class="fieldBox" name="mb_nickName" value="${mb_nickName }"
						    class="postcodify_address" size="30" required></td></tr>
				
					<tr>
						<th></th>
						<td><input type="button" value="중복확인" onclick="idchk()"></td>
						<th></th>
						<td><input type="button" value="중복확인" onclick="nickNamechk()"></td></tr>		    
				
					<tr align="center">
						<th>비밀번호</th>
						<td><input type="password" class="fieldBox" name="mb_pw" placeholder="최대 20자리 입니다." 
						    size="20" required></td>	
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인</th>
						<td><input type="password" class="fieldBox" id="mb_pw_chk" placeholder="최대 20자리 입니다." 
						    size="20" required></td></tr>
				
					<tr align="center">
						<th>이름</th>
						<td><input type="text" class="fieldBox" name="mb_name" required></td>	
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진</th>
						<td><input type="text" class="fieldBox" name="mb_imgSrc"></td></tr>
				
					<tr align="center">
						<th>성별</th>
						<td class="fieldBox">
						    <input style="margin:3px" type="radio" name="mb_sex" value="1" checked />남성
				            <input style="margin:3px" type="radio" name="mb_sex" value="2" />여성
				            <input style="margin:3px" type="radio" name="mb_sex" value="9" onclick="sexCheck()" />비공개</td></tr>
				
					<tr align="center">
						<th>전화번호</th>
						<td><input type="text" class="fieldBox" placeholder="010-1234-1234" name="mb_phone" required></td>	
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생년월일</th>
						<td><input type="date" class="fieldBox" name="mb_birthDate" required></td></tr>
				
					<tr align="center">
						<th>이메일</th>
						<td><input type="text" class="fieldBox" name="mb_email"></td></tr>	
						
					<tr align="center">
						<th>주소</th>
						<td align="left" colspan="8">
							<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 --> 
							<input type="text" name="mb_postCode" class="postcodify_postcode5" 
							readonly="readonly" size="4" required style="width: 70px;"> 
							<input type="text" name="mb_addr1" class="postcodify_address" 
							readonly="readonly" size="30" required style="width: 250px;"> 
							<input type="text" name="mb_addr2" class="postcodify_details" 
							placeholder="상세주소 입력" size="40" required style="width: 250px;">
							<button type="button" id="postcodify_search_button"
								style="font-size: 0.9em; font-weight: bold;" class="topBtn">주소검색</button>
						</td>
					</tr>
				</table>
				<br />
				
				<div align="left" style="width: 500px; font-size: 1.2em; font-weight: bold;">
					<input type="checkbox" name="agreeall" value="1" onclick="checkAll()" > 전체동의<br />
			    </div>
				<div align="left" style="width: 500px; font-size: 1em; font-weight: bold;">
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree" value="1"> 이용약관에 동의합니다.<br />
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree" value="2"> 개인정보 처리방침에 동의합니다.<br />
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree" value="3"> 위치기반서비스 이용약관에 동의합니다.<br /><br />
				</div>

				<table>
					<tr>
						<td><button type="submit" style="margin-top: 20px; font-size: 1.6em; font-weight: bold;"
								class="topBtn">저장</button></td>
						<td><button type="button" style="margin-top: 20px; font-size: 1.6em; font-weight: bold;"
							    class="topBtn" onclick="history.back()">돌아가기</button></td></tr>
				</table>
				<br /><br />
		</fieldset>
	 </form>
  </div>	
</div>

</body>

</html>