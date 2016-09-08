<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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

				<!-- CONTENT -->
				<div id="content">
					<div class="container">
						<div>
							<div id="main">
								<h1 class="page-header">添加商品</h1>
								<div class="login-register">
									<div class="row">
										<div class="span8">
											<ul class="tabs nav nav-tabs">
												<li class="active">
													<a href="#">添加商品</a>
												</li>
											</ul>
											<!-- /.nav -->

											<div class="tab-content">

												<div class="tab-pane active" id="register">
													<sf:form method="post" modelAttribute="goods" action="add_goods" enctype="multipart/form-data">
														<div class="control-group">
															<label class="control-label" for="inputRegisterFirstName"> 商品名称 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="name" />
																<sf:errors path="name" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterSurname"> 商品价格 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="price" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterEmail"> 预设库存 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="stock" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterPassword"> 折扣 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="discount" />

															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 种类 成苗种苗 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="type" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 品种 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="varieties" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 高度<span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="height" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 地径 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="diameter" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 蓬径 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="punta_trail" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 存活率<span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="survival" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 树苗年限 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="life" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 结果年限 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="fruit_year" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 习性 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="habits" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype">产品种植地 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:input path="goods_address" />
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 上传图片 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<input type="file" value="选择封面图270*200" name="attachs">
																<input type="file" value="选择细节图870*420" name="attachs">
																<input type="file" value="选择细节图870*420" name="attachs">
																<input type="file" value="选择细节图870*420" name="attachs">
																<input type="file" value="选择细节图870*420" name="attachs">
																<input type="file" value="选择细节图870*420" name="attachs">
																<input type="file" value="选择细节图870*420" name="attachs">
															</div>
															<!-- /.controls -->
														</div>
														<!-- /.control-group -->

														<div class="control-group">
															<label class="control-label" for="inputRegisterRetype"> 商品简介 <span class="form-required" title="This field is required.">*</span>
															</label>

															<div class="controls">
																<sf:textarea path="intro" style="margin: 0px; width: 717px; height: 247px;" placeholder="请键入店铺简介${loginUser.id }" />
															</div>
															<!-- /.controls -->
														</div>
														<sf:hidden path="store_id" value="${my_store.id }" />
														<sf:hidden path="status" value="1" />
														<!-- /.control-group -->
														<div class="form-actions">
															<input type="submit" value="上架商品" class="btn btn-primary arrow-right">
														</div>
														<!-- /.form-actions -->
													</sf:form>
												</div>
												<!-- /.tab-pane -->
											</div>
											<!-- /.tab-content -->
										</div>
										<!-- /.span4-->

										<div class="span4">
											<h2 class="page-header">Why to work with us?</h2>

											<div class="images row">
												<div class="item span2">
													<img src="assets/img/icons/circle-dollar.png" alt="">

													<h3>Cheap services</h3>
												</div>
												<!-- /.item -->
												<div class="item span2">
													<img src="assets/img/icons/circle-search.png" alt="">

													<h3>Easy to find you</h3>
												</div>
												<!-- /.item -->
												<div class="item span2">
													<img src="assets/img/icons/circle-global.png" alt="">

													<h3>Act global or local</h3>
												</div>
												<!-- /.item -->
												<div class="item span2">
													<img src="assets/img/icons/circle-package.png" alt="">

													<h3>All in one package</h3>
												</div>
												<!-- /.item -->
											</div>
											<!-- /.row -->

											<hr class="dotted">

											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ullamcorper libero sed ante auctor vel gravida nunc placerat. Suspendisse molestie posuere
												sem, in viverra dolor venenatis sit amet. Aliquam gravida nibh quis justo pulvinar luctus. Phasellus a malesuada massa.</p>

											<ul class="unstyled dotted">
												<li>
													<span class="inner"> <strong>Lorem ipsum dolor sit amet</strong><br> Consectetur adipiscing elit. Proin aliquam lorem sed urna viverra accumsan.
														Aliquam sit amet dui et diam rutrum aliquet. Sed vulputate, arcu vitae aliquet facilisis, ligula sem posuere nisl, sit amet pretium ligula dolor

													</span>
												</li>

												<li>
													<span class="inner"> <strong>Lorem ipsum dolor sit amet</strong><br> Consectetur adipiscing elit. Proin aliquam lorem sed urna viverra accumsan.
														Aliquam sit amet dui et diam rutrum aliquet. Sed vulputate, arcu vitae aliquet facilisis, ligula sem posuere nisl, sit amet pretium ligula dolor
													</span>
												</li>

												<li>
													<span class="inner"> <strong>Lorem ipsum dolor sit amet</strong><br> Consectetur adipiscing elit. Proin aliquam lorem sed urna viverra accumsan.
														Aliquam sit amet dui et diam rutrum aliquet. Sed vulputate, arcu vitae aliquet facilisis, ligula sem posuere nisl, sit amet pretium ligula dolor
													</span>
												</li>
											</ul>
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
								<p>© Copyright 2015 by TIANKAI XIE, graduation project of Computer Science, Beijing Forestry University, All rights reserved.</p>
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