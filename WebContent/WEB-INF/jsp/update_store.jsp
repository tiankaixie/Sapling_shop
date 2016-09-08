<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
										<c:choose>
											<c:when test="${not empty loginUser }">
												<li><a href="user_homepage?id=${loginUser.id}">您好！${loginUser.username}，进入个人中心</a></li>
												<li><a href="<%=request.getContextPath()%>/logout">退出</a></li>
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
								<h1 class="page-header">管理店铺</h1>
								<div class="login-register">
									<div class="row">
										<div class="span8">
											<ul class="tabs nav nav-tabs">
												<li class="active"><a href="#">修改信息</a></li>
											</ul>
											<!-- /.nav -->

											<div class="tab-content">

												<div class="tab-pane active" id="register">
													<sf:form method="post" modelAttribute="store"
														action="update_store">
														<div class="control-group">
															<label class="control-label" for="inputRegisterFirstName">
																店铺名称 <span class="form-required"
																title="This field is required.">*</span>
															</label> <input type="hidden" name="id" value="${old_store.id }" />
															<div class="controls">
																<sf:input path="name" value="${old_store.name }" />
																<sf:errors path="name" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterSurname">
																联系电话 <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="phone" value="${old_store.phone }" />
																<sf:errors path="phone" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterEmail">
																E-mail <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="email" value="${old_store.email }" />
																<sf:errors path="email" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterPassword">
																产品种植地详细地址 <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="address" value="${old_store.address }" />
																<sf:errors path="address" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype">
																邮政编码 <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="postcode" value="${old_store.postcode }" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype">
																店铺简介 <span class="form-required"
																title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:textarea path="details" id="details"
																	style="margin: 0px; width: 717px; height: 247px;" />
																<script>
																	document.getElementById("details").value = "${old_store.details}"
																</script>
															</div>
															<!-- /.controls -->
														</div>
														<sf:hidden path="user_id" value="${old_store.user_id }" />
														<!-- /.control-group -->
														<div class="form-actions">
															<input type="submit" value="更新店铺"
																class="btn btn-primary arrow-right">
														</div>
														<!-- /.form-actions -->
													</sf:form>
												</div>
												<!-- /.tab-pane -->
											</div>
											<!-- /.tab-content -->
										</div>
										<!-- /.span4-->


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
									reserved.</p>
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