<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
<%
	String context = request.getContextPath();
	context = context + "/resources/main/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=context%>style.css">
<title>Insert title here</title>
</head>
<body>
	<!--
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
	-->
	<section class="hero-area">
        <div class="hero-slides owl-carousel">
            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(<%=context%>img/bg-img/bg1.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="300ms">Delicios Homemade Burger</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                <a href="#" class="btn delicious-btn" data-animation="fadeInUp" data-delay="1000ms">See Receipe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(<%=context%>img/bg-img/bg6.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="300ms">Delicios Homemade Burger</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                <a href="#" class="btn delicious-btn" data-animation="fadeInUp" data-delay="1000ms">See Receipe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(<%=context%>img/bg-img/bg7.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="300ms">Delicios Homemade Burger</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                <a href="#" class="btn delicious-btn" data-animation="fadeInUp" data-delay="1000ms">See Receipe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<div class="container">
		<div class="row">
            <div class="col-12">
                <div class="section-heading">
                    <h3>restaurant recommendation</h3>
                </div>
            </div>
        </div>
		<div class="row">
			<c:forEach var="resinfo" items="${reslist}">
				<div class="col-12 col-sm-6 col-lg-4">
					<div class="single-best-receipe-area mb-30">
						<a href="resInfo.do?res_num=${resinfo.getRes_num()}"> <!-- Single Best Receipe Area -->
							<img
							src="${pageContext.request.contextPath}${resinfo.getRes_imgSrc1()}"
							alt="">
						</a>
						<div class="receipe-content">
							<h5>${resinfo.getRes_name()}</h5>
							<div class="ratings">
								<p style="font-weight: bold; font-size: 18px"></p>
								<p>${resinfo.getRes_phone()}</p>
								<p>${resinfo.getRes_foodType()}
								<p>주차공간 : ${resinfo.getRes_parking()}</p>
								<p>${resinfo.getRes_addr()}</p>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
	<!-- ##### Footer Area Start ##### -->

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="<%=context%>js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="<%=context%>js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="<%=context%>js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="<%=context%>js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="<%=context%>js/active.js"></script>

</body>
</html>