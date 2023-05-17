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
								
								<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="javascript:loadChart('areaspline');" >默认</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('line');" >折线图</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('bar');" >柱状图1</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('column');" >柱状图2</a></li>
    <li role="presentation" class="active"><a href="javascript:loadChart('area');" >面积图</a></li>
    

</ul>
								
								
									<div id="container" style="min-width:100%;height:400px"></div>	
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
        		location.href = "<%=basePath%>morder/list";
    			},1000);
		</c:if>
	</script>
</body>
<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
	<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
	<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
	<script>
	/**
  * Highcharts 在 4.2.0 开始已经不依赖 jQuery 了，直接用其构造函数既可创建图表
 **/
 loadChart("areaspline");
 function loadChart(type){
var chart = new Highcharts.Chart('container', {
	chart:{type:type},
    title: {
        text: '统计分析',
        x: -20
    },
    subtitle: {
        text: '',
        x: -20
    },
    xAxis: {
        categories: [ <c:forEach items="${list}" var="item">
        '${item.product_name}',
        </c:forEach>
        ]        
    },
    yAxis: {
        title: {
            text: '/'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: '#808080'
        }]
    },
    tooltip: {
        valueSuffix: '.'
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
    },
    series: [{
        name: '播放量',
        data: [<c:forEach items="${list}" var="item">
        ${item.click},
        </c:forEach>]
    },
    {
        name: '收藏数',
        data: [<c:forEach items="${list}" var="item">
        ${item.num},
        </c:forEach>]
    }
    ]
});
 }
</script>
</html>
