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
												<li><a href="#">您好！${loginUser.username}</a>
												</li>
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
									<li><a href="#">管理员首页</a></li>
									<li><a href="manage_user">管理账户</a></li>
									<li><a class="active" href="#">管理商品</a></li>
									<li><a href="manage_store">管理店铺</a></li>
									<li><a href="manage_home">管理首页</a></li>
								</ul>
								<!-- /.nav -->

								<form method="get" class="site-search" action="?">
									<div class="input-append">
										<input title="Enter the terms you wish to search for."
											class="search-query span2 form-text" placeholder="搜索商品"
											type="text" name="">
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
							<hr>
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<th>ID</th>
									<th>商品名称</th>
									<th>价格</th>
									<th>库存</th>
									<th>折扣</th>
									<th>类型</th>
									<th>品种</th>
									<th>产品地址</th>
									<th>操作</th>

								</tr>
								<c:forEach items="${allGoods.datas}" var="um">
									<tr>
										<td>${um.id}</td>
										<td>${um.name}</td>
										<td>${um.price}</td>
										<td>${um.stock }</td>
										<td>${um.discount}</td>
										<td>${um.type}</td>
										<td>${um.varieties}</td>
										<td>${um.goods_address }</td>
										<td><a href="show_index?id=${um.id }">首页推广</a> &nbsp;&nbsp; <a
											href="recommend_index?id=${um.id }">网站推荐</a> &nbsp;&nbsp; <a
											href="update_goods?id=${um.id }">修改商品</a>&nbsp;&nbsp;<a
											href="delete_goods?id=${um.id }">删除商品</a></td>
									</tr>
								</c:forEach>

							</table>
							<div class="pagination pagination-centered">
								<ul>
									<pg:pager maxPageItems="9" items="${allGoods.totalRecord}"
										export="curPage = pageNumber" url="manage_goods">


										<pg:last>
											<p>共${allGoods.totalRecord}条记录，共${pageNumber}页，当前第${curPage}页</p>
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



	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/jquery.ezmark.js"></script>
	<script type="text/javascript" src="assets/js/jquery.currency.js"></script>
	<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="assets/js/retina.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/carousel.js"></script>
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