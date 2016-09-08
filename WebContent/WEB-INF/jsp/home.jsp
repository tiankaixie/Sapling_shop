<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<div class="slider-wrapper">
								<div class="slider">
									<div class="slider-inner">
										<div class="row">
											<div class="images span9">
												<div class='iosSlider'>
													<div class='slider-content'>
														<div id="carousel1" class="carousel slide">
															<div class="carousel-inner">
																<div class="item active">
																	<a href="detail?id=${rollone.goods.id}"> <img
																		style="width: 870px; height: 420px;"
																		src="resources/photo/${rollone.goods.img }">

																	</a>
																	<div class="carousel-caption">
																		<p>${rollone.goods.name }&nbsp;&nbsp;${rollone.goods.type }</p>
																	</div>
																</div>
																<c:forEach items="${ roll}" var="um">
																	<div class="item">
																		<a href="detail?id=${um.goods.id}"> <img
																			style="width: 870px; height: 420px;"
																			src="resources/photo/${um.goods.img }">

																		</a>
																		<div class="carousel-caption">
																			<p>${um.goods.name }&nbsp;&nbsp;${um.goods.type }</p>
																		</div>
																	</div>
																</c:forEach>

															</div>
															<a href="#carousel1" data-slide="prev"
																class="left carousel-control">&lsaquo;</a> <a
																href="#carousel1" data-slide="next"
																class="right carousel-control">&rsaquo;</a>
														</div>
													</div>
													<!-- /.slider-content -->
												</div>
												<!-- .iosSlider -->

											</div>
											<!-- /.images -->

											<div class="span3">
												<div class="property-filter">
													<div class="content">
														<form method="get" action="quickSearch">
															<div class="location control-group">
																<label class="control-label" for="inputLocation">
																	树苗种类 </label>
																<div class="controls">
																	<select id="category" name="category">
																		<option value="大乔木">大乔木</option>
																		<option>小乔木</option>
																		<option>灌木</option>
																		<option>藤本</option>
																		<option>水生</option>
																		<option>草本</option>
																		<option>地被</option>
																		<option>竹</option>
																	</select>
																</div>
																<!-- /.controls -->
															</div>
															<!-- /.control-group -->

															<div class="type control-group">
																<label class="control-label" for="inputType">常绿/落叶（没有可以选择任何）
																</label>
																<div class="controls">
																	<select id="isEverGreen" name="isEverGreen">
																		<option value="任何">任何</option>
																		<option value="常绿">常绿</option>
																		<option value="落叶">落叶</option>
																	</select>
																</div>
																<!-- /.controls -->
															</div>
															<!-- /.control-group -->
															<div class="type control-group">
																<label class="control-label" for="inputType">苗木类型
																</label>
																<div class="controls">
																	<select id="type" name="type">
																		<option value="景观苗">景观苗</option>
																		<option value="造型苗">造型苗</option>
																		<option value="普通苗">普通苗</option>
																	</select>
																</div>
																<!-- /.controls -->
															</div>

															<div class="beds control-group">
																<label class="control-label" for="inputBeds">
																	价格区间(￥) </label>
																<div class="controls">
																	<input type="text" name="lowprice">
																</div>
																<!-- /.controls -->
															</div>
															<!-- /.control-group -->

															<div class="baths control-group">
																<label class="control-label" for="inputBaths"> ~</label>
																<div class="controls">
																	<input type="text" name="highprice">
																</div>
																<!-- /.controls -->
															</div>
															<!-- /.control-group -->
															<br /> <br />
															<div class="form-actions">
																<input type="submit" value="开始搜索"
																	class="btn btn-primary btn-large">
															</div>
															<!-- /.form-actions -->
														</form>
													</div>
													<!-- /.content -->
												</div>
												<!-- /.property-filter -->
											</div>
											<!-- /.span3 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.slider-inner -->
								</div>
								<!-- /.slider -->
							</div>
							<!-- /.slider-wrapper -->

							<div class="row">
								<div class="span9">
									<h1 class="page-header">发现</h1>
									<div class="properties-grid">
										<div class="row">
											<c:forEach items="${discover}" var="um">
												<div class="property span3">
													<div class="image">
														<div class="content">
															<a href="detail?id=${um.id }"></a> <img
																style="width: 270px; height: 200px;"
																src="resources/photo/${um.img }" alt="">
														</div>
														<!-- /.content -->

														<div class="price">￥${um.price }</div>
														<!-- /.price -->
														<div class="reduced">${um.discount }</div>
														<!-- /.reduced -->
													</div>
													<!-- /.image -->

													<div class="title">
														<h2 style="overflow: hidden; text-overflow: ellipsis;">
															<a style="white-space: nowrap;width=100%;"
																href="detail?id=${um.id }">${um.name }</a>
														</h2>
													</div>
													<!-- /.title -->

													<div class="location">${um.category.name }</div>
													<!-- /.location -->
													<div class="area">
														<span class="key">类型：</span>
														<!-- /.key -->
														<span class="value">${um.type }</span>
														<!-- /.value -->
													</div>
													<!-- /.area -->
												</div>
												<!-- /.property -->
											</c:forEach>

										</div>
										<!-- /.row -->
									</div>
									<!-- /.properties-grid -->
								</div>
								<div class="sidebar span3">
									<div class="widget our-agents">
										<div class="title">
											<h2>站内管理员</h2>
										</div>
										<!-- /.title -->

										<div class="content">
											<div class="agent">
												<div class="image">
													<img src="assets/img/tmp/temp8.jpg" alt="">
												</div>
												<!-- /.image -->
												<div class="name">Tiankai Xie</div>
												<!-- /.name -->
												<div class="phone">188-1059-4457</div>
												<!-- /.phone -->
												<div class="email">
													<a href="mailto:xietiankaii@outlook.com">xietiankaii@outlook.com</a>
												</div>
												<!-- /.email -->
											</div>
											<!-- /.agent -->

											<div class="agent">
												<div class="image">
													<img src="assets/img/tmp/temp9.jpg" alt="">
												</div>
												<!-- /.image -->
												<div class="name">Tiankai Xie</div>
												<!-- /.name -->
												<div class="phone">188-1059-4457</div>
												<!-- /.phone -->
												<div class="email">
													<a href="mailto:xietiankaii@outlook.com">xietiankaii@outlook.com</a>
												</div>
												<!-- /.email -->
											</div>
											<!-- /.agent -->
										</div>
										<!-- /.content -->
									</div>
									<!-- /.our-agents -->
									<div class="hidden-tablet">
										<div class="widget properties last">
											<div class="title">
												<h2>网站推荐</h2>
											</div>
											<!-- /.title -->

											<div class="content">
												<c:forEach items="${recommends }" var="um">
													<div class="property">
														<div class="image">
															<a href="detail?id=${um.goods.id }"></a> <img
																src="resources/photo/${um.goods.img }">
														</div>
														<!-- /.image -->

														<div class="wrapper">
															<div class="title">
																<h3 style="overflow: hidden; text-overflow: ellipsis;">
																	<a style="white-space: nowrap;width=100%;"
																		href="detail.html">${um.goods.name }</a>
																</h3>
															</div>
															<!-- /.title -->
															<div class="location">${um.goods.varieties }</div>
															<!-- /.location -->
															<div class="price">￥${um.goods.price }</div>
															<!-- /.price -->
														</div>
														<!-- /.wrapper -->
													</div>
													<!-- /.property -->
												</c:forEach>
											</div>
											<!-- /.content -->
										</div>
										<!-- /.properties -->
									</div>
								</div>
							</div>
							<!-- /.row-->


						</div>
						<!-- /#main 主层-->
					</div>
					<!-- /#content 内容层-->
				</div>
				<!-- /#wrapper-inner 里层-->
			</div>
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
		<!-- /#wrapper 第二层-->
	</div>
	<!-- /#wrapper-outer最外一层 -->



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