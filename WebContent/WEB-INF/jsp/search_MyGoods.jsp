<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
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
									<li>
										<a href="#">个人中心</a>
									</li>
									<li>
										<a  href="#">我的收藏</a>
									</li>

									<li>
										<a href="my_orders">我提交的订单</a>
									</li>
									<li>
										<a href="#">修改密码</a>
									</li>
									<c:if test="${loginUser.type=='1'}">
										<li class="active">
											<a class="active" href="store">我的店铺</a>
										</li>
										<li>
											<a href="#">修改店铺信息</a>
										</li>
										<li>
											<a href="store_orders">店铺订单</a>
										</li>
									</c:if>
								</ul>
								<!-- /.nav -->
								
								<form method="get" class="site-search" action="searchMyGoods">
									<div class="input-append">
										<input title="Enter the terms you wish to search for."
											class="search-query span2 form-text" placeholder="搜索上架的商品"
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
							<div class="row">
								<div class="span9">
									<h2 class="page-header">搜索我上架的商品</h2>

									<div class="properties-grid">
										<div class="row">
											<c:if test="${empty result_of_search.datas }">
												<p style="text-align:center">没有找到相关的商品！！</p>
											</c:if>
											<c:forEach items="${result_of_search.datas}" var="um">
												<div class="property span3">
													<div class="image">
														<div class="content">
															<a href="detail?id=${um.id }"></a> <img
																style="width: 270px; height: 200px;"
																src="resources/photo/${um.img }" alt="">
														</div>
														<!-- /.content -->

														<div class="price">￥${um.price}</div>
														<!-- /.price -->
														<div class="reduced">${um.discount}</div>
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

													<div class="location">${um.type }&nbsp;${um.varieties }</div>
													<!-- /.location -->
													<div class="area">
														<span class="key">库存:</span>
														<!-- /.key -->
														<span class="value">${um.stock}</span>
														<!-- /.value -->
													</div>
													<!-- /.area -->
													<div class="bedrooms">
														<a href="update_goods?id=${um.id}">修改商品</a>
														<a href="delete_goods?id=${um.id}">删除商品</a>
													</div>

												</div>
												<!-- /.property -->
											</c:forEach>

										</div>
										<!-- /.row -->
									</div>
									<!-- /.properties-grid -->

									<div class="pagination pagination-centered">
										<ul>
											<pg:pager maxPageItems="9" items="${result_of_search.totalRecord}" export="curPage = pageNumber" url="searchMyGoods">

												<pg:param name="name" value="${search_name}" />
												<pg:last>
													<p>共${result_of_search.totalRecord}条记录，共${pageNumber}页，当前第${curPage}页</p>
												</pg:last>

												<pg:first>
													<li>
														<a href="${pageUrl }">首页</a>
													</li>
												</pg:first>
												<pg:prev>
													<li>
														<a href="${pageUrl }">上一页</a>
													</li>
												</pg:prev>
												<pg:pages>
													<c:if test="${curPage eq pageNumber }">
														<li class="active">
															<a href="#"><%=pageNumber%></a>
														</li>
													</c:if>
													<c:if test="${curPage ne pageNumber }">
														<li>
															<a href="${pageUrl }">${pageNumber }</a>
														</li>
													</c:if>
												</pg:pages>
												<pg:next>
													<li>
														<a href="${pageUrl}">下一页</a>
													</li>
												</pg:next>
												<pg:last>
													<li>
														<a href="${pageUrl}">尾页</a>
													</li>
												</pg:last>
											</pg:pager>
										</ul>
									</div>
									<!-- /.pagination -->
								</div>
								<div class="sidebar span3">
									<div class="widget our-agents">
										<div class="title">
											<h2>卖家信息</h2>
										</div>
										<!-- /.title -->

										<div class="content">
											<div class="agent">
												<h3><strong>${my_store.name }</strong></h3><br>
												<strong>负责人：</strong>${loginUser.username }<br>
												<strong>手机：</strong>${my_store.phone }<br>
												<strong>手机：</strong>${my_store.email }<br>
												<strong>邮编：</strong>${my_store.postcode }<br>
												<strong>店家地址：</strong>${my_store.address }<br>
												<strong>店铺简介：</strong>${my_store.details }<br>
												<br />
												<a href="add_goods" class="btn btn-primary btn-block">添加商品</a>
											</div>
											<!-- /.agent -->

										</div>
										<!-- /.content -->

									</div>
									<!-- /.our-agents -->

								</div>

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



	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3&amp;sensor=true"></script>
	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/jquery.ezmark.js"></script>
	<script type="text/javascript" src="assets/js/jquery.currency.js"></script>
	<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="assets/js/retina.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/carousel.js"></script>
	<script type="text/javascript" src="assets/js/gmap3.min.js"></script>
	<script type="text/javascript" src="assets/js/gmap3.infobox.min.js"></script>
	<script type="text/javascript" src="assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="assets/libraries/chosen/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
	<script type="text/javascript" src="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="assets/js/realia.js"></script>
</body>
</html>