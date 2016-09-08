<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
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
									<li>
										<a href="#">个人中心</a>
									</li>
									<li>
										<a href="user_homepage">我的收藏</a>
									</li>

									<li>
										<a class="active" href="my_orders">我提交的订单</a>
									</li>
									<li>
										<a href="#">修改密码</a>
									</li>
									<c:if test="${loginUser.type=='1'}">
										<li class="active">
											<a href="store">我的店铺</a>
										</li>
										<li>
											<a href="update_store?id=${my_store.id }">修改店铺信息</a>
										</li>
										<li>
											<a href="store_orders">店铺订单</a>
										</li>
									</c:if>
								</ul>
								<!-- /.nav -->
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
									<h1 class="page-header">我的订单</h1>

									<div class="properties-rows">
										<div class="row">
											<c:if test="${empty my_orders.datas }">
												<p style="text-align: center">目前您还没有订单！</p>
											</c:if>
											<c:forEach items="${my_orders.datas}" var="um">
												<div class="property span9">
													<div class="row">
														<div class="image span3">
															<div class="content">
																<a href="detail?id=${um.goods.id}"></a> <img
																	src="resources/photo/${um.goods.img }" alt="">
															</div>
															<!-- /.content -->
														</div>
														<!-- /.image -->

														<div class="body span6">
															<div class="title-price row">
																<div class="title span4">
																	<h2>
																		<a href="detail?id=${um.goods.id}">${um.goods.name}</a>
																	</h2>
																</div>
																<!-- /.title -->

																<div class="price">￥${um.price }</div>
																<!-- /.price -->
															</div>
															<!-- /.title -->

															<div class="location">${um.goods.type }&nbsp;${um.goods.varieties }</div>
															<!-- /.location -->
															<div class="area">
																<span class="key">订购数量:</span>
																<!-- /.key -->
																<span class="value">${um.quantity }</span>
																<!-- /.value -->
															</div>
															<!-- /.area -->
															<div class="area">
																<span class="key">创建订单时间:</span>
																<!-- /.key -->
																<span class="value">${um.buyDate }</span>
																<!-- /.value -->
															</div>
															<br/>
															<!-- /.area -->
															<div class="area">
																<span class="key">订单状态:</span>
																<!-- /.key -->
																<br/>
																<span class="value">
																	<c:if test="${um.status ==1}">
																		<p style="color:green">已提交</p>
																	</c:if>
																	<c:if test="${um.status ==2}">
																		<p style="color:red">库存不足，建议与卖家尽快联系！</p>
																	</c:if>
																</span>
																<!-- /.value -->
															</div>
															<!-- /.area -->
														
															<div style="float: right" class="area">
																<a href="delete_my_orders?orders_id=${um.id }">删除该订单</a>
															</div>
														</div>
														<!-- /.body -->
													</div>
													<!-- /.row -->
												</div>
												<!-- /.property -->
											</c:forEach>

										</div>
										<!-- /.row -->
									</div>
									<!-- /.properties-rows -->
									<div class="pagination pagination-centered">
										<ul>
											<pg:pager maxPageItems="9" items="${my_orders.totalRecord}"
												export="curPage = pageNumber" url="my_orders">
												<pg:last>
													<p>共${my_orders.totalRecord}条记录，共${pageNumber}页，当前第${curPage}页</p>
												</pg:last>

												<pg:first>
													<li><a href="${pageUrl }">首页</a></li>
												</pg:first>
												<pg:prev>
													<li><a href="${pageUrl }">上一页</a></li>
												</pg:prev>
												<pg:pages>
													<c:if test="${curPage eq pageNumber }">
														<li class="active"><a href="#"><%=pageNumber%></a></li>
													</c:if>
													<c:if test="${curPage ne pageNumber }">
														<li><a href="${pageUrl }">${pageNumber }</a></li>
													</c:if>
												</pg:pages>
												<pg:next>
													<li><a href="${pageUrl}">下一页</a></li>
												</pg:next>
												<pg:last>
													<li><a href="${pageUrl}">尾页</a></li>
												</pg:last>
											</pg:pager>
										</ul>
									</div>
									<!-- /.pagination -->
								</div>
								<div class="sidebar span3">

									<div class="ad widget">
										<h2>为您推荐</h2>
										<div class="content">
											<a href="#"> <img src="assets/img/banner/1.gif"
												alt="Banner">
											</a> <a href="#"> <img src="assets/img/banner/2.gif"
												alt="Banner">
											</a> <a href="#"> <img src="assets/img/banner/3.gif"
												alt="Banner">
											</a> <a href="#"> <img src="assets/img/banner/4.gif"
												alt="Banner">
											</a> <a href="#"> <img src="assets/img/banner/1.gif"
												alt="Banner">
											</a> <a href="#"> <img src="assets/img/banner/2.gif"
												alt="Banner">
											</a> <a href="#"> <img src="assets/img/banner/3.gif"
												alt="Banner">
											</a> <a href="#"> <img src="assets/img/banner/4.gif"
												alt="Banner">
											</a>
										</div>
										<!-- /.content -->
									</div>
									<!-- /.ad -->
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