<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Object usertype = session.getAttribute("usertype");
%>


<jsp:include page="header.jsp"></jsp:include>


<!-- Blog -->
<section class="main-container">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 blog-right-col">
				<div class="row">
					<!-- Blog 01 -->
					<div class="col-md-12">
						<div class="blog-box blog-style-1 blog-single-detail">
						
						<br>
							
						
							<div class="blog-content">
							<h2>${art.title }</h2>
							

	<div class="blog-entry-meta">
								<ul class="list-inline">
									

									<li class="blog-comments"><i class="optico-icon-tag"></i><a href="#">点击 ${art.click}</a>,
									发布：${art.created} </li>
								</ul>
							</div>
								<blockquote>
									<p>${art.description}</p>
								</blockquote>
								<div>
									${art.tags}
								</div>
								<h4 class="pt-3">详细内容</h4>
								<div style="line-height:42px;font-size:18px;padding:25px 0">
								
									${art.bodytext}
									<div class="blog-thumbnail mt-4  mb-4">
								<img src="<%=basePath%>${art.thumb}" style="width:100%" class="img-fluid" alt="" />
							</div>
								</div>

							</div>

							<div class="entry-contant">
								<div class="entry-contant-left">
									<span class="entry-contant-title"></span>
								</div>
								<div class="entry-social-right">

								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="entry-np-nav">
										<nav>
											<div class="nav-links">


											</div>
										</nav>
									</div>
								</div>
							</div>

						</div>


					</div>
				</div>
			</div>
			<div class="col-lg-3 blog-left-col mb-25 mb-xs-20 mt-md-50">
				<div class="sidebar">
					<div class="widget widget-search">
						<form id="sf" class="search-form" action="<%=basePath%>app/news">
							<input type="search" name="key" class="form-control search-field" placeholder="Search …" value="" />
							
						</form>
					</div>
					<div class="widget widget-categories">
						<h3 class="widget-title" style="margin:20px 0">栏目</h3>
						<ul class="list-unstyled list-group-flush">
							<c:forEach items="${cates1}" var="item">
								<li  class="mb-3">
									<a class="list-group-item-action d-flex justify-content-between align-items-center" href="<%=basePath%>app/news?cateId=${item.id}">${item.title }</a>
									<span class="py" style="width: auto;border-radius: 10px"></span>
								</li>
							</c:forEach>

						</ul>
					</div>
					<div style="display:none" class="hide widget widget-recent-post">
						<h3 class="widget-title">推荐</h3>
						<ul class="recent-post-list">
<c:forEach items="${ydPh}" var="item" varStatus="_s">
	<c:if test="${_s.index<10}">
							<li class="recent-post-list-li">
								<div class="media">
									<a class="recent-post-thum" href="#">
										<img src="<%=basePath%>${item.thumb}" class="img-fluid" alt="" />
									</a>
									<div class="media-body">
										<a href="<%=basePath %>index/view?id=${item.id}">${item.title}</a>
										<span class="post-date">${item.created}</span>
									</div>
								</div>
							</li>
	</c:if>
</c:forEach>

						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog End -->
</div>
<!-- page content End -->








			<jsp:include page="footer.jsp"></jsp:include>

<script>


	$(".py").each(function () {
		var zh = $(this).prev("a").eq(0).html();
		console.log(zh)
		$(this).html(pinyin.getCamelChars(zh));
	});
</script>
