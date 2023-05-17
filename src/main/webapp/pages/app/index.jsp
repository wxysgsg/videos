<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<jsp:include page="header.jsp"></jsp:include>

<div class="main-container">

	<div class="banners mt-4 mb-5">
		
		<c:forEach items="${ads}" var="item" varStatus="s">
		<section class="banner"
			style="background: url(<%=basePath%>${item.thumb });">
			<div class="container">
				<div class="row">
					<div class="col-xl-7 col-lg-12 my-auto">
						<div class="banner-content">
							<h1>${item.title }</h1>
							<div class="d-block d-lg-flex">
								<ul class="list-inline meta">

								</ul>
							</div>
							<p>
							${item.intro }
							</p>
							<a class="viewtube-btn  mt-30" target="_blank"
								href="${item.url }">Read more</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		</c:forEach>
		
	</div>

	<div class="row mb-4">
		<div class="col-md-6 my-auto">
			<h1>视频Video</h1>
		</div>
		<div class="col-md-6 my-auto">
			<div class="text-right">
				<a class="viewtube-btn bordered no" href="<%=basePath%>app/categoies"> Watch More</a>
			</div>
		</div>
	</div>
	<div class="row justify-content-center video-items"
		data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>
			<c:forEach items="${all}" var="item" varStatus="s">
		
		<div class="col-xl-12">
			<div class="video-item-card">
				<div class="video-thumb">
					<video class="viewtube-player" preload="none" playsinline controls
						data-poster="<%=basePath %>${item.thumb}">
						<source
							src="<%=basePath %>${item.vpath}"
							type="video/mp4" />
						<source
							src="<%=basePath %>${item.vpath}"
							type="video/webm" />
					</video>
				</div>
				<div class="video-content">
					<div class="d-flex">
						<a href="#" class="avatar"> <img
							src="<%=basePath %>"
							alt="">
						</a>
						<div class="my-auto">
							<a href="<%=basePath%>app/detail?id=${item.id}">
								<h5>${item.product_name}</h5>
							</a>
							<ul class="list-inline">
								<li class="list-inline-item"><a class="author" href="#">
										${item.created } </a></li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		
	</div>	</div>	</div>
		



<!-- Quick View Modal -->

<jsp:include page="footer.jsp"></jsp:include>
