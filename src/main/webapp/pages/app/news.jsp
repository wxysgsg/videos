<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String usertype = session.getAttribute("userType")+"";
%>


<jsp:include page="header.jsp"></jsp:include>


<div class="main-container">



	<div class="">
		<section class="pt-4 pb-100">
			<div class="container-fluid">
				<div class="row">
					<c:forEach items="${cList}" var="item" varStatus="vs">
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="video-item-card">
							<div class="video-thumb">
								<a href="<%=basePath%>app/view?id=${item.id}">
								<img src="<%=basePath%>${item.thumb}">
								</a>
							</div>
							<div class="video-content">
								<div class="d-flex">
									
									<div class="my-auto">
										<a href="<%=basePath%>app/view?id=${item.id}">
											<h5>${item.title }</h5>
										</a>
										<ul class="list-inline">
											<li class="list-inline-item"><a class="author" href="#">
													${item.description } </a></li>
											<li class="list-inline-item">
												<div class="d-flex video-meta-bottom">
													<i class="fas fa-circle ml-2 mr-2"></i> 
													${item.created }
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					
					
					
				</div>
			</div>
		</section>

	</div>


	<STYLE>
.lt-tit {
	text-align: center;
	padding-top: 45px;
}

.news-main, .news-pic-wr, .news-pic {
	WIDTH: 250PX !IMPORTANT;
}

.news-pic-if {
	width: 251px !important;
	padding: 0px 10px 0 10px;
}

.news-pt .news-it, .news-pt .lis-news {
	width: 202px !important;
}

.lt-tit a {
	font-size: 24px;
	color: #000;
	font-weight: bold;
}

.news-pt .lis-news a {
	overflow: auto;
	text-overflow: none;
	white-space: pre-wrap;
}

.news-pt .lis-news .news-if {
	padding-right: 0px !important;
}
</STYLE>

	
</div>



<!-- Blog -->

</div>
<!-- page content End -->



<jsp:include page="footer.jsp"></jsp:include>

