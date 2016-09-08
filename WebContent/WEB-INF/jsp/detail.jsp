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
							<div class="row">
								<div class="span9">
									<h1 class="page-header">${goods.name }</h1>

									<div class="carousel property">
										<div class="preview">

											<img src="resources/photo/${images[0].img }" alt="">
										</div>
										<!-- /.preview -->
										<div class="content">
											<a class="carousel-prev" href="#">Previous</a> <a
												class="carousel-next" href="#">Next</a>
											<ul>
												<c:forEach items="${images}" var="um">
													<li><img src="resources/photo/${um.img }" alt=""></li>
												</c:forEach>
											</ul>
										</div>
										<!-- /.content -->
									</div>
									<!-- /.carousel -->

									<div class="property-detail">
										<div class="pull-left overview">
											<div class="row">
												<div class="span3">
													<h2>树苗概要</h2>
													<table>
														<tr>
															<th>单价：</th>
															<td>${goods.price}元</td>
														</tr>
														<tr>
															<th>种类：</th>
															<td>${goods.type}</td>
														</tr>
														<tr>
															<th>品种:</th>
															<td>${goods.varieties }</td>
														</tr>
														<tr>
															<th>高度：</th>
															<td>${goods.height}</td>
														</tr>
														<tr>
															<th>地径：</th>
															<td>${goods.diameter}</td>
														</tr>
														<tr>
															<th>蓬径：</th>
															<td>${goods.punta_trail}</td>
														</tr>
														<tr>
															<th>成活率：</th>
															<td>${goods.survival}</td>
														</tr>
														<tr>
															<th>树苗年限：</th>
															<td>${goods.life }年</td>
														</tr>
														<tr>
															<th>结果年限：</th>
															<td>${goods.fruit_year}年</td>
														</tr>
														<tr>
															<th>种植地：</th>
															<td>${goods.goods_address}</td>
														</tr>
														<tr>
															<th>库存：</th>
															<td>${goods.stock}</td>
														</tr>
													</table>
												</div>
												<!-- /.span2 -->
											</div>
											<!-- /.row -->
										</div>
										<div style="float: right">
											<a class="btn btn-primary btn-sm" href="#order"
												data-toggle="modal">商品预约</a>
											<c:choose>
												<c:when test="${isInLikeList == '没有收藏'}">
													<a class="btn btn-primary btn-sm"
														href="like?like_goods_id=${goods.id}">收藏商品</a>
												</c:when>
												<c:otherwise>
													<a class="btn btn-sm disabled">该商品已收藏</a>
												</c:otherwise>
											</c:choose>
											<a class="btn btn-primary btn-sm" href="addToCart?goods_id=${goods.id}">加入购物车</a>
										</div>
										<div class="modal hide fade" id="order">
											<div class="modal-header">
												<a href="#" class="close" data-dismiss="modal">×</a>
												<h4>确认订单</h4>
											</div>
											<form class="control-horizontal" action="addOrders"
												method="post">
												<div class="modal-body">
													<div class="control-group">
														<label class="control-label">商品名称</label>
														<div class="controls">
															<p>${goods.name }</p>
															<p style ="color:red">注意：该商品的库存数量为：${goods.stock }，如果预定该数量以上的商品请及时与卖家联系！ </p>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">预定数量</label>
														<div class="input-append spinner" data-trigger="spinner">
															<input type="text" value="1" data-rule="quantity"
																name="quantity">
															<div class="add-on">
																<a href="javascript:;" class="spin-up" data-spin="up">
																	<i class="icon-sort-up"></i>
																</a> <a href="javascript:;" class="spin-down"
																	data-spin="down"> <i class="icon-sort-down"></i></a>
															</div>
														</div>
														<input type="hidden" name="price" value="${goods.price }">
														<input type="hidden" name="store_id"
															value="${goods.store_id }"> <input type="hidden"
															name="goods_id" value="${goods.id }">
													</div>
												</div>
												<div class="modal-footer">
													<input type="submit" class="btn btn-primary" value="提交订单" />
												</div>
											</form>
										</div>
										<h4>店家简介：</h4>
										<p>
											<strong>店名：</strong>${store.name }
										</p>
										<p>
											<strong>联系人：</strong>${seller.username }
										</p>
										<p>
											<strong>联系电话：${store.phone }</strong>
										</p>
										<p>
											<strong>E-mail：</strong>${store.email }
										</p>
										<p>
											<strong>地址：</strong>${store.address }
										</p>
										<p>
											<strong>邮编：</strong>${store.postcode }
										</p>
										<p>
											<strong>店铺简介：</strong>${store.details }
										</p>
										<h2>树苗详情</h2>
										<p>${goods.intro}</p>
										<h2>种植地图</h2>
										<div id="property-map"></div>
										<!-- /#property-map -->
									</div>
								</div>
								<div class="sidebar span3">
									<div class="widget our-agents">
										<div class="title">
											<h2>店长信息</h2>
										</div>
										<!-- /.title -->
										<div class="content">
											<div class="agent">
												<div class="image">
													<img src="assets/img/photos/emma-small.png" alt="">
												</div>
												<!-- /.image -->
												<div class="name">${seller.username }</div>
												<!-- /.name -->
												<div class="phone">${store.phone }</div>
												<!-- /.phone -->
												<div class="email">
													<a href="mailto:${seller.email }">${seller.email }</a>
												</div>
												<!-- /.email -->
											</div>
											<!-- /.agent -->
										</div>
										<!-- /.content -->
									</div>
									<!-- /.our-agents -->
									<div class="widget properties last">
										<div class="title">
											<h2>该店还有</h2>
										</div>
										<!-- /.title -->
										<div class="content">
											<c:forEach items="${ anythingElse}" var="um">
												<div class="property">
													<div class="image">
														<a href="detail?id=${um.id }"></a> <img
															src="resources/photo/${um.img }" alt="">
													</div>
													<!-- /.image -->
													<div class="wrapper">
														<div class="title">
															<h3 style="overflow: hidden; text-overflow: ellipsis;">
																<a style="white-space: nowrap;width=100%;"
																 href="detail?id=${um.id}">${um.name }</a>
															</h3>
														</div>
														<!-- /.title -->
														<div class="location">${um.type }</div>
														<!-- /.location -->
														<div class="price">￥${um.price }</div>
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