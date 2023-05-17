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
                    <li class="active">留言</li>
               	</ul>
            </div>
        </div>
        
        
        
        
        <div class="main">
        	<div class="container">
            	<div class="row">
                    <div class="col-sm-3">
                    	<div class="block block-layered-nav">
                            <div class="block-content">
                            	<h2>视频类目</h2>
                                <ol>
                                
                                  	<c:forEach items="${cates}" var="item">
                                                <li><a href="<%=basePath%>app/categoies?id=${item.id}">${item.title }</a></li>
                                                </c:forEach>
                                </ol>
                           	</div>
                        </div>
                        
                        
                        
                    </div><!-- /sidebar -->
                	<div class="col-sm-9">
                    	<div class="blog-detail blog-list">
                        	<div class="blog-image"><img src="images/blog/blog-09.jpg" class="img-responsive" alt=""></div>
                            
                            <hr>
                            <div class="title-group3">
                            	<h3>留言 </h3>
                            </div>
                            <div class="comment-list">
                            
                            ${html }
                                
                                
                                
                            </div>
                            <hr>
                            <div class="title-group3">
                            	<h3 id="title">在线留言 Message</h3>
                            </div>
                            <form action="<%=basePath%>app/comment" method="POST">
                            <div class="row">
                            	
                            	<div class="col-sm-12">
                                	<div class="form-group">
                                    	填写内容
                                    </div>
                                </div>
                            	<div class="col-sm-12">
                                	<div class="form-group">
                                	
                                	<input name="mid" id="mid" type="hidden" value="0"/>
            <fieldset>
                                    	<textarea class="form-control" name="content" placeholder="Your comment" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-default btn-lg">提交留言 SUBMIT COMMENT</button>
                            </form>
                            <br>
                        </div>
                    </div><!-- /content -->
                </div>
            </div>
        </div>             
                    
                    
        
        

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(".mega-menu-category").css("display","none");
</script>


<link rel="stylesheet" type="text/css" href="<%=basePath %>ui/confirm/css/xcConfirm.css"/>
		
		<script src="<%=basePath %>ui/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<script>
<c:if test="${not empty message}">
window.wxc.xcConfirm("${message}", window.wxc.xcConfirm.typeEnum.info);
	setTimeout(function () {
        		location.href = "<%=basePath%>app/feedback";
    			},1000);
</c:if>

function show(id)
{
$("#mid").val(id);
$("#title").html("回复留言  Reply he/she");
	var el = document.getElementById("title");
	ele.scrollTop = ele.scrollHeight;
}





</script>
	
		
		