<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Aviators - byaviators.com">

<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="assets/img/favicon.png" type="image/png">
<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css" type="text/css">
<link rel="stylesheet" href="assets/libraries/chosen/chosen.css" type="text/css">
<link rel="stylesheet" href="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.css" type="text/css">
<link rel="stylesheet" href="assets/libraries/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/realia-turquiose.css" type="text/css" id="color-variant-default">
<link rel="stylesheet" href="#" type="text/css" id="color-variant">

<title>树苗商店 | Sapling shop</title>
</head>
<body>
	<div id="wrapper-outer">
		<div id="wrapper">
			<div id="wrapper-inner">
				<!-- BREADCRUMB -->
				<div class="breadcrumb-wrapper">
					<div class="container">
						<div class="row">
							<div class="span12">
								<ul class="breadcrumb pull-left">
									<li>
										<a href="home">主页</a>
									</li>
								</ul>
								<!-- /.breadcrumb -->

								<div class="account pull-right">
									<ul class="nav nav-pills">
										<c:choose>
											<c:when test="${not empty loginUser }">
												<li><a href="user_homepage?id=${loginUser.id}">您好！${loginUser.username}，进入个人中心</a>
												</li>
												<li><a href="my_shopCart">购物车&nbsp;${shopCart.totalRecord }&nbsp;件商品</a></li>
												<li><a href="<%=request.getContextPath()%>/logout">退出</a>
												</li>
											</c:when>
											<c:otherwise>
												<li><a href="login">登录</a></li>
												<li><a href="register">注册</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</div>
							<!-- /.span12 -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container -->
				</div>
				<!-- /.breadcrumb-wrapper 上面第一条-->

				<!-- HEADER -->
				<div id="header-wrapper">
					<div id="header">
						<div id="header-inner">
							<div class="container">
								<div class="navbar">
									<div class="navbar-inner">
										<div class="row">
											<div class="logo-wrapper span4">
												<a href="#nav" class="hidden-desktop" id="btn-nav">Toggle navigation</a>

												<div class="logo">
													<a href="home" title="Home">
														<img src="assets/img/logo.png" alt="Home">
													</a>
												</div>
												<!-- /.logo -->

												<div class="site-name">
													<a href="home" title="Home" class="brand">易景网</a>
												</div>
												<!-- /.site-name -->

												<div class="site-slogan">
													<span>一个海量信息的淘苗<br>网站
													</span>
												</div>
												<!-- /.site-slogan -->
											</div>
											<!-- /.logo-wrapper -->

										</div>
										<!-- /.row -->
									</div>
									<!-- /.navbar-inner -->
								</div>
								<!-- /.navbar -->
							</div>
							<!-- /.container -->
						</div>
						<!-- /#header-inner -->
					</div>
					<!-- /#header -->
				</div>
				<!-- /#header-wrapper 标题第二-->

				<!-- NAVIGATION -->
				<div id="navigation">
					<div class="container">
						<div class="navigation-wrapper">
							<div class="navigation clearfix-normal">

								<ul class="nav">
									<li><a href="#" class="active">主页</a></li>
									<li class="menuparent"><span class="menuparent nolink">乔木</span>
										<ul>
											<li class="menuparent"><span class="menuparent nolink">大乔木（常绿）</span>
												<ul>
													<c:forEach items="${b_macrophanerophytes_evergreen}"
														var="um">
														<li><a href="list?goods_class=${um.id }"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>
												</ul></li>
											<li class="menuparent"><span class="menuparent nolink">大乔木（落叶）</span>
												<ul>
													<c:forEach items="${b_macrophanerophytes_fallen}" var="um">
														<li><a href="list?goods_class=${um.id }"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>

												</ul></li>
											<li class="menuparent"><span class="menuparent nolink">小乔木（常绿）</span>
												<ul>
													<c:forEach items="${s_macrophanerophytes_evergreen}"
														var="um">
														<li><a href="list?goods_class=${um.id}"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>
												</ul></li>
											<li class="menuparent"><span class="menuparent nolink">小乔木（落叶）</span>
												<ul>
													<c:forEach items="${s_macrophanerophytes_fallen}" var="um">
														<li><a href="list?goods_class=${um.id}"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>

												</ul></li>
										</ul></li>

									<li class="menuparent"><span class="menuparent nolink">灌木</span>
										<ul>
											<li class="menuparent"><span class="menuparent nolink">灌木（常绿）</span>
												<ul>
													<c:forEach items="${shrub_evergreen}" var="um">
														<li><a href="list?goods_class=${um.id }"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>
												</ul></li>
											<li class="menuparent"><span class="menuparent nolink">灌木（落叶）</span>
												<ul>
													<c:forEach items="${shrub_fallen}" var="um">
														<li><a href="list?goods_class=${um.id}"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>
												</ul></li>
										</ul></li>

									<li class="menuparent"><span class="menuparent nolink">藤本</span>
										<ul>
											<li class="menuparent"><span class="menuparent nolink">藤本（常绿）</span>
												<ul>
													<c:forEach items="${liana_evergreen}" var="um">
														<li><a href="list?goods_class=${um.id }"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>
												</ul></li>
											<li class="menuparent"><span class="menuparent nolink">藤本（落叶）</span>
												<ul>
													<c:forEach items="${liana_fallen}" var="um">
														<li><a href="list?goods_class=${um.id}"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>
												</ul></li>
										</ul></li>

									<li class="menuparent"><span class="menuparent nolink">水生</span>
										<ul>
											<c:forEach items="${hydrophyte}" var="um">
												<li><a href="list?goods_class=${um.id}"> <span
														style="">${um.name}</span>
												</a></li>
											</c:forEach>
										</ul></li>

									<li class="menuparent"><span class="menuparent nolink">草本</span>
										<ul>
											<li class="menuparent"><span class="menuparent nolink">草本（常绿）</span>
												<ul>
													<c:forEach items="${herb_evergreen}" var="um">
														<li><a href="list?goods_class=${um.id }"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>
												</ul></li>
											<li class="menuparent"><span class="menuparent nolink">草本（落叶）</span>
												<ul>
													<c:forEach items="${herb_fallen}" var="um">
														<li><a href="list?goods_class=${um.id}"> <span
																style="">${um.name}</span>
														</a></li>
													</c:forEach>

												</ul></li>
										</ul></li>

									<li class="menuparent"><span class="menuparent nolink">地被</span>
										<ul>
											<c:forEach items="${cover}" var="um">
												<li><a href="list?goods_class=${um.id}"> <span
														style="">${um.name}</span>
												</a></li>
											</c:forEach>
										</ul></li>

									<li class="menuparent"><span class="menuparent nolink">竹</span>
										<ul>
											<c:forEach items="${bamboo}" var="um">
												<li><a href="list?goods_class=${um.id}"> <span
														style="">${um.name}</span>
												</a></li>
											</c:forEach>
										</ul></li>

								</ul>
								<!-- /.nav -->

								<form method="get" class="site-search" action="list">
									<div class="input-append">
										<input title="Enter the terms you wish to search for."
											class="search-query span2 form-text" placeholder="搜索商品"
											type="text" name="searchInfo">
										<button type="submit" class="btn">
											<i class="icon-search"></i>
										</button>
									</div>
									<!-- /.input-append -->
								</form>
								<!-- /.site-search -->
							</div>
							<!-- /.navigation -->
						</div>
						<!-- /.navigation-wrapper -->
					</div>
					<!-- /.container -->
				</div>
				<!-- /.navigation 导航栏-->

				<!-- CONTENT -->
				<div id="content">
					<div class="container">
						<div id="main">
							<h1>
								<strong>订单已成功提交！</strong>
							</h1>
							<hr>
							<p>
								现在您可以：
								<a href="my_orders">查看我提交的订单</a>&nbsp;&nbsp;&nbsp;<a href="home">返回商城</a>
							</p>
						</div>
					</div>
				</div>
				<!-- /#content -->
			</div>
			<!-- /#wrapper-inner -->

			<div id="footer-wrapper">
				<div id="footer" class="footer container">
					<div id="footer-inner">
						<div class="row">
							<div class="span12 copyright">
								<p>© Copyright 2015 by TIANKAI XIE, graduation project of Computer Science, Beijing Forestry University, All rights reserved. E-mail: xietiankaii@outlook.com
									Phone: 18810594457</p>
							</div>
							<!-- /.copyright -->

						</div>
						<!-- /.row -->
					</div>
					<!-- /#footer-inner -->
				</div>
				<!-- /#footer -->
			</div>
			<!-- /#footer-wrapper -->
		</div>
		<!-- /#wrapper -->
	</div>
	<!-- /#wrapper-outer -->



	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/jquery.ezmark.js"></script>
	<script type="text/javascript" src="assets/js/jquery.currency.js"></script>
	<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="assets/js/retina.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/carousel.js"></script>
	<script type="text/javascript" src="assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="assets/libraries/chosen/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
	<script type="text/javascript" src="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="assets/js/realia.js"></script>
</body>
</html>