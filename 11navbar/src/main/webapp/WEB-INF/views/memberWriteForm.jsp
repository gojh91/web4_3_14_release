<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String context = request.getContextPath(); /* /project */
	String signupcontext = context + "/resources/signup/";
%>
<link
	href="<%=signupcontext%>vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=signupcontext%>vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="<%=signupcontext%>vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link href="<%=signupcontext%>vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="<%=signupcontext%>css/main.css" rel="stylesheet" media="all">



<script type="text/javascript">
	var iddupl = false;
	var nickdupl = false;
	function validCheck() {

		if (frm.mb_pw.value != frm.mb_pw_chk.value) {
			alert("비밀번호와 비밀번호 확인이 틀립니다");
			frm.mb_pw.focus();
			return false;
		}

		var flag = false;
		// checkbox 접근후 체크된 개수 파악   name으로 접근, values는 배열의 형태
		/* var value = document.getElementsByName("agree"); */ /* 형태는 배열이 됨 */
		var agreeall = document.getElementById("agreeall");
		var count = 0;
		/* for (var i = 0; i < values.length; i++) {
			if (values[i].checked) {
				//alert(values[i].value);
				count++;
			}
		} */
		if (!agreeall.checked) {
			alert("개인 정보 처리에 동의하셔야 합니다.");
		}
		/* if (count < 3) {
			alert("3개 다 동의하셔야 합니다.");
		} */ else {
			if(iddupl == false){
				alert("ID 중복확인 하십시오");
			}else{
				if(nickdupl == false){
					alert("닉네임 중복확인 하십시오");
				}else{
					flag = true;
				}
			}
			
		}
		return flag;
	}
	
	/* 체크박스 전체선택, 전체해제 */
	/* function checkAll(){
	      if( $("input[name=agreeall]").is(':checked') ){
	        $("input[name=agree]").prop("checked", true);
	      }else{
	        $("input[name=agree]").prop("checked", false);
	      }
	}
	 */
	function nickNamechk() {
		if (!frm.mb_nickName.value) {
			alert("닉네임를 입력한 후에 확인하세요");
			frm.mb_nickName.focus();
		} else {
			$.ajax({	
				url : "<%=context%>/LoginRest/nickNameChk.do",
				data : {
					mb_nickName : frm.mb_nickName.value
				},
				success : function(data) {
					if (data != 0) {
						alert("Nickname is duplicate");
					} else {
						alert("Nickname is available");
						nickdupl = true;
					}
				}
			});
		}
	}
	
	function idchk() {
		if (!frm.mb_id.value) {
			alert("아이디를 입력한 후에 확인하세요");
			frm.mb_id.focus();
			return false;
		} else {
			$.ajax({	
				url : "<%=context%>/LoginRest/idChk.do",
				data : {
					mb_id : frm.mb_id.value
				},
				success : function(data) {
					if (data != 0) {
						alert("ID is duplicate");
					} else {
						alert("ID is available");
						iddupl = true;
					}
				}
			});
		}
	}
	function addressapi() {
		$("#postcodify_search_button").postcodifyPopUp();
		/* document.getElementById("postcodify_search_button").postcodifyPopUp(); */
	}
	/* $(function() {
		//주소 검색 api
		$("#postcodify_search_button").postcodifyPopUp();
	}); */
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <form action="memberWrite.do" method="post" name="frm"
		onsubmit="return validCheck()">
		<fieldset class="boundBox">
			<!-- <legend class="titleFont" style="width:10px; font-size:2em;">회원가입 등록</legend> -->
			<br /> <br />

			<table>
				<tr align="center">
					<th>아이디</th>
					<td><input type="text" class="fieldBox" name="mb_id"
						value="${mb_id }" class="postcodify_address" size="30" required></td>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉네임</th>
					<td><input type="text" class="fieldBox" name="mb_nickName"
						value="${mb_nickName }" class="postcodify_address" size="30"
						required></td>
				</tr>

				<tr>
					<th></th>
					<td><input type="button" value="중복확인" onclick="idchk()"></td>
					<th></th>
					<td><input type="button" value="중복확인" onclick="nickNamechk()"></td>
				</tr>

				<tr align="center">
					<th>비밀번호</th>
					<td><input type="password" class="fieldBox" name="mb_pw"
						placeholder="최대 20자리 입니다." size="20" required></td>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인</th>
					<td><input type="password" class="fieldBox" id="mb_pw_chk"
						placeholder="최대 20자리 입니다." size="20" required></td>
				</tr>

				<tr align="center">
					<th>이름</th>
					<td><input type="text" class="fieldBox" name="mb_name"
						required></td>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진</th>
					<td><input type="text" class="fieldBox" name="mb_imgSrc"></td>
				</tr>

				<tr align="center">
					<th>성별</th>
					<td class="fieldBox"><input style="margin: 3px" type="radio"
						name="mb_sex" value="1" checked />남성 <input style="margin: 3px"
						type="radio" name="mb_sex" value="2" />여성 <input
						style="margin: 3px" type="radio" name="mb_sex" value="9"
						onclick="sexCheck()" />비공개</td>
				</tr>

				<tr align="center">
					<th>전화번호</th>
					<td><input type="text" class="fieldBox"
						placeholder="010-1234-1234" name="mb_phone" required></td>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생년월일</th>
					<td><input type="date" class="fieldBox" name="mb_birthDate"
						required></td>
				</tr>

				<tr align="center">
					<th>이메일</th>
					<td><input type="text" class="fieldBox" name="mb_email"></td>
				</tr>

				<!-- <tr align="center">
					<th>주소</th>
					<td align="left" colspan="8">
						주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 <input
						type="text" name="mb_postCode" class="postcodify_postcode5"
						readonly="readonly" size="4" required style="width: 70px;">
						<input type="text" name="mb_addr1" class="postcodify_address"
						readonly="readonly" size="30" required style="width: 250px;">
						<input type="text" name="mb_addr2" class="postcodify_details"
						placeholder="상세주소 입력" size="40" required style="width: 250px;">
						<button type="button" id="postcodify_search_button"
							style="font-size: 0.9em; font-weight: bold;" class="topBtn" onclick="addressapi()">주소검색</button>
					</td>
				</tr> -->
			</table>
			<br />

			<div align="left"
				style="width: 500px; font-size: 1.2em; font-weight: bold;">
				<input type="checkbox" name="agreeall" value="1"
					onclick="checkAll()"> 전체동의<br />
			</div>
			<div align="left"
				style="width: 500px; font-size: 1em; font-weight: bold;">
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree"
					value="1"> 이용약관에 동의합니다.<br /> &nbsp;&nbsp;&nbsp;&nbsp;<input
					type="checkbox" name="agree" value="2"> 개인정보 처리방침에 동의합니다.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree"
					value="3"> 위치기반서비스 이용약관에 동의합니다.<br /> <br />
			</div>

			<table>
				<tr>
					<td><button type="submit"
							style="margin-top: 20px; font-size: 1.6em; font-weight: bold;"
							class="topBtn">저장</button></td>
					<td><button type="button"
							style="margin-top: 20px; font-size: 1.6em; font-weight: bold;"
							class="topBtn" onclick="history.back()">돌아가기</button></td>
				</tr>
			</table>
			<br /> <br />
		</fieldset>
	</form> --%>
	<div class="page-wrapper p-t-100 p-b-100 font-robo">
		<div class="wrapper wrapper--w680">
			<div class="card card-1">
				<div class="card-body">
					<h2 class="title">Registration</h2>
					<form action="memberWrite.do" method="post" name="frm"
						onsubmit="return validCheck()">
						<div class="row row-space" display='inline'>
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1" type="text" placeholder="ID"
										name="mb_id" value="${mb_id}" required> <input
										class="input-icon" type="checkbox"
										style="float: right; width: 12.8px;" onclick="idchk()">
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1" type="text"
										placeholder="NICK NAME" name="mb_nickName"
										value="${mb_nickName }" required> <input
										class="input-icon" type="checkbox"
										style="float: right; width: 12.8px;" onclick="nickNamechk()">
								</div>
							</div>
						</div>
						<div class="row row-space" display='inline'>
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1" type="password"
										placeholder="PASSWORD" name="mb_pw" required>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1" type="password"
										placeholder="PASSWORD CONFIRM" id="mb_pw_chk" required>
								</div>
							</div>
						</div>
						<div class="row row-space" display='inline'>
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1" type="text" placeholder="NAME"
										name="mb_name" required>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1" type="text"
										placeholder="000-0000-0000" name="mb_phone" required>
								</div>
							</div>
						</div>
						<div class="input-group">
							<input class="input--style-1" type="text" placeholder="E-MAIL"
								name="mb_email" required>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1 " type="date"
										placeholder="BIRTHDATE" name="mb_birthDate" required> <!-- <i
										class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i> -->
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<div class="rs-select2 js-select-simple select--no-search">
										<select name="mb_sex" required>
											<option disabled="disabled" selected="selected">GENDER</option>
											<option value = "1">Male</option>
											<option value = "2">Female</option>
											<option value = "9">Secret</option>
										</select>
										<div class="select-dropdown"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<input class="postcodify_postcode5 input--style-1"
										readonly="readonly" type="text" placeholder="ADDRESS"
										name="mb_postCode" required> <input type="button"
										class="input-icon" id="postcodify_search_button"
										onclick="addressapi()" value="SEARCH"
										style="float: right; width: 80px; height: 30px;">
								</div>
							</div>
						</div>
						<div class="input-group">
							<input class="postcodify_address input--style-1"
								readonly="readonly" type="text" name="mb_addr1" required>
						</div>
						<div class="input-group">
							<input class="postcodify_details input--style-1" type="text"
								placeholder="DETAIL ADDRESS" name="mb_addr2" required>
						</div>

						<!-- <div class="input-group">
							<div class="rs-select2 js-select-simple select--no-search">
								<select name="class">
									<option disabled="disabled" selected="selected">CLASS</option>
									<option>Class 1</option>
									<option>Class 2</option>
									<option>Class 3</option>
								</select>
								<div class="select-dropdown"></div>
							</div>
						</div> -->
						
						<div class="input-group">
							<input class="input--style-1" style = "font-weight: bold;"
								readonly="readonly" type="text" placeholder="Agree All" >
							<input class="input-icon" type="checkbox" id = "agreeall"
										style="float: right; width: 12.8px;" >
						</div>
						<div class="input-group">
							<input class="input--style-1"
								readonly="readonly" type="text" placeholder="이용약관에 동의합니다." >
																
							<input class="input--style-1"
								readonly="readonly" type="text" placeholder="개인정보 처리방침에 동의합니다." >
									
							<input class="input--style-1"
								readonly="readonly" type="text" placeholder="위치기반서비스 이용약관에 동의합니다." >
							
						</div>
						<input type="text" class="fieldBox" name="mb_imgSrc" style = "display:none;">

						<div class="row row-space"></div>
						<div class="p-t-20">
							<button class="btn btn--radius btn--green" type="submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- Jquery JS-->
<script src="<%=signupcontext%>vendor/jquery/jquery.min.js"></script>
<!-- Vendor JS-->
<script src="<%=signupcontext%>vendor/select2/select2.min.js"></script>
<script src="<%=signupcontext%>vendor/datepicker/moment.min.js"></script>
<script src="<%=signupcontext%>vendor/datepicker/daterangepicker.js"></script>

<!-- Main JS-->
<script src="<%=signupcontext%>js/global.js"></script>

<!-- ajax 라이브러리 -->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>


</html>