<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>



<div class="main-container">

<section>
  <div class="container">
    <div class="row mb-4 align-items-center">
      <div class="col-md-5 mb-3 mb-md-0"> <span class="text-muted">Video list</span>
      </div>
      <div class="col-md-7 d-flex align-items-center justify-content-md-end">
        <div class="view-filter"> <a class="active" 
        href=""><i class="las la-th-large"></i></a>
           
        </div>
        
      </div>
    </div>
    <div class="row">
    
    <c:if test="${list.size()==0 }">
    	<div class="col-md-12 alert alert-danger">
    	<h2>
    		没有找到相关信息
    		</h2>
    	</div>
    </c:if>
    
      	<c:forEach items="${list}" var="item">   
      <div class="col-lg-3 col-md-6 mb-5">
        <div class="card product-card card--default rounded-0">
                       
                        <a class="card-img-hover d-block" href="<%=basePath %>app/detail?id=${item.id}">
                          
                        <img class="card-img-front" src="<%=basePath %>${item.thumb}" alt="..."> </a>
                        <div class="card-icons">
                          
                        </div>
                        <div class="card-info">
                          <div class="card-body">
                            <div class="product-title font-w-5">
                            <a class="link-title" href="<%=basePath %>app/detail?id=${item.id}">${item.product_name }</a> </div>
                            <div class="mt-1"> <span class="product-price text-pink">  ${item.category_name }</span>
                              
                            </div>
                          </div>
                          <div class="card-footer bg-transparent border-0">
                            <div class="product-link d-flex align-items-center justify-content-center">
                              <button class="btn-cart btn btn-pink mx-3" onclick="javascript:location.href='<%=basePath %>app/detail?id=${item.id}';" type="button">
                              <i class="las la-play mr-1"></i> 播放视频 </button>
                            </div>
                          </div>
                        </div>
                      </div>
      </div>
    
      </c:forEach>
      
      
    </div>
    <div class="row">
      
    </div>
  </div>
</section>

<!--multi sec start-->
    
    
    <!--multi sec end-->

</div>

  
</div>
                    
        
        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>