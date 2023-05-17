<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>首页</title>
<link rel="icon" href="assets/images/thumbnail.png">
<link rel="stylesheet"
	href='https://fonts.googleapis.com/css?family=Fira+Sans+Condensed%3A100%2C200%2C300%2C400%2C500%2C600%2C700%2C800%2C900%7COpen+Sans%3A300%2C400%2C600%2C700%2C800'>
<link rel="stylesheet" href='<%=basePath %>static/index/assets/css/default.css'>
<link rel="stylesheet" href='<%=basePath %>static/index/assets/css/plugins.css'>
<link rel="stylesheet" href='<%=basePath %>static/index/assets/css/style.css'>
<link rel="stylesheet" href='<%=basePath %>static/index/assets/css/color.css'>
<link id="template-color" rel="stylesheet" href='<%=basePath %>static/index/assets/css/color.css'>
</head>
<body>

	<div id="preloader">
		<div class="spinner">
			<div class="uil-ripple-css">
				<div></div>
				<div></div>
			</div>
		</div>
	</div>
	<header class="site-header fixed-top">
		<div class="container-fluid">
			<div class="row justify-content-between">
				<div class="col-xl-2 col-lg-2 my-auto d-none d-lg-block">
					<div class="d-flex">
						<a href="#" class="sidebar-toggle"> <i class="far fa-bars"></i>
						</a>
						<div class="logo my-auto">
							<a href="<%=basePath %>" class="custom-logo-link">
							<img src="<%=basePath %>static/index/assets/images/logo.png" class="custom-logo" alt="ViewTube"></a>
						</div>
					</div>
				</div>
				<div class="col-xl-7 col-lg-7 my-auto d-none d-xl-block">
					<form class="ajax-search-form" action="<%=basePath %>app/search">
						<input type="text" name="q" class="keyword" placeholder="Search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
						<ul class="datafetch"></ul>
					</form>
				</div>
				<div class="col-xl-1 col-lg-1 my-auto text-right">
					<a class="upload-video" href="<%=basePath%>manage/index"><i
						class="far fa-video-plus"></i></a>
				</div>
				<div class="col-xl-2 col-lg-2 my-auto">
					<div class="d-flex">
						<div class="d-flex my-auto">
							<i class="fad fa-sun my-auto"></i> <label class="toggle-switch">
								<input type="checkbox"> <span class="slider round"></span>
							</label>
						</div>
						<div class="d-flex float-right">
							<div class="top-header-action">
								<div class="widget-header">
									<div class="my-account-widget">
										<div  onclick="javascript:location.href='<%=basePath%>manage/index';" class="my-account-button">
										<a href="<%=basePath%>manage/index">
											<i class="fad fa-user"></i>
											</a>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="off-canvas-menu-bar">
		<div class="pl-30 pr-30">
			<div class="row">
				<div class="col-7 my-auto">
					<a href="<%=basePath %>" class="custom-logo-link" rel="home"
						aria-current="page"><img width="512" height="85"
						src="<%=basePath %>static/index/assets/images/logo.png" class="custom-logo" alt="ViewTube"></a>
				</div>
				<div class="col-3 my-auto">
					<label class="toggle-switch"> <input type="checkbox">
						<span class="slider round"></span>
					</label>
				</div>
				<div class="col-2 my-auto">
					<div class="mobile-nav-toggler">
						<span class="fas fa-bars"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="off-canvas-menu">
		<div class="menu-backdrop"></div>
		<i class="close-btn fa fa-close"></i>
		<nav class="mobile-nav">
			<div class="text-center pt-3 pb-3">
				<a href="<%=basePath %>" class="custom-logo-link" rel="home">
<img src="<%=basePath%>static/index/assets/images/logo.png" class="custom-logo" alt="Sayara"></a>
			</div>
			<ul class="navigation">
			</ul>
		</nav>
	</div>
	<div class="container-fluid p-0">
		<div class="d-flex topspace-90">
			<div class="sidebar-menu open">
				<nav class="desktop-menu">
					<ul class="menu">
						<li class="menu-item current-menu-item"><a href="<%=basePath%>"><i
								class="fas fa-home"></i><span>首页</span></a></li>
						
						
						     <li class="menu-item "> 
                     <a class="nav-link  " href="<%=basePath %>app/best" >
                     <i class="fab fa-wordpress"></i>
             排行
                     </a>
                 </li>
                 
                 <c:if test="${not empty userid }">
                   <li class="menu-item "> 
                     <a class="nav-link  active" href="<%=basePath %>app/foru" >
                     <i class="fas fa-gamepad"></i>
                推荐
                     </a>
                 </li>
                 </c:if>
                   	
                    	<c:forEach items="${cates}" var="item1">
                       <li class="nav-item "> 
                     <a class="nav-link"   href="<%=basePath%>app/categoies?id=${item1.id}">
                     <i class="fab fa-youtube"></i>
                     ${item1.title }</a> </li>
                      </c:forEach>
                 
                    <li class="menu-item "> 
                     <a class="nav-link  active" href="<%=basePath %>app/news" >
                     <i class="fas fa-burn"></i>
               资讯
                     </a>
                 </li>
                 
					</ul>
				</nav>
			</div>