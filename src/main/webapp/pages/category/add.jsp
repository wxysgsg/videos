<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">

	<title></title>

	<link rel="preconnect" href="//fonts.gstatic.com/" crossorigin="">

	<!-- PICK ONE OF THE STYLES BELOW -->
	<link href="<%=basePath%>appstack/css/classic.css" rel="stylesheet">
	<!-- <link href="css/corporate.css" rel="stylesheet"> -->
	<!-- <link href="css/modern.css" rel="stylesheet"> -->

	<!-- BEGIN SETTINGS -->
	<!-- You can remove this after picking a style -->
	<style>
		body {
			opacity: 1;
		}
	</style>
	
	</head>

<body>
	<div class="wrapper">
	

		<div class="main">
			

			<main class="contvent ">
				<div class="container-fluid p-0">

					

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									
								</div>
								<div class="card-body">
								<div class="col-lg-6">
								
<form action="<%=basePath %>category/save" class="form" method="post" style="width:50%;">
   
            <fieldset>
                <div class="widget">
                    <div class="alert alert-info alert-dismissible">
                    
                   视频分类
                    
                    </div>
                    <div class="formRow">
                        <label>分类名称:</label>
                        <div class="formRight">
                        	<input class="form-control" name="title" type="text" required value="">
                        	   <input name="pid" type="hidden" value="0"/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- 
                    <div class="formRow">
                        <label>上级分类:</label>
                        <div class="formRight">
                        	<select name="pid">
                        	<option value="0">一级分类</option>
                        	<c:forEach items="${list}" var="item">
                        	<c:if test="${item.pid eq 0 }">
                        	<option value="${item.id }">
                        	${item.title }
                        	</option>
                        	</c:if>
                        	</c:forEach>
                        	</select>                        	
                        </div>
                        <div class="clear"></div>
                    </div> -->
                    <!-- 
                    <div class="formRow">
                        <label>封面:</label>
                        <div class="formRight">
                        	<input type="text"  class="form-control" id="thumb" value="" name="thumb" >											
												<a href="javascript:;" class="uploadImg ">点击上传</a>                        	
                        </div>
                        <div class="clear"></div>
                    </div>
                      -->
                    
                    <div class="formRow">
                        <label>分类描述:</label>
                        <div class="formRight">
                        	<textarea class="form-control" name="description" required></textarea>                        	                        	
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                 
                    <br/>
                    <input type="submit" value="提交数据" class="dredB btn btn-primary">
                    </div>
                </div>
            </fieldset>
            
         
        </form>
								</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			
		</div>
	</div>

	<script src="<%=basePath%>appstack/js\app.js"></script>
	
	<script src="<%=basePath%>scripts/window.js"></script>
   <script>
$().ready(function(){
	$(".uploadImg").click(function(){
		openWindow("<%=basePath%>upload.jsp");
	});
	$("#thumb").on("input",function(){
		$(".oldImg").attr("src","<%=basePath%>"+$("#thumb").val());
	});
});
</script>
	
<script>
		<c:if test="${not empty message}">
		toastr["success"]("${message}", "操作提醒", {
			positionClass : "toast-top-center",
			closeButton : true,
			progressBar : true,
			newestOnTop : true,
			rtl : $("body").attr("dir") === "rtl"
					|| $("html").attr("dir") === "rtl",
			timeOut : 5000
		});
		
		setTimeout(function () {
        		location.href = "<%=basePath%>category/add";
    			},1000);
		</c:if>
	</script>
</body>

</html>
