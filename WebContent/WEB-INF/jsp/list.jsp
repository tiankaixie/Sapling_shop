<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="false" buffer="999kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Aviators - byaviators.com">


<link rel="shortcut icon" href="assets/img/favicon.png" type="image/png">
<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css"
	type="text/css">

<link rel="stylesheet"
	href="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.css"
	type="text/css">
<link rel="stylesheet"
	href="assets/libraries/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/realia-turquiose.css"
	type="text/css" id="color-variant-default">


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
							<div class="row">
								<div class="span9">
									<h1 class="page-header">商品列表</h1>

									<div class="properties-grid">
										<div class="row">
											<c:if test="${empty the_goods.datas }">
												<p style="text-align:center ">对不起，没有找到您需要的商品！</p>
											</c:if>
											<c:forEach items="${the_goods.datas}" var="um">
												<div class="property span3">
													<div class="image">
														<div class="content">
															<a href="detail?id=${um.id }"></a> <img
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
													<h2 style="overflow:hidden;text-overflow:ellipsis;">
														<a style= "white-space: nowrap;width=100%;" href="detail?id=${um.id }">${um.name }</a>
													</h2>
													</div>
													<!-- /.title -->

													<div class="location">
													</div>
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

									<div class="pagination pagination-centered">
										<ul>
											<pg:pager maxPageItems="9" items="${the_goods.totalRecord}"
												export="curPage = pageNumber" url="list">
												<c:choose>
													<c:when test="${not empty searchInfo }">
														<pg:param name="searchInfo" value="${searchInfo}" />
													</c:when>
													<c:otherwise>
														<pg:param name="goods_class" value="${goods_class}" />
													</c:otherwise>
												</c:choose>
												
												
												<pg:last>
													<p>共${the_goods.totalRecord}条记录，共${pageNumber}页，当前第${curPage}页</p>
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
									<div class="widget our-agents">
										<div class="title">
											<h2>网站管理员</h2>
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

									<div class="ad widget">
										<h2>广而告之</h2>
										<div class="content">
											<a href="#"><img src="assets/img/banner/1.gif"
												alt="Banner"></a> <a href="#"><img
												src="assets/img/banner/2.gif" alt="Banner"></a> <a
												href="#"><img src="assets/img/banner/3.gif" alt="Banner"></a>
											<a href="#"><img src="assets/img/banner/4.gif"
												alt="Banner"></a>
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