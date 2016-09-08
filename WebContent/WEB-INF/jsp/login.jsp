<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Aviators - byaviators.com">

<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="assets/img/favicon.png" type="image/png">
<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css"
	type="text/css">
<link rel="stylesheet" href="assets/libraries/chosen/chosen.css"
	type="text/css">
<link rel="stylesheet"
	href="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.css"
	type="text/css">
<link rel="stylesheet"
	href="assets/libraries/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/realia-turquiose.css"
	type="text/css" id="color-variant-default">
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
									<li><a href="home">主页</a></li>
								</ul>
								<!-- /.breadcrumb -->

								<div class="account pull-right">
									<ul class="nav nav-pills">
										<li><a href="#">登录</a></li>
										<li><a href="register">注册</a></li>
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
												<a href="#nav" class="hidden-desktop" id="btn-nav">Toggle
													navigation</a>

												<div class="logo">
													<a href="home" title="Home"> <img
														src="assets/img/logo.png" alt="Home">
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

				<!-- CONTENT -->
				<div id="content">
					<div class="container">
						<div>
							<div id="main">
								<h1 class="page-header">登录</h1>
								<div class="login-register">
									<div class="row">
										<div class="span4">
											<ul class="tabs nav nav-tabs">
												<li class="active"><a href="#">登录</a></li>
												<li><a href="register">注册</a></li>
											</ul>
											<!-- /.nav -->

											<div class="tab-content">
												<div class="tab-pane active" id="login">
													<sf:form method="post" modelAttribute="user">
														<div class="control-group">
															<label class="control-label" for="inputLoginLogin">
																用户名 <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="username" />
																<span style="color: red;"><sf:errors path="username" /></span>
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputLoginPassword">
																密码 <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:password path="password" />
																<span style="color: red;"><sf:errors path="password" /></span>
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputLoginPassword">
																类型 <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:select path="type">
																	<sf:option value="0">买家</sf:option>
																	<sf:option value="1">卖家</sf:option>
																	<sf:option value="2">管理员</sf:option>
																</sf:select>
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->
														
														<div class="form-actions">
															<input type="submit" value="登录"
																class="btn btn-primary arrow-right">
															<span style="color: red;">${errorMessage }</span>
														</div>
														<!-- /.form-actions -->
													</sf:form>
												</div>
												<!-- /.tab-pane -->
											</div>
											<!-- /.tab-content -->
										</div>
										<!-- /.span4-->

										<div class="span8">
											<h2 class="page-header">现在开始，加入我们</h2>

											<div class="images row">
												<div class="item span2">
													<img src="assets/img/icons/circle-dollar.png" alt="">

													<h3>更便捷的服务</h3>
												</div>
												<!-- /.item -->
												<div class="item span2">
													<img src="assets/img/icons/circle-search.png" alt="">

													<h3>更好地寻找</h3>
												</div>
												<!-- /.item -->
												<div class="item span2">
													<img src="assets/img/icons/circle-global.png" alt="">

													<h3>国内或国外</h3>
												</div>
												<!-- /.item -->
												<div class="item span2">
													<img src="assets/img/icons/circle-package.png" alt="">

													<h3>一站式服务</h3>
												</div>
												<!-- /.item -->
											</div>
											<!-- /.row -->

											<hr class="dotted">

											<p>加入后，您可以通过收藏、订购来享受更多的服务。</p>


										</div>
									</div>
									<!-- /.row -->
								</div>
								<!-- /.login-register -->
							</div>
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
								<p>© Copyright 2015 by TIANKAI XIE, graduation project of
									Computer Science, Beijing Forestry University, All rights
									reserved. E-mail: xietiankaii@outlook.com Phone: 18810594457</p>
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


	<script type="text/javascript"
		src="http://maps.googleapis.com/maps/api/js?v=3&amp;sensor=true"></script>
	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/jquery.ezmark.js"></script>
	<script type="text/javascript" src="assets/js/jquery.currency.js"></script>
	<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="assets/js/retina.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/carousel.js"></script>
	<script type="text/javascript" src="assets/js/gmap3.min.js"></script>
	<script type="text/javascript" src="assets/js/gmap3.infobox.min.js"></script>
	<script type="text/javascript"
		src="assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript"
		src="assets/libraries/chosen/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
	<script type="text/javascript"
		src="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="assets/js/realia.js"></script>
</body>
</html>