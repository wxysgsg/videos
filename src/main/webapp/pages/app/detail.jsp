<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<jsp:include page="header.jsp"></jsp:include>
<div class="main-container content-expand">
	<div class="main_content_inner" style="padding: 20px">


		<div uk-grid="" class="row uk-grid">
			<div class="col col-md-7 uk-width-2-3@m uk-first-column">

				<div id="video-box" uk-sticky="top: 400 ;media : @s"
					cls-active="video-resized uk-animation-slide-right;"
					class="uk-sticky">
					<span class="icon-feather-x btn-box-close"
						uk-toggle="target: #video-box ; cls: video-resized-hedden uk-animation-slide-left"></span>

					<div class="embed-video">
						<video controls=controls src="<%=basePath %>${g.vpath}"
							style="width: 100%"></video>
					</div>
				</div>
				<div class="uk-sticky-placeholder" hidden=""
					style="height: 495px; margin: 0px;"></div>

				<div class="video-info mt-3">

					<!-- video title -->
					<div class="video-info-title">
						<h1>${g.product_name }</h1>
					</div>

					<div class="uk-flex uk-flex-between">

						<div class="video-info-details">
							<span> ${g.click } 次播放 </span>
						</div>
						<div class="video-likes">
							<c:if test="${not empty username }">
								<c:if test="${usertype ne 3}">
									<c:if test="${faved==true}">
										<a class="btn btn-danger"
											href="<%=basePath%>app/fav1?id=${g.id }">取消收藏</a>
									</c:if>
									<c:if test="${faved==false}">
										<a href="<%=basePath%>app/fav?id=${g.id }"
											class="btn btn-primary"> <i class="fa fa-heart"></i> 收藏
										</a>
									</c:if>
								</c:if>
							</c:if>
						</div>

					</div>




					<hr class="mt-0 mb-2">


					<h3>视频描述</h3>
					<p>${g.description }</p>
					<h3>视频说明</h3>
					<p>${g.content }</p>
				</div>

				<hr>









			</div>
			<div class="col col-md-5 uk-width-expand@m">

				<div class="uk-flex uk-flex-middle uk-flex-between px-1 pb-3">
					<p class="mb-0 uk-h5">视频Video</p>



				</div>

				<div id="viewtube_related_videos-2"
					class="widget widget-video widget_viewtube_related_videos">
					<ul class="sidebar-related-video">
						<c:forEach items="${list}" var="item">
						<li>
							<div class="related-video-thumb">
								<a href="<%=basePath%>app/detail?id=${item.id}"> <img
									src="<%=basePath %>${item.thumb}" alt="Image">
								</a>
							</div>
							<div class="related-video-content">
								<p>
									<a href="<%=basePath%>app/detail?id=${item.id}">${item.product_name}</a>
								</p>
								<ul>
									<li>
										<div class="d-flex video-meta-bottom">${item.description }</div>
									</li>
									<li>
										<div class="d-flex video-meta-bottom">${item.created }</div>
									</li>
								</ul>
							</div>
						</li>
						</c:forEach>
						
					</ul>
				</div>


				

			</div>


		</div>

		<!-- footer
               ================================================== -->



	</div>
</div>









<div class="main" style="display: none">
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-right">
				<div class="product-view">
					<div class="row">
						<div class="col-sm-5">
							<div class="product-img-box">
								<p class="product-image">
								<div class="cloud-zoom-wrap">
									<a href="<%=basePath %>${g.thumb}" class="cloud-zoom"
										id="ma-zoom1" style="position: relative; display: block;">
										<img style="max-width: 345px" src="<%=basePath %>${g.thumb}"
										alt=" " title=" " style="display: block;">
									</a>
								</div>
								</p>

							</div>
						</div>
						<div class="product-shop col-sm-7">
							<div class="product-name"></div>
							<div class="ratings">
								<div class="rating-box">
									<div style="width: 67%" class="rating"></div>
								</div>
								<span class="amount"><a
									href="<%=basePath%>app/categoies?id=${g.category}">${g.category_name}</a></span>
							</div>
							<div class="box-container2">
								<div class="price-box">
									<p class="special-price">
										<span class="price-label">价格</span> <span id="product-price-1"
											class="price">￥${g.price }</span>

									</p>

								</div>
							</div>
							<div class="short-description">
								<div class="std">${g.description}</div>
							</div>

							<form class="form-horizontal" action="<%=basePath%>app/addcart"
								method="POST">
								<div class="form-group">
									<label class="col-md-2 col-sm-3 control-label">数量:</label>
									<div class="col-md-10 col-sm-5">
										<div class="input-group qty">
											<span class="input-group-btn">
												<button class="btn" id="addnum" type="button">-</button>
											</span> <input type="hidden" name="id" value="${g.id }"> <input
												type="text"
												style="border: 1px solid #ddd; width: 80px !important;"
												id="cartnum" required min="1" name="num" class="" value="1">
											<span class="input-group-btn">
												<button class="btn" id="sunum" type="button">+</button>
											</span>
										</div>
										<!-- /input-group -->
									</div>
								</div>
								<button type="submit" class="btn btn-danger btn-cart">加入购物车</button>
								<c:if test="${not empty username }">
									<c:if test="${usertype ne 3}">
										<c:if test="${faved==true}">
											<a class="btn btn-danger"
												href="<%=basePath%>app/fav1?id=${g.id }">取消收藏</a>
										</c:if>
										<c:if test="${faved==false}">
											<a href="<%=basePath%>app/fav?id=${g.id }"
												class="btn btn-primary"> <i class="fa fa-heart"></i> 收藏
											</a>
										</c:if>
									</c:if>
								</c:if>
							</form>
						</div>
						<!-- /.product-shop -->
					</div>
					<div class="product-tab tab-custom">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#product-desc" data-toggle="tab"
								aria-expanded="true">视频说明</a></li>

							<li style="margin-left: 25px" class=""><a
								href="#product-review" data-toggle="tab" aria-expanded="false">客户评价</a></li>

						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="product-desc">${g.content }
							</div>
							<div class="tab-pane" id="product-review">
								<c:forEach items="${cmt}" var="item">
									<div class="alert alert-danger">
										<h4>${item.buyer } 评价：</h4>
										<div>${item.content }</div>
									</div>
								</c:forEach>
							</div>

						</div>
					</div>
					<!-- /.product-tab -->
				</div>
				<!-- /.product-view -->

			</div>
			<!-- /.col-right -->
			<div class="col-sm-3 col-left">
				<div class="block ">

					<div id="special-offer" class="owl-container">
						<div class="owl owl-carousel owl-theme"
							style="opacity: 1; display: block;">
							<div class="owl-wrapper-outer">
								<div class="owl-wrapper">



									<div class="owl-item" style="width: 300px;">
										<div class="sepecialoffer-item item">
											<c:forEach items="${list}" var="item">
												<div class="col-lg-12 col-md-12 mb-5">
													<div class="card product-card card--default rounded-0">
														<div class="sale-label"></div>
														<a class="card-img-hover d-block"
															href="<%=basePath %>app/detail?id=${item.id}"> <img
															class="card-img-back" src="<%=basePath %>${item.thumb}"
															alt="..."> <img class="card-img-front"
															src="<%=basePath %>${item.thumb}" alt="...">
														</a>
														<div class="card-icons"></div>
														<div class="card-info">
															<div class="card-body">
																<div class="product-title font-w-5">
																	<a class="link-title"
																		href="<%=basePath %>app/detail?id=${item.id}">${item.product_name }</a>
																</div>
																<div class="mt-1">
																	<span class="product-price text-pink">
																		￥${item.price }</span>

																</div>
															</div>
															<div class="card-footer bg-transparent border-0">
																<div
																	class="product-link d-flex align-items-center justify-content-center">
																	<button class="btn-cart btn btn-pink mx-3"
																		onclick="javascript:location.href='<%=basePath %>app/detail?id=${item.id}';"
																		type="button">
																		<i class="las la-shopping-cart mr-1"></i> 我要购买
																	</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>



										</div>
									</div>
								</div>



							</div>
						</div>

					</div>

				</div>
				<!-- /.col-left -->
			</div>
		</div>
	</div>




	<jsp:include page="footer.jsp"></jsp:include>
	<script>
$(".mega-menu-category").css("display","none");


$("#addnum").click(function(){
	
	var cartNum = $("#cartnum").val();
	cartNum = parseInt(cartNum);
	var n = cartNum-1;
	n=n>0?n:1;
	$("#cartnum").val(n);


});



$("#sunum").click(function(){
	
	var cartNum = $("#cartnum").val();
	cartNum = parseInt(cartNum);
	$("#cartnum").val(cartNum+1);


});


</script>

	<link rel="stylesheet" type="text/css"
		href="<%=basePath%>ui/confirm/css/xcConfirm.css" />

	<script src="<%=basePath%>ui/confirm/js/xcConfirm.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
<c:if test="${not empty message}">
window.wxc.xcConfirm("${message}", window.wxc.xcConfirm.typeEnum.info);
setTimeout(function(){
	location.href="<%=basePath%>app/detail?id=${id}"
		}, 1500)
		</c:if>
	</script>