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
            $('tabl1e').DataTable({
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


    





       
          
            <div class="row" style="padding-left:30px;padding-right:30px;">
              
<div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-th"></span> 品牌数据
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                              
                                </div>
                        </div>
                    </div>


                </div>
                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form">


                        <div class="am-u-sm-12 am-u-md-12">
                            
                            <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                        <tr>
                                            
                                            <th class="table-id">#</th>
                                            <th class="table-title">品牌名称</th>
                                            
                                            <th class="table-type">创建时间</th>
                                            <th class="table-set">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${requestScope.list }" var="u" varStatus="st">
                                     <tr>                                            
                                            <td>${st.index+1 }</td>
                                            <td>${u.title} </td>
                                            <td>${u.created} </td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <a href="<%=basePath %>cates/cates/edit?id=${u.id}" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</a>                                                        
                                                        <a href="<%=basePath %>cates/cates/delete?id=${u.id}"  class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</a>
                                                    </div>
                                                </div>
                                            </td>
                                      </tr>
                                     </c:forEach>
                                       
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            
                            
                        </div>
                    </div>
                </div>

            </div>
    </div>    </div>
    


        <!-- jQuery  -->

        <script src="<%=basePath %>static/assets/js/bootstrap.bundle.min.js"></script>
        <script src="<%=basePath %>static/assets/js/metisMenu.min.js"></script>
        <script src="<%=basePath %>static/assets/js/waves.min.js"></script>
        <script src="<%=basePath %>static/assets/js/jquery.slimscroll.min.js"></script>

        <script src="<%=basePath %>static/assets/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="<%=basePath %>static/assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

        <script src="<%=basePath %>static/assets/plugins/moment/moment.js"></script>
        <script src="<%=basePath %>static/assets/plugins/apexcharts/apexcharts.min.js"></script>        
        <script src="<%=basePath %>static/assets/pages/jquery.dashboard.init.js"></script>
        <!-- App js -->
        <script src="<%=basePath %>static/assets/js/app.js"></script>  
  <script src="<%=basePath%>source/scripts/window.js"></script>
  <script src="<%=basePath%>source/js.js"></script>
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
    <link href="<%=basePath %>static/toastr-master/toastr.min.css" rel="stylesheet" type="text/css" />        
        <script src="<%=basePath %>static/toastr-master/toastr.min.js"></script>
        <script>
        <c:if test="${!empty state }">
        toastr.${state}('${message}', '提示');
        setTimeout(function(){
        	window.location.href = "<%=basePath%>${url}";
        },1500)
        </c:if>
        </script>
</body>
</html>

