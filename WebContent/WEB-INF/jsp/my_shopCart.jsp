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
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap-spinner.css">
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

<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/css/bootstrap-spinner.css" rel="stylesheet">


<title>树苗商店 | Sapling shop</title>
<script type="text/javascript">
	function selectAll(name) {
		var el = document.getElementsByName("shopCartId");
		for (var i = 0; i < el.length; i++) {
			if (el[i].type == "checkbox" && el[i].name == name) {
				el[i].checked = true;
			}
		}
	}

	function clearAll(name) {
		var el = document.getElementsByName("shopCartId");
		for (var i = 0; i < el.length; i++) {
			if (el[i].type == "checkbox" && el[i].name == name) {
				el[i].checked = false;
			}
		}
	}
	
	function like() {
		document.getElementByIdx("btn_like").disabled = true;
	}

	$(function() {
		$('#customize-spinner').spinner('changed', function(e, newVal, oldVal) {
			$('#old-val').text(oldVal);
			$('#new-val').text(newVal);
		});
	})
</script>
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
							<h1>购物车</h1>
							<hr>
							<form method="get" action="orderMake">
								<table class="table table-striped table-bordered table-hover">
									<tr>
										<th>&nbsp;&nbsp;</th>
										<th>商品图片</th>
										<th>商品名称</th>
										<th>库存</th>
										<th>类型</th>
										<th>品种</th>
										<th>单价</th>
										<th>数量</th>
										<th>操作</th>
									</tr>
									<c:forEach items="${shopCart.datas}" var="um">
										<tr>
											<td><input type="checkbox" name="id"
												value="${um.id }">
												</td>
											<td><img style="width: 100px; height: 100px"
												src="resources/photo/${um.goods.img}" alt=""></td>
											<td>${um.goods.name}</td>
											<td>${um.goods.stock }</td>
											<td>${um.goods.type }</td>
											<td>${um.goods.varieties}</td>
											<td>${um.goods.price}</td>
											<td>
												<div class="input-append spinner" data-trigger="spinner">
													<input type="text" value="0" data-rule="quantity"
														name="quantity">
													<div class="add-on">
														<a href="javascript:;" class="spin-up" data-spin="up">
															<i class="icon-sort-up"></i>
														</a> <a href="javascript:;" class="spin-down" data-spin="down">
															<i class="icon-sort-down"></i>
														</a>
													</div>
												</div>
											</td>
											<td><a href="deleteShopCart?id=${um.id }">删除商品</a>
										
										</tr>
									</c:forEach>
									<tr>
										<td colspan="9"><input type="button"
											class="btn btn-primary" value="全选"
											onclick="selectAll('shopCartId')"> <input type="button"
											class="btn btn-primary" value="全不选"
											onclick="clearAll('shopCartId')">
											<span style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;请注意以上商品的库存，如需要预定库存以上的商品数量请及时联系卖家！</span>
											 <input
											style="float: right" type="submit" value="提交订单"
											class="btn btn-primary arrow-right" /></td>
									</tr>
								</table>
							</form>
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


	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.spinner.js"></script>
	<script type="text/javascript" src="assets/js/map.js"></script>
	<script type="text/javascript" src="assets/js/jquery.ezmark.js"></script>
	<script type="text/javascript" src="assets/js/jquery.currency.js"></script>
	<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="assets/js/retina.js"></script>
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