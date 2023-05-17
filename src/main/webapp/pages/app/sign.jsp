<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>



        <div uk-height-viewport="" style="margin-top:25px;" class=" " style="min-height: calc(100vh);">
        <div class="uk-width-2-3@m uk-width-1-2@s m-auto rounded">
            <div class="uk-child-width-1-2@m uk-grid-collapse bg-gradient-primary uk-grid" uk-grid="">


                <!-- column one -->
                <div class="uk-margin-auto-vertical uk-text-center uk-animation-scale-up p-3 uk-light uk-first-column">
                    <img src="<%=basePath %>static/assets/images/logo-light-icon.png" width="45" alt="">
                    <h1 class="mb-4 mt-2"> 视频推荐网</h1>
                    <p>欢迎您注册  welcome . </p>
                </div>

                <!-- column two -->
                <div class="uk-card-default p-6">
                    <div class="my-4 uk-text-center">
                        <h2 class="mb-0"> Welcome back</h2>
                        <p class="my-2">Create your account.</p>
                    </div>
                  <form action="<%=basePath%>app/signup" method="POST">
                        <div class="row">
                            <div class="col-sm-6">
                            
                                <div class="form-group">
                                	<label>账号*</label>
                                	<input type="text" minlength="3" class="form-control" name="username" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                	<label>密码*</label>
                                	<input type="text" minlength="3" class="form-control" name="password" required>
                                </div>
                            </div> <div class="col-sm-4">
                                <div class="form-group">
                                	<label>手机号码*</label>
                                	<input type="tel" class="form-control" name="tel" required>
                                </div>
                            </div> 
                           
                            
                             <div class="col-sm-4">
                                <div class="form-group">
                                	<label>地址*</label>
                                	<input type="text" class="form-control" name="address" required>
                                </div>
                            </div>
                           
                             <div class="col-sm-4">
                                <div class="form-group">
                                	<label>性别*</label>
                                	<p>
                                	<input type="radio" style="pointer-events: auto;opacity:1;position:relative" checked class="" name="sex" value="1"> 男
                                	<input type="radio" style="pointer-events: auto;opacity:1;position:relative" class="" name="sex" value="2"> 女
                                	</p>
                                </div>
                            </div>
                           
                          
                            <div class="col-sm-12">
                                <div class="form-group">
                                	<label>备注*</label>
                                	<input type="text" class="form-control" name="maincontent" required>
                                </div>
                            </div>
                             
                           
                           
                           <input type="hidden"  class="" name="type" value="1">
                        </div>
                        <button type="submit" class="btn btn-danger btn-full btn-lg">下一步</button>
                        </form>
                </div><!--  End column two -->

            </div>
        </div>
    </div>
        
        
        
        
        
        <div class="main" style="display:none">
        	<div class="container">
            	<div class="row">
            	
            	
            	
                	<div class="col-lg-7">
                    	<div class="page-title page-title-line">
                        	<h1></h1>
                        </div>
                        <p class="text-muted">All fields are required</p>
                        
                        <br>
                    </div>
                    <div class="col-lg-5 mt-6 mt-lg-0">
        <div class="border-0 rounded p-5 bg-dark-1 contact-info">
         
        <div class="d-flex mb-4 border-bottom pb-4">
          <div class="mr-2"> <i class="las la-map-marker-alt ic-2x text-primary"></i>
          </div>
          <div>
            <h6 class="mb-1 text-white">我们的地址</h6>
            <p class="mb-0">xxx省xx市xx街道 xx号</p>
          </div>
        </div>
        <div class="d-flex mb-4 border-bottom pb-4">
          <div class="mr-2"> <i class="las la-envelope ic-2x text-primary"></i>
          </div>
          <div>
            <h6 class="mb-1 text-white">联系邮箱 </h6>
            <a href="#">E-MAIL:info@domain.com / services@domain.com</a>
          </div>
        </div>
        <div class="d-flex mb-4 border-bottom pb-4">
          <div class="mr-2"> <i class="las la-mobile ic-2x text-primary"></i>
          </div>
          <div>
            <h6 class="mb-1 text-white">如有问题请联系我们</h6>
            <a href="#">1-800-222-000 / 1-800-222-002</a>
          </div>
        </div>
        <div class="d-flex mb-2">
          <div class="mr-2"> <i class="las la-pen ic-2x text-primary"></i>
          </div>
          <div>
            <h6 class="mb-1 text-white">网上书店祝您愉快</h6>
            <span>happy  .....eve day</span>
          </div>
        </div>
        
        </div>
      </div>
                </div>
             
            </div>
        </div>                
                    
                    
        
        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>


<link rel="stylesheet" type="text/css" href="<%=basePath %>ui/confirm/css/xcConfirm.css"/>
		<script src="<%=basePath %>ui/confirm/js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>ui/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<script>
<c:if test="${not empty message}">
window.wxc.xcConfirm("${message}", window.wxc.xcConfirm.typeEnum.info);
</c:if>
</script>	
		
		