<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>-</title>


    <link type="text/css" href="<%=basePath%>static/sub/assets/css/vendor-morris.css" rel="stylesheet">
    <link type="text/css" href="<%=basePath%>static/sub/assets/css/vendor-bootstrap-datepicker.css" rel="stylesheet">

    <!-- Prevent the demo from appearing in search engines -->
    <meta name="robots" content="noindex">

    <!-- App CSS -->
    <link type="text/css" href="<%=basePath%>static/sub/assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="<%=basePath%>static/sub/assets/css/app.rtl.css" rel="stylesheet">

    <!-- Simplebar -->
    <link type="text/css" href="<%=basePath%>static/sub/assets/vendor/simplebar.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="<%=basePath%>static/animate.css">
<script src="<%=basePath%>static/js.js" charset="utf-8"></script>
<style>
body {
	overflow-x: hidden
}

body::-webkit-scrollbar { /*滚动条整体样式*/
	width: 5px; /*高宽分别对应横竖滚动条的尺寸*/
	height: 1px;
}

body::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	background: #EEE;
}

body::-webkit-scrollbar-track { /*滚动条里面轨道*/
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	background: #DDD;
}

.dataTables_filter input {
	border: 1px solid #ddd;
}
</style>
<script>
	$(document).ready(function() {
		$('table').DataTable({
			language : {
				"sProcessing" : "处理中...",
				"sLengthMenu" : "显示 _MENU_ 项结果",
				"sZeroRecords" : "没有匹配结果",
				"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索:",
				"sUrl" : "",
				"sEmptyTable" : "表中数据为空",
				"sLoadingRecords" : "载入中...",
				"sInfoThousands" : ",",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "上页",
					"sNext" : "下页",
					"sLast" : "末页"
				},
				"oAria" : {
					"sSortAscending" : ": 以升序排列此列",
					"sSortDescending" : ": 以降序排列此列"
				}
			}
		});

	});
</script>
</head>

<body data-type="index">


    





       
          
            <div class="row  am-u-md-4" style="padding-left:30px;padding-right:30px;">
              
<div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">

                        <span class="am-icon-pencil"></span> 更新类别

                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                                 <p class="am-text-danger">
                        ${message }</p>
                                </div>
                        </div>
                    </div>


                </div>
                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form">


                        <div class="am-u-sm-12 am-u-md-12">
                            <form class="am-form am-form-horizontal" action="<%=basePath %>infocate/infocate/update" method="POST">
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">类别名称</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="title" value="${model.title }" required placeholder="">
                                        <input type="hidden" name="id" value="${model.id }"/>
                                        <small></small>
                                    </div>
                                </div>

                                <input type="hidden" name="showtype" value="1">

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="submit" class="am-btn am-btn-primary">保存数据</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
    </div>    </div>
    


    <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
    <script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath %>static/assets/js/iscroll.js"></script>
    <script src="<%=basePath %>static/assets/js/app.js"></script>
    <script src="<%=basePath %>static/layer/layer.js"></script>
  <c:if test="${!empty message}">		
			<script>
			 var btn = $("#showMsgBtn", window.parent.document);
		       var msg = $("#msg", window.parent.document);
		       $(msg).val("${message}");
		       $(btn).click();
			//layer.alert("${message}",{icon: 1});
			</script>
		</c:if>
		
		
</body>

</html>
