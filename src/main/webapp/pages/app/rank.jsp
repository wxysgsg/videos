<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
 
 
<section class=" py-6" style="background:#DDD url(<%=basePath%>static/header_bgV2.png) no-repeat">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6">
        <h1 class="h2 mb-0">销量排行</h1>
      </div>
      <div class="col-md-6 mt-3 mt-md-0">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb justify-content-md-end bg-transparent p-0 m-0">
            <li class="breadcrumb-item"><a class="link-title" href="#">Home</a>
            </li>
            <li class="breadcrumb-item"><a class="link-title" href="#">Shop</a></li>
            <li class="breadcrumb-item active text-primary" aria-current="page">Sale best</li>
          </ol>
        </nav>
      </div>
    </div>
    <!-- / .row -->
  </div>
  <!-- / .container -->
</section>


<div class="product-wrapper"  data-aos="fade-up"  data-aos-delay="200">
            <div class="container" style="padding:25px 0">
                <div class="row">
                    <div class="col-12">
                        <div class="product-slider-default-2rows default-slider-nav-arrow">
                            <!-- Slider main container -->
                            <div class="swiper-container product-default-slider-4grid-2row">
                                <!-- Additional required wrapper -->
                                <div class="swiper-wrapper row">
                                        <c:forEach items="${list}" var="item" >
                                    
                                    <!-- Start Product Default Single Item -->
                                    <div style="position:relative;" class=" col-md-4 product-default-single-item product-color--aqua swiper-slide">
                                    <div style="position:absolute; right:0;top:0; width:50px;background:#c00;color:#fff">
                                    销量${item.list.size() }
                                    </div>
                                    
                                        <div class="image-box">
                                            <a href="<%=basePath %>app/detail?id=${item.id}" class="image-link">
                                                <img style="max-width:100%" src="<%=basePath%>${item.thumb}" alt="">
                                            </a>
                                            <div class="tag">
                                              
                                            </div>
                                            <div class="action-link">
                                                <div class="action-link-left">
                                                   
                                                </div>
                                                <div class="action-link-right">
                                                    
                                                 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="content">
                                            <div class="content-left">
                                                <h6 class="title">
                                                <a href="<%=basePath %>app/detail?id=${item.id}" class="uk-button uk-button-large uk-width-8-10">
                                                ${item.product_name }</a></h6>
                                                
                                            </div>
                                            <div class="content-right">
                                                <span class="price"> ￥ ${item.price }</span>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- End Product Default Single Item -->
                                    </c:forEach>
                                    
                                    
                                   
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Modal Quickview cart -->
            <div class="uk-width-medium-1-4">
                <div class="uk-panel">
                    <ul class="uk-nav uk-nav-side">
                        <li class="uk-nav-header"></li>
                     </ul>
                </div>
                
                
            </div>

        </div>
    </div>
</div>



                    
        
        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>