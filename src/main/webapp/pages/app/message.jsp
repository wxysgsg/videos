<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="header.jsp"></jsp:include>
  
                    
        
        

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
setTimeout(function(){
	location.href="<%=basePath %>"
}, 1500)
</c:if>
</script>	
		
		