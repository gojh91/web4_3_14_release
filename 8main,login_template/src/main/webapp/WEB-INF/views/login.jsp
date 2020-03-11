<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String context = request.getContextPath();
	context = context + "/resources/login/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link rel="icon" type="image/png"
	href="<%=context%>images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=context%>vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="<%=context%>css/util.css">
<link rel="stylesheet" type="text/css" href="<%=context%>css/main.css">
<!--===============================================================================================-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
	function checkLogin() {
		var mb_id = document.getElementsByName('mb_id')[0].value
		var mb_pw = document.getElementsByName('mb_pw')[0].value
		if (mb_id == "") {
			alert("아이디를 입력하십시오");
		} else if (mb_pw == "") {
			alert("비밀번호를 입력하십시오");
		} else {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/LoginRest/checkLogin.do",
						type : 'POST',
						data : {
							mb_id : mb_id,
							mb_pw : mb_pw
						},
						success : function(data) {
							if (data == "memberList") {
								location.href = 'memberList.do'
							} else if (data == "main") {
								location.href = 'main.do'
							} else if (data == "login") {
								alert("입력하신 것과 일치하는 정보가 없습니다.");
								location.href = 'login.do'
							}
						}
					});
		}
	}

	function enterkey() {
		if (window.event.keyCode == 13) {
			checkLogin();
		}
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <input type = "text" name = "mb_id" required = "required"
		title = "아이디">
	<input type = "password" name = "mb_pw" required = "required"
		title = "패스워드" onKeyDown="enterkey()">
	<button onclick="checkLogin()" >로그인</button>
	<button onclick="location.href='memberIdFind.do'">아이디 찾기</button>
	<button onclick="location.href='memberPwFind.do'">비밀번호 찾기</button> -->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<!-- <form class="login100-form validate-form flex-sb flex-w"> -->
				<span class="login100-form-title p-b-32"> Account Login </span> <span
					class="txt1 p-b-11"> Username </span>
				<div class="wrap-input100 validate-input m-b-36"
					data-validate="Username is required">
					<input class="input100" type="text" name="mb_id"> <span
						class="focus-input100"></span>
				</div>

				<span class="txt1 p-b-11"> Password </span>
				<div class="wrap-input100 validate-input m-b-12"
					data-validate="Password is required">
					<input class="input100" type="password" name="mb_pw"
						onKeyDown="enterkey()"> <span class="focus-input100"></span>
				</div>

				<div class="flex-sb-m w-full p-b-48">
					<div>
						<a href="memberIdFind.do" class="txt3"> Forgot ID? </a>
					</div>

					<div>
						<a href="memberPwFind.do" class="txt3"> Forgot Password? </a>
					</div>
				</div>

				<div class="container-login100-form-btn">
					<button class="login100-form-btn" onclick="checkLogin()">
						Login</button>
				</div>


			</div>
		</div>
	</div>


</body>
</html>