<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
  <div class="breadcrumbs">
            <div class="container">
                <ul class="breadcrumb">
                	<li><a href="<%=basePath%>">首页</a></li>
                    <li class="active">平台视频图片</li>
               	</ul>
            </div>
        </div>
        
        <div class="main">
        	<div class="container">
                <div class="row">
                	<div class="col-sm-3 col-left">
                    	<div class="block block-layered-nav">
                            <div class="block-title">
                                <strong><span>视频类目</span></strong>
                            </div>
                            <div class="block-content">
                              
                                <div id="narrow-by-list">
                                    <div class="layered layered-Category">
                                     
                                        <div class="content-shopby">
                                            <ol>
                                            	<c:forEach items="${cates}" var="item">
                                                <li><a href="<%=basePath%>app/categoies?id=${item.id}">${item.title }</a></li>
                                                </c:forEach>
                                            </ol>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                </div>
                            </div>
                        </div><!-- /sort -->
                    	
                    	
                        
                    </div><!-- /.col-left -->
                    <div class="col-sm-9 col-right">
                    
                        <div class="toolbar">
                            
                            
                        </div><!-- /.toolbar -->
                        <div class="row products">
                        	
                        	
                        	
                        	<c:forEach items="${ads}" var="item">
                        	<div class="col-lg-6">
               <div class="card card-block card-stretch card-height blog pricing-details">
                  <div class="card-body text-center rounded">
                     <div class="pricing-header">
                        <div class="icon-data"><i class="ri-star-line"></i>
                        </div>
                        <h2 class="mb-4 display-5 font-weight-bolder">
                        ${item.title }
                        </h2>
                     </div>
                     <h3 class="mb-3"> ${item.url }</h3>
                     <ul class="list-unstyled mb-0">
                        <li>   ${item.intro }</li>
                     </ul> 
                  </div>
               </div>
            </div>
                            </c:forEach>
                            
                        	
                        </div><!-- /.toolbar -->
                    </div><!-- /.col-right -->
                </div>
            </div>
        </div>                  
                    
                    
        
        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>