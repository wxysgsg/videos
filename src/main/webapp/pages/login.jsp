<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>登录 </title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="<%=basePath %>static/adm/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath %>static/adm/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath %>static/adm/assets/css/authentication/form-2.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/adm/assets/css/forms/theme-checkbox-radio.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/adm/assets/css/forms/switches.css">
</head>
<body class="form">
    

    <div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">登录</h1>
                        <p class="">Log in to your account to continue.</p>
                        <form class="text-left" action="<%=basePath%>manage/login" method="post">
                            <div class="form">

                                <div id="username-field" class="field-wrapper input">
                                    <label for="username">账号</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                    <input required id="username" name="username" type="text" class="form-control" placeholder="输入您的账号">
                                </div>

                                <div id="password-field" class="field-wrapper input mb-2">
                                    <div class="d-flex justify-content-between">
                                        <label for="password">密码</label>
                                        <a href="<%=basePath %>" class="forgot-pass-link">平台首页</a>
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    <input required id="password" name="password" type="password" class="form-control" placeholder="输入您的密码">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" id="toggle-password" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                </div>
                                <div class="d-sm-flex justify-content-between">
                                    <div class="field-wrapper">
                                        <button type="submit" class="btn btn-primary" value="">登 录</button>
                                    </div>
                                </div>

                                <div class="division">
                                      <span>OR</span>
                                      <p id="msg" style="color:#fff">
                                      </p>
                                </div>

                                

                                <p class="signup-link">没有账号 ? 
                                <a href="<%=basePath%>app/sign">注册平台账号</a></p>

                            </div>
                        </form>

                    </div>                    
                </div>
            </div>
        </div>
    </div>

    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="<%=basePath %>static/adm/assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="<%=basePath %>static/adm/bootstrap/js/popper.min.js"></script>
    <script src="<%=basePath %>static/adm/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="<%=basePath %>static/adm/assets/js/authentication/form-2.js"></script>

    <script>
    //toastr[error]("444")

   

		<c:if test="${state==0}">
		  $("#msg").html("${message}");
		</c:if>

		<c:if test="${state==1}">
		$("#msg").html("${message}");
		
		setTimeout(function () {
        		location.href = "<%=basePath%>manage/index";
    			},1000);
		</c:if>
	</script>
	

</body>

</html>